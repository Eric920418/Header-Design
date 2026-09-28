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

 Date: 11/02/2026 11:10:02
*/


-- ----------------------------
-- Table structure for DesignCloudCaseTags
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[guest].[DesignCloudCaseTags]') AND type IN ('U'))
	DROP TABLE [guest].[DesignCloudCaseTags]
GO

CREATE TABLE [guest].[DesignCloudCaseTags] (
  [caseId] varchar(80) COLLATE Chinese_Taiwan_Stroke_CI_AS  NOT NULL,
  [tagId] varchar(80) COLLATE Chinese_Taiwan_Stroke_CI_AS  NOT NULL
)
GO

ALTER TABLE [guest].[DesignCloudCaseTags] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of DesignCloudCaseTags
-- ----------------------------
INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'8398dce0-efd5-4e4c-a53c-79fdd3bff4df')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'6db73fd1-d81f-4bb4-9ae9-636e15cf7e13')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'464bef87-99be-4a67-82fe-e0a6bc2e2f80')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'dbb242c9-f051-4856-8c77-71ef15f8f852')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'55668db5-5ab8-4443-80ca-c026a13f60e6')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'1c6b5caa-b587-416e-bd78-5c49711a420d')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'a6f03ef3-052b-4671-b965-cf40534df248')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'd69252db-e808-42d9-9b95-4f4fd52b45e1')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'8398dce0-efd5-4e4c-a53c-79fdd3bff4df')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'6db73fd1-d81f-4bb4-9ae9-636e15cf7e13')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'68f3e587-7f68-49e5-ba65-a7ae95dbaccb')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'4b82baa6-7db8-4a9a-b62f-8045dae12dff')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'55668db5-5ab8-4443-80ca-c026a13f60e6')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'1c6b5caa-b587-416e-bd78-5c49711a420d')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'a6f03ef3-052b-4671-b965-cf40534df248')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'd57de104-483c-4fca-8f83-9ef03743b6a1')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'e206493f-4066-4133-9df7-b73264ecf135', N'8398dce0-efd5-4e4c-a53c-79fdd3bff4df')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'e206493f-4066-4133-9df7-b73264ecf135', N'6db73fd1-d81f-4bb4-9ae9-636e15cf7e13')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'e206493f-4066-4133-9df7-b73264ecf135', N'68f3e587-7f68-49e5-ba65-a7ae95dbaccb')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'e206493f-4066-4133-9df7-b73264ecf135', N'217edad9-ea06-4e6f-9055-3ecff7b8d365')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'e206493f-4066-4133-9df7-b73264ecf135', N'55668db5-5ab8-4443-80ca-c026a13f60e6')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'e206493f-4066-4133-9df7-b73264ecf135', N'1c6b5caa-b587-416e-bd78-5c49711a420d')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'e206493f-4066-4133-9df7-b73264ecf135', N'a6f03ef3-052b-4671-b965-cf40534df248')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'e206493f-4066-4133-9df7-b73264ecf135', N'd57de104-483c-4fca-8f83-9ef03743b6a1')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'9dd35f53-312a-451d-b4ba-2703038dd030', N'8398dce0-efd5-4e4c-a53c-79fdd3bff4df')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'9dd35f53-312a-451d-b4ba-2703038dd030', N'6db73fd1-d81f-4bb4-9ae9-636e15cf7e13')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'9dd35f53-312a-451d-b4ba-2703038dd030', N'68f3e587-7f68-49e5-ba65-a7ae95dbaccb')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'9dd35f53-312a-451d-b4ba-2703038dd030', N'cc9f7013-4d5b-4bbf-b2ff-9c1425029113')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'9dd35f53-312a-451d-b4ba-2703038dd030', N'ccae778a-2dde-4eee-ae16-0777aebff9ca')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'9dd35f53-312a-451d-b4ba-2703038dd030', N'fb77dd25-6bef-4f79-bdc2-156991d1ccb8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'9dd35f53-312a-451d-b4ba-2703038dd030', N'777aeeac-16a3-481c-baa1-d8523171cdc5')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'9dd35f53-312a-451d-b4ba-2703038dd030', N'd57de104-483c-4fca-8f83-9ef03743b6a1')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'66a57c2c-85ef-43f8-ace1-4329c53de3f9')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'6db73fd1-d81f-4bb4-9ae9-636e15cf7e13')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'af8692db-32b9-4389-a913-86b105b9bcbc')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'55668db5-5ab8-4443-80ca-c026a13f60e6')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'd60e24e3-9568-4613-89b8-931007f21e47', N'8398dce0-efd5-4e4c-a53c-79fdd3bff4df')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'd60e24e3-9568-4613-89b8-931007f21e47', N'bba4c18b-4f62-4342-8a75-720a18950606')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'd60e24e3-9568-4613-89b8-931007f21e47', N'464bef87-99be-4a67-82fe-e0a6bc2e2f80')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'd60e24e3-9568-4613-89b8-931007f21e47', N'e64ec1c6-1382-472e-a31b-0a3c32888eb8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'd60e24e3-9568-4613-89b8-931007f21e47', N'55668db5-5ab8-4443-80ca-c026a13f60e6')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'd60e24e3-9568-4613-89b8-931007f21e47', N'1c6b5caa-b587-416e-bd78-5c49711a420d')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'd60e24e3-9568-4613-89b8-931007f21e47', N'a6f03ef3-052b-4671-b965-cf40534df248')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'd60e24e3-9568-4613-89b8-931007f21e47', N'd69252db-e808-42d9-9b95-4f4fd52b45e1')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'8398dce0-efd5-4e4c-a53c-79fdd3bff4df')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'6db73fd1-d81f-4bb4-9ae9-636e15cf7e13')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'464bef87-99be-4a67-82fe-e0a6bc2e2f80')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'4b82baa6-7db8-4a9a-b62f-8045dae12dff')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'55668db5-5ab8-4443-80ca-c026a13f60e6')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'1c6b5caa-b587-416e-bd78-5c49711a420d')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'a6f03ef3-052b-4671-b965-cf40534df248')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'd57de104-483c-4fca-8f83-9ef03743b6a1')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'1b285159-1d13-422e-8ea3-caa87053b753', N'8398dce0-efd5-4e4c-a53c-79fdd3bff4df')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'1b285159-1d13-422e-8ea3-caa87053b753', N'6db73fd1-d81f-4bb4-9ae9-636e15cf7e13')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'1b285159-1d13-422e-8ea3-caa87053b753', N'464bef87-99be-4a67-82fe-e0a6bc2e2f80')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'1b285159-1d13-422e-8ea3-caa87053b753', N'cc9f7013-4d5b-4bbf-b2ff-9c1425029113')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'1b285159-1d13-422e-8ea3-caa87053b753', N'55668db5-5ab8-4443-80ca-c026a13f60e6')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'1b285159-1d13-422e-8ea3-caa87053b753', N'1c6b5caa-b587-416e-bd78-5c49711a420d')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'1b285159-1d13-422e-8ea3-caa87053b753', N'a6f03ef3-052b-4671-b965-cf40534df248')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'1b285159-1d13-422e-8ea3-caa87053b753', N'd57de104-483c-4fca-8f83-9ef03743b6a1')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'7c016bf0-6327-47d3-b136-a18112934ee7', N'8398dce0-efd5-4e4c-a53c-79fdd3bff4df')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'7c016bf0-6327-47d3-b136-a18112934ee7', N'bba4c18b-4f62-4342-8a75-720a18950606')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'7c016bf0-6327-47d3-b136-a18112934ee7', N'464bef87-99be-4a67-82fe-e0a6bc2e2f80')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'7c016bf0-6327-47d3-b136-a18112934ee7', N'217edad9-ea06-4e6f-9055-3ecff7b8d365')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'7c016bf0-6327-47d3-b136-a18112934ee7', N'55668db5-5ab8-4443-80ca-c026a13f60e6')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'7c016bf0-6327-47d3-b136-a18112934ee7', N'1c6b5caa-b587-416e-bd78-5c49711a420d')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'7c016bf0-6327-47d3-b136-a18112934ee7', N'a6f03ef3-052b-4671-b965-cf40534df248')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'7c016bf0-6327-47d3-b136-a18112934ee7', N'd69252db-e808-42d9-9b95-4f4fd52b45e1')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'8398dce0-efd5-4e4c-a53c-79fdd3bff4df')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'6db73fd1-d81f-4bb4-9ae9-636e15cf7e13')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'68f3e587-7f68-49e5-ba65-a7ae95dbaccb')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'e64ec1c6-1382-472e-a31b-0a3c32888eb8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'55668db5-5ab8-4443-80ca-c026a13f60e6')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'1c6b5caa-b587-416e-bd78-5c49711a420d')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'a6f03ef3-052b-4671-b965-cf40534df248')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'd57de104-483c-4fca-8f83-9ef03743b6a1')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'8398dce0-efd5-4e4c-a53c-79fdd3bff4df')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'6db73fd1-d81f-4bb4-9ae9-636e15cf7e13')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'68f3e587-7f68-49e5-ba65-a7ae95dbaccb')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'dbb242c9-f051-4856-8c77-71ef15f8f852')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'55668db5-5ab8-4443-80ca-c026a13f60e6')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'fb77dd25-6bef-4f79-bdc2-156991d1ccb8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'8093e440-e879-46ff-9dd8-a22f11227dca')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'd57de104-483c-4fca-8f83-9ef03743b6a1')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'ecf6d287-6e91-4aee-85be-b8b232064af0')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'6db73fd1-d81f-4bb4-9ae9-636e15cf7e13')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'dcaa32ea-b084-4928-bcd3-f7b010368796')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'dbb242c9-f051-4856-8c77-71ef15f8f852')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'55668db5-5ab8-4443-80ca-c026a13f60e6')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'fb77dd25-6bef-4f79-bdc2-156991d1ccb8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'777aeeac-16a3-481c-baa1-d8523171cdc5')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'd57de104-483c-4fca-8f83-9ef03743b6a1')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'ecf6d287-6e91-4aee-85be-b8b232064af0')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'6db73fd1-d81f-4bb4-9ae9-636e15cf7e13')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'dcaa32ea-b084-4928-bcd3-f7b010368796')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'e64ec1c6-1382-472e-a31b-0a3c32888eb8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'55668db5-5ab8-4443-80ca-c026a13f60e6')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'2a9e0432-9278-4ae2-b411-2787fbdb04c8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'a6f03ef3-052b-4671-b965-cf40534df248')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'd57de104-483c-4fca-8f83-9ef03743b6a1')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'ecf6d287-6e91-4aee-85be-b8b232064af0')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'6db73fd1-d81f-4bb4-9ae9-636e15cf7e13')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'dcaa32ea-b084-4928-bcd3-f7b010368796')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'4b82baa6-7db8-4a9a-b62f-8045dae12dff')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'55668db5-5ab8-4443-80ca-c026a13f60e6')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'fb77dd25-6bef-4f79-bdc2-156991d1ccb8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'8093e440-e879-46ff-9dd8-a22f11227dca')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'a972725b-c4e8-4314-a7a0-f242846edf0a')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'c7ea41d5-8905-443a-a920-76157baccc59', N'ecf6d287-6e91-4aee-85be-b8b232064af0')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'c7ea41d5-8905-443a-a920-76157baccc59', N'f42a3598-f528-4e1c-b80b-9331d0229bd8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'c7ea41d5-8905-443a-a920-76157baccc59', N'dcaa32ea-b084-4928-bcd3-f7b010368796')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'c7ea41d5-8905-443a-a920-76157baccc59', N'217edad9-ea06-4e6f-9055-3ecff7b8d365')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'c7ea41d5-8905-443a-a920-76157baccc59', N'55668db5-5ab8-4443-80ca-c026a13f60e6')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'c7ea41d5-8905-443a-a920-76157baccc59', N'2a9e0432-9278-4ae2-b411-2787fbdb04c8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'c7ea41d5-8905-443a-a920-76157baccc59', N'777aeeac-16a3-481c-baa1-d8523171cdc5')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'c7ea41d5-8905-443a-a920-76157baccc59', N'a972725b-c4e8-4314-a7a0-f242846edf0a')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'6945ac57-3522-46ef-982e-d07a9578f58e', N'ecf6d287-6e91-4aee-85be-b8b232064af0')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'6945ac57-3522-46ef-982e-d07a9578f58e', N'6db73fd1-d81f-4bb4-9ae9-636e15cf7e13')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'6945ac57-3522-46ef-982e-d07a9578f58e', N'dcaa32ea-b084-4928-bcd3-f7b010368796')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'6945ac57-3522-46ef-982e-d07a9578f58e', N'cc9f7013-4d5b-4bbf-b2ff-9c1425029113')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'6945ac57-3522-46ef-982e-d07a9578f58e', N'55668db5-5ab8-4443-80ca-c026a13f60e6')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'6945ac57-3522-46ef-982e-d07a9578f58e', N'fb77dd25-6bef-4f79-bdc2-156991d1ccb8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'6945ac57-3522-46ef-982e-d07a9578f58e', N'c6930689-b8f8-47ec-8e22-a2bdcf1682b1')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'6945ac57-3522-46ef-982e-d07a9578f58e', N'a972725b-c4e8-4314-a7a0-f242846edf0a')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'bee4784f-4ea5-461c-96e5-c32b15594c77')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'6911a52b-7c6e-456d-b763-3e0d36324ceb')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'3c256fcd-cd7a-4797-8aeb-f4ec60bc1cdf')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'4b82baa6-7db8-4a9a-b62f-8045dae12dff')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'55668db5-5ab8-4443-80ca-c026a13f60e6')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'2a9e0432-9278-4ae2-b411-2787fbdb04c8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'a6f03ef3-052b-4671-b965-cf40534df248')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'd57de104-483c-4fca-8f83-9ef03743b6a1')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'66a57c2c-85ef-43f8-ace1-4329c53de3f9')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'f42a3598-f528-4e1c-b80b-9331d0229bd8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'af8692db-32b9-4389-a913-86b105b9bcbc')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'cc9f7013-4d5b-4bbf-b2ff-9c1425029113')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'ccae778a-2dde-4eee-ae16-0777aebff9ca')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'fb77dd25-6bef-4f79-bdc2-156991d1ccb8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'777aeeac-16a3-481c-baa1-d8523171cdc5')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'd57de104-483c-4fca-8f83-9ef03743b6a1')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'346a9a54-8afa-4561-9893-190c614f068b', N'66a57c2c-85ef-43f8-ace1-4329c53de3f9')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'346a9a54-8afa-4561-9893-190c614f068b', N'6db73fd1-d81f-4bb4-9ae9-636e15cf7e13')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'346a9a54-8afa-4561-9893-190c614f068b', N'e1ffbe85-d1ef-437a-bdb6-269ff5daec52')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'346a9a54-8afa-4561-9893-190c614f068b', N'6fa792fb-e470-407c-b56c-31583bbb4f0c')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'346a9a54-8afa-4561-9893-190c614f068b', N'55668db5-5ab8-4443-80ca-c026a13f60e6')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'346a9a54-8afa-4561-9893-190c614f068b', N'2a9e0432-9278-4ae2-b411-2787fbdb04c8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'346a9a54-8afa-4561-9893-190c614f068b', N'a6f03ef3-052b-4671-b965-cf40534df248')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'346a9a54-8afa-4561-9893-190c614f068b', N'd57de104-483c-4fca-8f83-9ef03743b6a1')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'66a57c2c-85ef-43f8-ace1-4329c53de3f9')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'6db73fd1-d81f-4bb4-9ae9-636e15cf7e13')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'af8692db-32b9-4389-a913-86b105b9bcbc')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'4b82baa6-7db8-4a9a-b62f-8045dae12dff')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'55668db5-5ab8-4443-80ca-c026a13f60e6')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'2a9e0432-9278-4ae2-b411-2787fbdb04c8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'777aeeac-16a3-481c-baa1-d8523171cdc5')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'a972725b-c4e8-4314-a7a0-f242846edf0a')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'2dfe6fd8-af64-4dbe-9fd5-af52aa273cc2')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'6db73fd1-d81f-4bb4-9ae9-636e15cf7e13')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'9e5465e2-80b9-4fe2-9d37-14ba1506fb4a')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'cc9f7013-4d5b-4bbf-b2ff-9c1425029113')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'ccae778a-2dde-4eee-ae16-0777aebff9ca')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'2a9e0432-9278-4ae2-b411-2787fbdb04c8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'777aeeac-16a3-481c-baa1-d8523171cdc5')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'd57de104-483c-4fca-8f83-9ef03743b6a1')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'217edad9-ea06-4e6f-9055-3ecff7b8d365')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'fb77dd25-6bef-4f79-bdc2-156991d1ccb8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'8093e440-e879-46ff-9dd8-a22f11227dca')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'd57de104-483c-4fca-8f83-9ef03743b6a1')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'66a57c2c-85ef-43f8-ace1-4329c53de3f9')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'6db73fd1-d81f-4bb4-9ae9-636e15cf7e13')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'af8692db-32b9-4389-a913-86b105b9bcbc')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'dbb242c9-f051-4856-8c77-71ef15f8f852')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'ccae778a-2dde-4eee-ae16-0777aebff9ca')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'2a9e0432-9278-4ae2-b411-2787fbdb04c8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'777aeeac-16a3-481c-baa1-d8523171cdc5')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'a972725b-c4e8-4314-a7a0-f242846edf0a')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'e89dba49-57f4-44b9-a28a-4aef0e399536')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'f42a3598-f528-4e1c-b80b-9331d0229bd8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'a44fd79a-e89f-4145-b4ce-e227e0916a47')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'dbb242c9-f051-4856-8c77-71ef15f8f852')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'55668db5-5ab8-4443-80ca-c026a13f60e6')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'2a9e0432-9278-4ae2-b411-2787fbdb04c8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'a6f03ef3-052b-4671-b965-cf40534df248')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'd69252db-e808-42d9-9b95-4f4fd52b45e1')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'23abb27b-531d-4dd2-9476-a12847e6f410', N'5d3d120a-815f-40ce-9504-32871bd3deed')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'23abb27b-531d-4dd2-9476-a12847e6f410', N'bba4c18b-4f62-4342-8a75-720a18950606')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'23abb27b-531d-4dd2-9476-a12847e6f410', N'e7d30800-ff5e-43d7-b7f4-9dcb61e59db3')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'23abb27b-531d-4dd2-9476-a12847e6f410', N'e64ec1c6-1382-472e-a31b-0a3c32888eb8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'23abb27b-531d-4dd2-9476-a12847e6f410', N'55668db5-5ab8-4443-80ca-c026a13f60e6')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'23abb27b-531d-4dd2-9476-a12847e6f410', N'1c6b5caa-b587-416e-bd78-5c49711a420d')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'23abb27b-531d-4dd2-9476-a12847e6f410', N'a6f03ef3-052b-4671-b965-cf40534df248')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'23abb27b-531d-4dd2-9476-a12847e6f410', N'd57de104-483c-4fca-8f83-9ef03743b6a1')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'64d4f060-239e-4431-931e-9d643aee46ff', N'66a57c2c-85ef-43f8-ace1-4329c53de3f9')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'64d4f060-239e-4431-931e-9d643aee46ff', N'6db73fd1-d81f-4bb4-9ae9-636e15cf7e13')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'64d4f060-239e-4431-931e-9d643aee46ff', N'af8692db-32b9-4389-a913-86b105b9bcbc')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'64d4f060-239e-4431-931e-9d643aee46ff', N'e64ec1c6-1382-472e-a31b-0a3c32888eb8')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'64d4f060-239e-4431-931e-9d643aee46ff', N'ccae778a-2dde-4eee-ae16-0777aebff9ca')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'64d4f060-239e-4431-931e-9d643aee46ff', N'1c6b5caa-b587-416e-bd78-5c49711a420d')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'64d4f060-239e-4431-931e-9d643aee46ff', N'777aeeac-16a3-481c-baa1-d8523171cdc5')
GO

INSERT INTO [guest].[DesignCloudCaseTags] ([caseId], [tagId]) VALUES (N'64d4f060-239e-4431-931e-9d643aee46ff', N'a972725b-c4e8-4314-a7a0-f242846edf0a')
GO
