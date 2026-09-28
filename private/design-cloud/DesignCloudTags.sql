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

 Date: 11/02/2026 11:10:21
*/


-- ----------------------------
-- Table structure for DesignCloudTags
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[guest].[DesignCloudTags]') AND type IN ('U'))
	DROP TABLE [guest].[DesignCloudTags]
GO

CREATE TABLE [guest].[DesignCloudTags] (
  [id] varchar(80) COLLATE Chinese_Taiwan_Stroke_CI_AS  NOT NULL,
  [name] varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS  NOT NULL,
  [pid] varchar(80) COLLATE Chinese_Taiwan_Stroke_CI_AS  NULL
)
GO

ALTER TABLE [guest].[DesignCloudTags] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of DesignCloudTags
-- ----------------------------
-- 父級分類 (pid 為 NULL)
INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'a2b4bd25-a152-4b8e-a5d0-cd7b3296777b', N'設計風格', NULL)
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'cc890981-dc35-4309-a787-c6fc19955af9', N'型式', NULL)
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'0a058142-c401-44ce-a12d-550b7c042dae', N'坪數', NULL)
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'3e3a76c5-2d74-4a1c-bf6a-a5a3c19c58f1', N'系列', NULL)
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'78079c8d-2557-4f25-937e-b298e5ec182c', N'設計顏色', NULL)
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'b0693eb2-26e3-4c76-a90f-b1ca9c099e31', N'預算', NULL)
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'db690913-057e-4a4e-9707-bec9d341bb49', N'尺寸', NULL)
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'3ad2ebdb-e972-4b74-aca9-892f892a9069', N'檯面', NULL)
GO

-- 子分類
INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'1c6b5caa-b587-416e-bd78-5c49711a420d', N'4坪以上', N'0a058142-c401-44ce-a12d-550b7c042dae')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'217edad9-ea06-4e6f-9055-3ecff7b8d365', N'一字型+中島   ', N'cc890981-dc35-4309-a787-c6fc19955af9')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'2a9e0432-9278-4ae2-b411-2787fbdb04c8', N'2坪~4坪', N'0a058142-c401-44ce-a12d-550b7c042dae')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'2dfe6fd8-af64-4dbe-9fd5-af52aa273cc2', N'其他', N'a2b4bd25-a152-4b8e-a5d0-cd7b3296777b')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'3c256fcd-cd7a-4797-8aeb-f4ec60bc1cdf', N'潮派廚房', N'3e3a76c5-2d74-4a1c-bf6a-a5a3c19c58f1')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'464bef87-99be-4a67-82fe-e0a6bc2e2f80', N'君璽廚房', N'3e3a76c5-2d74-4a1c-bf6a-a5a3c19c58f1')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'4b82baa6-7db8-4a9a-b62f-8045dae12dff', N'ㄇ字型', N'cc890981-dc35-4309-a787-c6fc19955af9')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'55668db5-5ab8-4443-80ca-c026a13f60e6', N'400CM以上', N'db690913-057e-4a4e-9707-bec9d341bb49')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'5d3d120a-815f-40ce-9504-32871bd3deed', N'美式風', N'a2b4bd25-a152-4b8e-a5d0-cd7b3296777b')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'66a57c2c-85ef-43f8-ace1-4329c53de3f9', N'現代風', N'a2b4bd25-a152-4b8e-a5d0-cd7b3296777b')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'68f3e587-7f68-49e5-ba65-a7ae95dbaccb', N'巧域廚房', N'3e3a76c5-2d74-4a1c-bf6a-a5a3c19c58f1')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'6911a52b-7c6e-456d-b763-3e0d36324ceb', N'深木紋色系', N'78079c8d-2557-4f25-937e-b298e5ec182c')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'6db73fd1-d81f-4bb4-9ae9-636e15cf7e13', N'跳色', N'78079c8d-2557-4f25-937e-b298e5ec182c')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'6fa792fb-e470-407c-b56c-31583bbb4f0c', N'ㄇ字型+中島   ', N'cc890981-dc35-4309-a787-c6fc19955af9')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'777aeeac-16a3-481c-baa1-d8523171cdc5', N'35萬~50萬元', N'b0693eb2-26e3-4c76-a90f-b1ca9c099e31')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'8093e440-e879-46ff-9dd8-a22f11227dca', N'50~65萬元', N'b0693eb2-26e3-4c76-a90f-b1ca9c099e31')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'8398dce0-efd5-4e4c-a53c-79fdd3bff4df', N'輕奢風', N'a2b4bd25-a152-4b8e-a5d0-cd7b3296777b')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'9e5465e2-80b9-4fe2-9d37-14ba1506fb4a', N'其他', N'3e3a76c5-2d74-4a1c-bf6a-a5a3c19c58f1')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'a44fd79a-e89f-4145-b4ce-e227e0916a47', N'鄉村廚房', N'3e3a76c5-2d74-4a1c-bf6a-a5a3c19c58f1')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'a6f03ef3-052b-4671-b965-cf40534df248', N'65萬元以上', N'b0693eb2-26e3-4c76-a90f-b1ca9c099e31')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'a972725b-c4e8-4314-a7a0-f242846edf0a', N'人造石', N'3ad2ebdb-e972-4b74-aca9-892f892a9069')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'af8692db-32b9-4389-a913-86b105b9bcbc', N'大廚廚房', N'3e3a76c5-2d74-4a1c-bf6a-a5a3c19c58f1')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'bba4c18b-4f62-4342-8a75-720a18950606', N'單色系(非白色)', N'78079c8d-2557-4f25-937e-b298e5ec182c')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'bee4784f-4ea5-461c-96e5-c32b15594c77', N'工業風', N'a2b4bd25-a152-4b8e-a5d0-cd7b3296777b')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'c6930689-b8f8-47ec-8e22-a2bdcf1682b1', N'25~35萬元', N'b0693eb2-26e3-4c76-a90f-b1ca9c099e31')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'cc9f7013-4d5b-4bbf-b2ff-9c1425029113', N'一字型', N'cc890981-dc35-4309-a787-c6fc19955af9')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'ccae778a-2dde-4eee-ae16-0777aebff9ca', N'300-400CM', N'db690913-057e-4a4e-9707-bec9d341bb49')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'd57de104-483c-4fca-8f83-9ef03743b6a1', N'櫻花石', N'3ad2ebdb-e972-4b74-aca9-892f892a9069')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'd69252db-e808-42d9-9b95-4f4fd52b45e1', N'卡沃石', N'3ad2ebdb-e972-4b74-aca9-892f892a9069')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'dbb242c9-f051-4856-8c77-71ef15f8f852', N'L型', N'cc890981-dc35-4309-a787-c6fc19955af9')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'dcaa32ea-b084-4928-bcd3-f7b010368796', N'童樂廚房', N'3e3a76c5-2d74-4a1c-bf6a-a5a3c19c58f1')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'e1ffbe85-d1ef-437a-bdb6-269ff5daec52', N'闔樂廚房', N'3e3a76c5-2d74-4a1c-bf6a-a5a3c19c58f1')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'e64ec1c6-1382-472e-a31b-0a3c32888eb8', N'L型+中島   ', N'cc890981-dc35-4309-a787-c6fc19955af9')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'e7d30800-ff5e-43d7-b7f4-9dcb61e59db3', N'臻美廚房', N'3e3a76c5-2d74-4a1c-bf6a-a5a3c19c58f1')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'e89dba49-57f4-44b9-a28a-4aef0e399536', N'鄉村風', N'a2b4bd25-a152-4b8e-a5d0-cd7b3296777b')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'ecf6d287-6e91-4aee-85be-b8b232064af0', N'北歐風', N'a2b4bd25-a152-4b8e-a5d0-cd7b3296777b')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'f42a3598-f528-4e1c-b80b-9331d0229bd8', N'淺木紋色系', N'78079c8d-2557-4f25-937e-b298e5ec182c')
GO

INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'fb77dd25-6bef-4f79-bdc2-156991d1ccb8', N'2坪以內', N'0a058142-c401-44ce-a12d-550b7c042dae')
GO
