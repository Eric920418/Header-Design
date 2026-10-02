IF OBJECT_ID('cms.Documents') IS NULL CREATE TABLE cms.Documents (
 id nvarchar(160) PRIMARY KEY,title nvarchar(255) NOT NULL,category nvarchar(80) NOT NULL,route nvarchar(500) NOT NULL,
 schemaJson nvarchar(max) NOT NULL CHECK(ISJSON(schemaJson)=1),seedHash varchar(64) NULL,
 draftId uniqueidentifier NULL,publishedId uniqueidentifier NULL,revision int NOT NULL DEFAULT 1, updatedAt datetime2 NOT NULL DEFAULT SYSUTCDATETIME());
IF OBJECT_ID('cms.Versions') IS NULL CREATE TABLE cms.Versions (
 id uniqueidentifier PRIMARY KEY,documentId nvarchar(160) NOT NULL REFERENCES cms.Documents(id),body nvarchar(max) NOT NULL CHECK(ISJSON(body)=1), actor uniqueidentifier NULL,createdAt datetime2 NOT NULL DEFAULT SYSUTCDATETIME());
IF OBJECT_ID('cms.Users') IS NULL CREATE TABLE cms.Users (
 id uniqueidentifier PRIMARY KEY,email nvarchar(254) NOT NULL UNIQUE,name nvarchar(100) NOT NULL,password varchar(200) NOT NULL,
 role varchar(10) NOT NULL CHECK(role IN ('admin','editor')),disabled bit NOT NULL DEFAULT 0,mustChange bit NOT NULL DEFAULT 1,revision int NOT NULL DEFAULT 1);
IF OBJECT_ID('cms.Sessions') IS NULL CREATE TABLE cms.Sessions (
 id varchar(64) PRIMARY KEY,userId uniqueidentifier NOT NULL REFERENCES cms.Users(id),csrf varchar(64) NOT NULL,expiresAt datetime2 NOT NULL);
IF OBJECT_ID('cms.Media') IS NULL CREATE TABLE cms.Media (
 id uniqueidentifier PRIMARY KEY,name nvarchar(255) NOT NULL,alt nvarchar(500) NOT NULL DEFAULT '',category nvarchar(80) NOT NULL DEFAULT N'未分類',
 mime varchar(80) NOT NULL,size int NOT NULL,filename varchar(100) NOT NULL UNIQUE,hash varchar(64) NOT NULL,archived bit NOT NULL DEFAULT 0,revision int NOT NULL DEFAULT 1,createdAt datetime2 NOT NULL DEFAULT SYSUTCDATETIME());
IF OBJECT_ID('cms.MediaRefs') IS NULL CREATE TABLE cms.MediaRefs (
 mediaId uniqueidentifier NOT NULL REFERENCES cms.Media(id),versionId uniqueidentifier NOT NULL REFERENCES cms.Versions(id),PRIMARY KEY(mediaId,versionId));
IF OBJECT_ID('cms.Submissions') IS NULL CREATE TABLE cms.Submissions (
 id uniqueidentifier PRIMARY KEY,kind varchar(30) NOT NULL,body nvarchar(max) NOT NULL CHECK(ISJSON(body)=1),status nvarchar(20) NOT NULL DEFAULT N'待處理',note nvarchar(4000) NOT NULL DEFAULT '',
 requestKey varchar(64) NOT NULL UNIQUE,bodyHash varchar(64) NOT NULL,revision int NOT NULL DEFAULT 1,createdAt datetime2 NOT NULL DEFAULT SYSUTCDATETIME());
IF OBJECT_ID('cms.Comments') IS NULL CREATE TABLE cms.Comments (
 id uniqueidentifier PRIMARY KEY,route nvarchar(500) NOT NULL,name nvarchar(100) NOT NULL,email nvarchar(254) NOT NULL,website nvarchar(500) NOT NULL DEFAULT '',comment nvarchar(4000) NOT NULL,
 status nvarchar(20) NOT NULL DEFAULT N'待審核',consent nvarchar(100) NOT NULL,requestKey varchar(64) NOT NULL UNIQUE,bodyHash varchar(64) NOT NULL,revision int NOT NULL DEFAULT 1,createdAt datetime2 NOT NULL DEFAULT SYSUTCDATETIME());
IF OBJECT_ID('cms.Audit') IS NULL CREATE TABLE cms.Audit (
 sequence bigint IDENTITY PRIMARY KEY,actor uniqueidentifier NULL,action nvarchar(80) NOT NULL,subject nvarchar(255) NOT NULL,createdAt datetime2 NOT NULL DEFAULT SYSUTCDATETIME());
IF OBJECT_ID('cms.RateLimits') IS NULL CREATE TABLE cms.RateLimits (id varchar(64) PRIMARY KEY,hits int NOT NULL,until datetime2 NOT NULL);
IF COL_LENGTH('cms.Media','originUrl') IS NULL ALTER TABLE cms.Media ADD originUrl nvarchar(1000) NULL;
IF NOT EXISTS(SELECT 1 FROM sys.indexes WHERE name='cms_media_origin') EXEC('CREATE UNIQUE INDEX cms_media_origin ON cms.Media(originUrl) WHERE originUrl IS NOT NULL');
IF OBJECT_ID('cms.MediaBytes') IS NULL CREATE TABLE cms.MediaBytes (
 id uniqueidentifier PRIMARY KEY REFERENCES cms.Media(id) ON DELETE CASCADE, bytes varbinary(max) NOT NULL);
IF OBJECT_ID('cms.MediaUploads') IS NULL CREATE TABLE cms.MediaUploads (
 id uniqueidentifier PRIMARY KEY,userId uniqueidentifier NOT NULL REFERENCES cms.Users(id),name nvarchar(255) NOT NULL,mime varchar(80) NOT NULL,
 size int NOT NULL CHECK(size>0 AND size<=31457280),bytes varbinary(max) NOT NULL DEFAULT 0x,expiresAt datetime2 NOT NULL,
 mediaId uniqueidentifier NULL REFERENCES cms.Media(id));
