/*
 Navicat Premium Data Transfer

 Source Server         : ASPDB
 Source Server Type    : SQL Server
 Source Server Version : 12002000 (12.00.2000)
 Source Host           : ASPDB:1433
 Source Catalog        : KitchenLife
 Source Schema         : guest

 Target Server Type    : SQL Server
 Target Server Version : 12002000 (12.00.2000)
 File Encoding         : 65001

 Date: 11/02/2026 11:10:07
*/


-- ----------------------------
-- Table structure for DesignCloudFiles
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[guest].[DesignCloudFiles]') AND type IN ('U'))
	DROP TABLE [guest].[DesignCloudFiles]
GO

CREATE TABLE [guest].[DesignCloudFiles] (
  [caseId] varchar(80) COLLATE Chinese_Taiwan_Stroke_CI_AS  NOT NULL,
  [type] varchar(8) COLLATE Chinese_Taiwan_Stroke_CI_AS  NOT NULL,
  [url] nvarchar(154) COLLATE Chinese_Taiwan_Stroke_CI_AS  NOT NULL,
  [mainImage] bit  NOT NULL,
  [sort] int  NULL
)
GO

ALTER TABLE [guest].[DesignCloudFiles] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of DesignCloudFiles
-- ----------------------------
INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/41381db8-b788-45c9-8d3e-f08d9c0f36b9.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/d863929c-6a64-4328-8dfa-fac09c89c2c0.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/a9c52093-aa23-4bc5-b924-7dd7268a7ae3.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/20b71b7d-82ff-442e-a086-b02f6af595ae.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'7c016bf0-6327-47d3-b136-a18112934ee7', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/4e6cdd94-a853-430c-8b09-59973dad95b0.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'1b285159-1d13-422e-8ea3-caa87053b753', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/1716997c-9c93-4cb6-99cf-d112a3f5dc55.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/98754c70-918b-4bf3-a7c8-5b390b2c1ace.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'64d4f060-239e-4431-931e-9d643aee46ff', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/864dd973-0131-4146-9e3b-70c088203f53.jpg', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'd60e24e3-9568-4613-89b8-931007f21e47', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/41efcf4a-5e8b-410d-a3c0-ec4825833000.pdf', N'0', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/94ac09a0-1008-46c7-aa9b-142eddcb6e73.pdf', N'0', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/68fec833-f902-4aff-abf8-51ae34bbf744.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/21cca4ec-690d-4a5f-b522-fd7836d61928.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/3be4aac7-18e5-48c5-b8ec-e625ecf7d4c2.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/fd280dd6-3073-42e6-a2b7-5254fc711a36.PDF', N'0', N'5')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/16cfa04e-d420-4480-842b-6acdb64eadcc.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/888fc30c-13d7-4ad9-9cfc-e5fa51f07f98.PDF', N'0', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'e206493f-4066-4133-9df7-b73264ecf135', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/219e431a-ec20-41da-8d25-df3d9cd9cd12.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'9dd35f53-312a-451d-b4ba-2703038dd030', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/54224a64-cb45-49e8-bc98-2c4d5ed189ac.zip', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/9d1fd669-94b9-43f4-8619-6faf34101bb0.zip', N'0', N'5')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'6945ac57-3522-46ef-982e-d07a9578f58e', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/9b08110a-edd4-491e-9027-81a824ff86e8.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'c7ea41d5-8905-443a-a920-76157baccc59', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/1df8a6e7-0c0e-4bb4-8e7c-1a6638cc90d5.pdf', N'0', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/79467302-ed62-42ce-be65-5e843b3d3af3.pdf', N'0', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/6071040d-76b5-41ac-8cb9-59d93878dee8.zip', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/8b91a2a2-ba53-4ee0-b1e7-a1117b19da82.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/eddb3e55-2fed-4a36-aeff-e33069f537b3.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/1c127898-1b86-438a-9eb4-ed096a85fafd.zip', N'0', N'5')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/ad5665f5-2f4b-43ba-b4f8-84d130cd8e06.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/f4f2f75d-366c-4e3e-990b-0a9f10fee983.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/5f769f10-4256-42e6-bd95-fdbfce5619db.zip', N'0', N'5')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/cfa49621-9ce3-4954-a85c-0241b56bbff9.jpg', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'7c016bf0-6327-47d3-b136-a18112934ee7', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/d15b0583-656f-4baf-81d8-9a95681d0baa.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/07641f84-7f32-4806-95d1-554182d4aabe.jpg', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/c3448fba-85e5-4bd5-bda7-73263c69eb52.jpg', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'64d4f060-239e-4431-931e-9d643aee46ff', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/8d016933-37a0-4240-a456-075dc20cb050.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/0610c779-c0d1-4a9f-8196-546ea8b95bfb.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/df9a73b7-147e-4fcc-a3e9-c481744aa964.zip', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'c7ea41d5-8905-443a-a920-76157baccc59', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/ba8e430b-a998-483f-b9fe-ba302dd88b81.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/dfa8517a-6d97-476a-8aa1-9d9685138bc6.pdf', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/bd9951ab-a27f-46d9-9936-62e8f7d92745.pdf', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/5b7f4f80-cdb8-4ede-9b4b-1111c611422b.jpg', N'0', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'64d4f060-239e-4431-931e-9d643aee46ff', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/894e3e9a-5d3b-4863-b473-2c8792505b2c.jpg', N'1', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/c5391bc0-f697-49a6-861f-9f2bdf79c57f.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'7c016bf0-6327-47d3-b136-a18112934ee7', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/21ce1a6e-a95a-45b3-bcf5-3db8e544d376.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'346a9a54-8afa-4561-9893-190c614f068b', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/b334fb72-47df-4bd2-aa5e-9b379619b431.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'1b285159-1d13-422e-8ea3-caa87053b753', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/2f5607ec-933f-4311-96f5-5a231e0ed38d.jpg', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'9dd35f53-312a-451d-b4ba-2703038dd030', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/3688477e-6ca3-4375-b83a-b461d2262ac5.PDF', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/a6ac1487-d89b-4cbb-b11a-a000a968e6d9.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/104a087a-36c8-47a6-abe2-8de225240708.jpg', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/169dd2a8-6bc5-46a7-8af6-c5db224d4f1b.PDF', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'1b285159-1d13-422e-8ea3-caa87053b753', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/7aa2f5ab-11a6-4b15-a39e-d675d6f8427e.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'64d4f060-239e-4431-931e-9d643aee46ff', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/c17625e4-5c18-42fb-b1a6-24d7572e93c1.jpg', N'0', N'5')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/690c9367-8adb-4d4f-a324-089512d07670.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'346a9a54-8afa-4561-9893-190c614f068b', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/88a04b2a-4ed2-4def-8558-9c1b86566347.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'6945ac57-3522-46ef-982e-d07a9578f58e', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/06350b2e-f88d-4f51-9a69-d58367a65df8.zip', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'23abb27b-531d-4dd2-9476-a12847e6f410', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/a41279b2-046a-4b67-90b2-af121d1ae2ce.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/3b149152-e320-4302-885a-7139cf6f0a29.zip', N'0', N'6')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/9a8cc305-cf03-4f84-9fbd-a103b5170260.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/b1c65890-765e-4d5c-89cb-65045982432a.zip', N'0', N'6')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'd60e24e3-9568-4613-89b8-931007f21e47', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/02c9feb1-dec0-4d3c-9e7d-5f056678fd31.jpg', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/99a89c6e-8342-471a-8c5b-9a9572e374cf.jpg', N'0', N'5')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/fbe90508-76d6-430f-88e1-5f435e56c303.pdf', N'0', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/658e2bf2-f6f6-4123-861b-0a2f0f3c2dfc.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'1b285159-1d13-422e-8ea3-caa87053b753', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/67a932bc-e63f-40e4-a26d-809d4c51e394.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/c9017fa5-5b33-41c5-b666-51842e70c182.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/97375c0f-8701-4061-97ce-0bd3cac8f3d4.PDF', N'0', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/e80abf50-df8d-44a6-be39-2c4ada256a7a.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'd60e24e3-9568-4613-89b8-931007f21e47', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/30edfca4-0c88-43a4-bcb6-b2f2137e5386.zip', N'0', N'6')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/a957bc3d-a6b3-4ade-a85c-5cef02317f18.zip', N'0', N'6')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'd60e24e3-9568-4613-89b8-931007f21e47', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/ca67e74b-3242-4ebb-aa28-34caba8a934f.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'6945ac57-3522-46ef-982e-d07a9578f58e', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/d64b68f5-365f-4d9c-b2cd-5435928b895a.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/67bd1b94-ae9f-4e0d-969d-a4c615a9b208.jpg', N'0', N'5')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'e206493f-4066-4133-9df7-b73264ecf135', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/07ac33df-d616-48ec-9ee1-b0825140c2f7.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'd60e24e3-9568-4613-89b8-931007f21e47', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/86ef3591-dd8b-46f1-85af-2d5ba76b0ead.jpg', N'0', N'5')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'7c016bf0-6327-47d3-b136-a18112934ee7', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/4251fba6-6c00-40f2-969c-a5140d0f5655.pdf', N'0', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/25be573b-8944-47d5-91d4-792751d79c2b.zip', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/4e4d304f-7b00-4979-b998-dfea2c39ce49.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'346a9a54-8afa-4561-9893-190c614f068b', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/ef2988b4-f074-4c96-ba6c-a46c89d63a2c.zip', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'e206493f-4066-4133-9df7-b73264ecf135', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/564a1b9d-8a9e-44ea-bc42-936b08c34a5b.jpg', N'0', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'e206493f-4066-4133-9df7-b73264ecf135', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/0fb30851-58fb-491c-b4b6-3a0760fdea35.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/9e5d0dfb-67e2-4a20-bea2-21ecd9bf02dd.zip', N'0', N'5')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/9d2ec6d9-9a1c-4062-81f5-af891f33116a.zip', N'0', N'6')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/c12f013a-ddda-45a5-99cd-66f65a25713d.PDF', N'0', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/a05e3ad1-5083-42b4-8789-2cf9e1463948.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'64d4f060-239e-4431-931e-9d643aee46ff', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/32ae39df-ad08-4081-a748-6948128fcbda.jpg', N'0', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/1ea8b8cb-9421-4545-a4d1-4bb18068d37f.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/a097486e-6260-4246-b909-f5b6cf3f7e4a.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/abcfeaa5-2e8b-4206-bf32-e7c7e9d2ff5f.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'1b285159-1d13-422e-8ea3-caa87053b753', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/1a122cc0-17fc-4f8f-8e33-5daa747aeba6.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/5d1116d9-9330-4f18-be26-1078a816698f.zip', N'0', N'7')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'23abb27b-531d-4dd2-9476-a12847e6f410', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/9f0218fe-8bb7-4532-a82b-543c44fe5163.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/5acece94-014e-4c88-b2f2-87e66a5ae71d.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'9dd35f53-312a-451d-b4ba-2703038dd030', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/778c0436-b308-479d-a729-ac77dee9cd13.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/f705dfba-6055-4b6e-a4e6-0a9a8be9dbe4.jpg', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/40410dd5-7052-415b-829e-cf30ee654f65.zip', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/2957b120-dd24-4441-b105-e730bd7cafce.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/7ae37db1-6151-4b5a-a345-6ebcc7736136.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/0404fab8-7f06-4e8a-bac2-560bd581bbef.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'64d4f060-239e-4431-931e-9d643aee46ff', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/6f85a4bd-bf3c-4081-b11d-daa09448b779.zip', N'0', N'6')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/33b9f247-9670-47f3-bb1a-23217784aa9e.jpg', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/0dccfd27-5cb0-4cf9-9e08-3f3cf4793cf6.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'c7ea41d5-8905-443a-a920-76157baccc59', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/4dedfd15-035b-495e-82ef-971570b826f1.jpg', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/151c38ff-0a59-4148-bd87-f22fdea9b7e5.jpg', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/0d104bb0-9df1-4d82-88cd-696359ccb7d4.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/d3e64665-4324-4a40-93ff-a997abc2932a.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'c7ea41d5-8905-443a-a920-76157baccc59', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/a3ba90a8-6042-4d6a-8990-e7a2d0920270.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'e206493f-4066-4133-9df7-b73264ecf135', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/9de78a21-3e63-42d0-a71c-930878878e11.PDF', N'0', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/19b0a6e3-6752-4f64-94c3-b7c22af15cf1.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/ef630eed-5832-44a2-9405-b867c6a1355f.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/fd10134f-39c4-46d5-bb33-66a8b1bb132e.zip', N'0', N'5')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/b6f63c7e-db6d-474d-9ed2-17ac61f86ab3.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/3620303c-3aea-48cf-847f-3e1a2cfdf04d.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/69abf570-a38d-4be8-a108-7cd6e7329588.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'1b285159-1d13-422e-8ea3-caa87053b753', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/3594a649-de9e-479e-b572-2ca356896e3a.jpg', N'0', N'5')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'9dd35f53-312a-451d-b4ba-2703038dd030', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/5bd6c001-f22a-4fda-a9fc-def99a0ed8f1.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'64d4f060-239e-4431-931e-9d643aee46ff', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/992beed2-b120-410d-90df-6a6f166b7430.pdf', N'0', N'5')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/3928580b-0e68-41c2-8e9c-ab4d6d9de18c.PDF', N'0', N'5')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'346a9a54-8afa-4561-9893-190c614f068b', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/a04381ad-5805-4afe-a67a-b843679c56e7.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/38bb425c-9bee-4bbb-a9eb-d98e7d508b04.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'23abb27b-531d-4dd2-9476-a12847e6f410', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/50588011-6ab7-49de-9aae-dbad813174b4.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'346a9a54-8afa-4561-9893-190c614f068b', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/ab75506a-06e2-4b8b-a8a2-f86fb74d69c0.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/dc34b455-a6e6-4e8a-9338-520445b8980f.pdf', N'0', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/37690289-15ff-4602-a90c-f59b954fdcb2.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'6945ac57-3522-46ef-982e-d07a9578f58e', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/581d23ca-62b0-4549-ad90-b1d1f9e656b4.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'd60e24e3-9568-4613-89b8-931007f21e47', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/c5a11750-52cb-4cd0-9752-7dc3caf33861.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'9dd35f53-312a-451d-b4ba-2703038dd030', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/62ff043b-1c22-4a95-91c7-e54975a3772f.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/57a7a7b7-3a2e-4010-b9cd-770a9968f29c.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/47a82c38-d58f-47f5-9c31-21dc8e743912.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'c7ea41d5-8905-443a-a920-76157baccc59', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/a70d2ceb-7395-4a26-ba95-e199f05a7179.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/1fcc2991-8068-44e0-ace5-237c188e02fd.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/58cb2134-8e11-4554-be4a-e091e086b50c.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'6945ac57-3522-46ef-982e-d07a9578f58e', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/6e439d00-9d6d-40c7-9288-f0bfe9dd9c35.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/bd9be131-0324-48dd-a78f-f050d7c0b03a.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/65a34b66-f3c3-4ad2-a5ca-59541819ae92.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'7c016bf0-6327-47d3-b136-a18112934ee7', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/aa333a66-0772-49de-9781-091ac1e9d199.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'23abb27b-531d-4dd2-9476-a12847e6f410', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/d4d3a4a2-28da-4f0d-9b4b-c753415dea6b.pdf', N'0', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'346a9a54-8afa-4561-9893-190c614f068b', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/e6f4e942-ab58-470a-8baa-0e592383837f.pdf', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/173afc2d-f3dd-4e34-a118-a647f1566127.jpg', N'0', N'5')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/c082a6b1-facf-4203-8a23-4e3def7dd355.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'9dd35f53-312a-451d-b4ba-2703038dd030', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/9dd1ec9f-7e2d-474d-babb-a2ff1205e3af.jpg', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/e7adb0b5-1846-486e-9bf7-e716ab2e2a41.jpg', N'0', N'6')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/eaa408a4-0d3f-4dae-8d72-926395e82883.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'e206493f-4066-4133-9df7-b73264ecf135', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/0e24da56-1d1b-4028-907b-8ecb1cadb63a.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/8c0e48e7-bb67-446f-bd77-ae32af7927f8.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'7c016bf0-6327-47d3-b136-a18112934ee7', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/242b7020-9d74-4719-9c20-487b88329b93.zip', N'0', N'6')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/011436cc-681a-4932-a76a-a202a00b7871.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/fca6c245-319e-4ec6-8acf-b319ecbec413.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/f59be5af-c252-4373-8652-2b0853ae23b2.jpg', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'd60e24e3-9568-4613-89b8-931007f21e47', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/49f3a7a9-d57c-4e55-9fcc-5e47de72bf57.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'6945ac57-3522-46ef-982e-d07a9578f58e', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/a4c11a83-6714-4886-9bfb-30dbbbcf82f7.pdf', N'0', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/ebac261d-7d09-407d-8b73-973fc5147b42.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'e206493f-4066-4133-9df7-b73264ecf135', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/420d2add-7cb1-4164-9f7d-2a588b112577.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/2f38dc6b-8841-4753-b6b9-97bbb4f8dff3.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/57d22e17-f7b5-4ff0-b570-1397d277767d.jpg', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/e98c1885-97ce-4274-93eb-3a93f6353ba4.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'23abb27b-531d-4dd2-9476-a12847e6f410', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/22d9ca4f-05e3-4a88-97dd-ec1fab0ed8ce.zip', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/1dc297b4-d0de-47ff-89cb-7267ab93fabe.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/c18f9b64-2d78-4248-90aa-28c7e72932b6.PDF', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/3ff9ebfc-4750-4a9a-bf93-28c8db814f90.pdf', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/4216a514-05f4-4a07-8ac9-e0b545a8ef60.jpg', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/a7fa09f1-3c9f-41de-b538-ffac229d09d8.zip', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'd60e24e3-9568-4613-89b8-931007f21e47', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/3f11d71b-26f5-457b-8979-ea3d4040de57.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/9a2c3399-e389-498e-8e99-b704f8c1b36d.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/11125cbf-2494-4e2b-94ea-14b4741785bd.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'e206493f-4066-4133-9df7-b73264ecf135', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/2766c4a4-e85c-4222-bcae-fc02f0f9d04a.zip', N'0', N'2')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'9dd35f53-312a-451d-b4ba-2703038dd030', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/75410d7e-4b09-4e2b-bb33-84448a2e2511.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/a3ccb3a3-89a5-4a4c-a984-6622ca41e6f3.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'23abb27b-531d-4dd2-9476-a12847e6f410', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/e658cac7-7131-4e40-a545-a77c63cf27ef.jpg', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'1b285159-1d13-422e-8ea3-caa87053b753', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/b8f6d8d8-fe86-4d1b-aee9-a0550bb7d9b1.pdf', N'0', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'c7ea41d5-8905-443a-a920-76157baccc59', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/c89b45c0-8140-4705-b8fd-86a17db0089c.jpg', N'1', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'1b285159-1d13-422e-8ea3-caa87053b753', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/28e90761-b3ec-4b8a-904d-e6a729adba7e.zip', N'0', N'6')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'7c016bf0-6327-47d3-b136-a18112934ee7', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/8993babb-b7f1-48d4-b0a2-bd0b763e2273.jpg', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/4bae301a-9ab8-4d91-8c7b-f19c399ae91f.jpg', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/82b5719e-0352-45b9-ac2a-06c7d66fef75.jpg', N'0', N'5')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'c7ea41d5-8905-443a-a920-76157baccc59', N'CaseFile', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/38105e93-5198-4168-9ac8-606dc73f0b50.zip', N'0', N'5')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/341314d4-9bbc-4661-8de3-dfbabde8573e.jpg', N'0', N'1')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'23abb27b-531d-4dd2-9476-a12847e6f410', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/b41ac849-a3aa-438b-9f6f-9cfae2eb4d32.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/f0bf4d00-5b70-4857-984b-ad56d18d6c25.jpg', N'0', N'4')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/0cf0c8a3-7115-487b-8c42-07685a73b0ed.jpg', N'0', N'5')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'Pdf', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Other/d38e1ed0-966f-44d7-be6f-8c9719af58bd.pdf', N'0', N'0')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'7c016bf0-6327-47d3-b136-a18112934ee7', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/8a418462-5eb5-4ed6-bc9b-30ba09a236d3.jpg', N'0', N'5')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'64d4f060-239e-4431-931e-9d643aee46ff', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/167c3217-ff2d-43d0-99e9-b632ea939c1c.jpg', N'0', N'3')
GO

INSERT INTO [guest].[DesignCloudFiles] ([caseId], [type], [url], [mainImage], [sort]) VALUES (N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'Image', N'https://partner.sakura.com.tw/file/Kitchen/DesignCloud/Image/3de8e125-318b-4bd2-9ba8-b1e7b224c79b.jpg', N'0', N'4')
GO
