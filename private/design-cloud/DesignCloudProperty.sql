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

 Date: 11/02/2026 11:10:12
*/


-- ----------------------------
-- Table structure for DesignCloudProperty
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[guest].[DesignCloudProperty]') AND type IN ('U'))
	DROP TABLE [guest].[DesignCloudProperty]
GO

CREATE TABLE [guest].[DesignCloudProperty] (
  [id] varchar(80) COLLATE Chinese_Taiwan_Stroke_CI_AS  NOT NULL,
  [caseId] varchar(80) COLLATE Chinese_Taiwan_Stroke_CI_AS  NOT NULL,
  [name] nvarchar(255) COLLATE Chinese_Taiwan_Stroke_CI_AS  NULL,
  [value] ntext COLLATE Chinese_Taiwan_Stroke_CI_AS  NULL,
  [sort] int  NULL
)
GO

ALTER TABLE [guest].[DesignCloudProperty] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of DesignCloudProperty
-- ----------------------------
INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'0085ae4a-511b-44bb-bd2e-3bf4d17a1bf7', N'346a9a54-8afa-4561-9893-190c614f068b', N'設計顏色', N'跳色', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'03667da2-2f6f-4d1b-8273-bf32d59cd5eb', N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'尺寸', N'400CM以上', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'04327a24-bc84-447d-bc46-c002970fbd22', N'346a9a54-8afa-4561-9893-190c614f068b', N'坪數', N'2坪~4坪', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'054f19c6-4cb4-4d46-ae17-2234be099eaa', N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'系列', N'巧域廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'07b8e12a-7a44-457e-977b-600d234599fc', N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'設計顏色', N'跳色', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'0acc0175-7d8c-4781-8b31-ef304feaef24', N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'型式', N'L型', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'0b8cf648-c6c9-4d3e-bb09-e238d09a397d', N'23abb27b-531d-4dd2-9476-a12847e6f410', N'系列', N'臻美廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'0c0dae95-6689-4818-b592-29421e29edeb', N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'尺寸', N'400CM以上', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'0cfd17e7-fe0e-4689-93ff-ca82cd67ab5f', N'346a9a54-8afa-4561-9893-190c614f068b', N'預算', N'65萬元以上', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'0e1f5dbc-4292-405a-812b-7f4d53bc6775', N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'型式', N'一字型+中島', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'0f932454-bbb4-4ad5-9f54-de2604b4d0bd', N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'型式', N'ㄇ字型', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'10d6372a-5d50-4073-b240-f1f1fafa9dd9', N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'設計顏色', N'深木紋色系', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'12135424-134b-482c-8f33-b52bc7d5b3c6', N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'檯面', N'櫻花石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'1265e9eb-a992-4a1c-b811-01c3dc53befe', N'7c016bf0-6327-47d3-b136-a18112934ee7', N'設計風格', N'輕奢風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'13758a4f-fa00-45c8-b054-179939a20d17', N'64d4f060-239e-4431-931e-9d643aee46ff', N'坪數', N'4坪以上', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'14fb266e-44bd-4ea1-92cb-c84c71c8254e', N'346a9a54-8afa-4561-9893-190c614f068b', N'型式', N'ㄇ字型+中島', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'159b18d7-7aea-4e64-aa7d-ba70c6e1af62', N'64d4f060-239e-4431-931e-9d643aee46ff', N'檯面', N'人造石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'15c3f289-a0df-41bc-bdbf-eeea331f83c4', N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'坪數', N'2坪-4坪', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'1b882bcb-fd6d-41f5-8635-3ce6ad458017', N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'設計風格', N'現代風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'1b9c14d4-07f6-4da8-a046-41407a57e36d', N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'檯面', N'人造石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'1c03d28a-9288-4487-8fe4-464185641e91', N'1b285159-1d13-422e-8ea3-caa87053b753', N'系列', N'君璽廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'1ccb90bb-6f2c-4e15-a6c5-64af60da43f6', N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'坪數', N'2-4坪', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'1cebed2e-9edd-4330-914c-64bf5c3c2882', N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'設計顏色', N'跳色', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'1e948dd1-4976-48f0-afb1-c88d52ba6810', N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'設計顏色', N'跳色', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'20cbd48d-6104-4d0e-a503-4a1991471e93', N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'尺寸', N'400CM以上', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'212cde23-eac3-4564-a622-60f90f903c7f', N'9dd35f53-312a-451d-b4ba-2703038dd030', N'設計顏色', N'跳色', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'2218a921-a72a-4954-9586-b76f8ee718b1', N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'尺寸', N'300-400CM', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'2311bcc5-c31c-4bb1-81c6-2473fb9139c1', N'23abb27b-531d-4dd2-9476-a12847e6f410', N'設計顏色', N'單色系(非白色)', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'2487fbda-9f71-4679-b810-2280bc85f2aa', N'64d4f060-239e-4431-931e-9d643aee46ff', N'設計風格', N'現代風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'24e1492c-5765-44ad-93ed-081814b40244', N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'預算', N'65萬元以上', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'26442cc6-4831-4a17-9c06-c746196796db', N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'型式', N'L型', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'2757a200-925b-4d08-8006-cedcebf94a13', N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'尺寸', N'300-400CM', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'2a1b6406-cc4b-4b1a-8858-496043cfd98e', N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'尺寸', N'400CM以上', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'2b31b58c-3d61-424f-afea-4111b6feb265', N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'檯面', N'櫻花石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'2d287366-0278-42d7-ae78-b2666cfd8d72', N'c7ea41d5-8905-443a-a920-76157baccc59', N'型式', N'一字型+中島', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'2e968614-a106-47fd-bce8-669ed153e858', N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'設計顏色', N'跳色', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'2eafe178-1bc3-431a-acd4-30e7c0e8c0af', N'9dd35f53-312a-451d-b4ba-2703038dd030', N'設計風格', N'輕奢風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'2f5688d0-009f-4252-9694-0369896cf93d', N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'尺寸', N'400CM以上', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'2ff429de-59bf-4a2d-9058-0324f4836394', N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'坪數', N'2坪-4坪', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'2ff8acdb-de7f-4f17-a6e6-a5bef7fbc03e', N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'型式', N'L型', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'3059971a-aa8c-434d-97ce-53be64bee28f', N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'尺寸', N'400CM以上', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'3269f0bb-1b49-4890-961c-d12bfd6e9636', N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'設計顏色', N'淺木紋色系', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'32a04911-0c7c-445f-b695-b251e0d9dd0d', N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'系列', N'大廚廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'32f40d94-9239-47f1-849c-743c882f701a', N'c7ea41d5-8905-443a-a920-76157baccc59', N'預算', N'35-50萬元', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'381ceea9-75e1-4ff2-b3f8-985c19051204', N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'預算', N'50-65萬元', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'383029d0-8af6-49c9-925e-aa7aa544f02a', N'c7ea41d5-8905-443a-a920-76157baccc59', N'檯面', N'人造石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'395b59c2-99e1-40a1-838a-ec8d931010bd', N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'坪數', N'2坪以內', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'39a77341-63dc-4c3b-8f01-071625f952d5', N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'坪數', N'2坪-4坪', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'3a0293bb-5169-449b-a23f-01050bab3298', N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'設計風格', N'現代風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'3a90c71b-da6c-449b-8783-74cc2c5afb3c', N'c7ea41d5-8905-443a-a920-76157baccc59', N'尺寸', N'400CM以上', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'3e6f3b9b-2f26-4c77-ae9d-9c489b8f937c', N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'預算', N'65萬元以上', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'3fa9ebd5-85cf-42ae-ba3b-aaf9264fb659', N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'檯面', N'人造石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'404d3eb0-efcd-4552-876a-cce0c30cabde', N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'檯面', N'櫻花石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'4082f054-10c0-4060-b986-ddea1c20876f', N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'設計風格', N'輕奢風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'40f38a71-c1f0-481a-80b0-0dea3244018d', N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'檯面', N'櫻花石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'42adab14-54d3-45f2-93ee-f86f322824e0', N'e206493f-4066-4133-9df7-b73264ecf135', N'系列', N'巧域廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'42cea4f8-ea6e-4a1b-9c03-980ad49ed206', N'6945ac57-3522-46ef-982e-d07a9578f58e', N'型式', N'一字型', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'432277c9-aa9b-461c-8c71-0037209af2c0', N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'型式', N'ㄇ字型', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'44057fc0-74a2-4506-9062-afe07a64d340', N'9dd35f53-312a-451d-b4ba-2703038dd030', N'預算', N'35-50萬元', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'4440edcf-6e69-4697-9eac-c93f144f6851', N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'預算', N'35-50萬元', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'450f189c-e7a6-47b1-887f-e1015ce3f13f', N'7c016bf0-6327-47d3-b136-a18112934ee7', N'坪數', N'4坪以上', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'46f21697-1f54-4c1a-8215-19c624685d07', N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'型式', N'L型', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'475725b8-b131-453e-b75d-243f0f17d121', N'1b285159-1d13-422e-8ea3-caa87053b753', N'設計顏色', N'跳色', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'4766c641-1540-44cf-87d8-372f66b50153', N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'預算', N'65萬元以上', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'48cab582-1a6b-4746-8a37-0b38652b9627', N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'設計風格', N'北歐風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'48f5fb3b-d591-461e-ab8b-7e2f50c6b905', N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'型式', N'L型+中島', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'48fe788b-176b-4d08-8a8d-9f23b6a3758b', N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'預算', N'65萬元以上', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'4aacfc9a-3305-4e03-b276-91bbad8ac45b', N'1b285159-1d13-422e-8ea3-caa87053b753', N'檯面', N'櫻花石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'4b625bb4-d678-4203-8a86-e3f4f0a227ce', N'7c016bf0-6327-47d3-b136-a18112934ee7', N'設計顏色', N'單色系(非白色)', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'4c54db9e-ed31-443d-956f-5c3ae30d0aa4', N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'設計風格', N'現代風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'4c82bcdc-051c-42bb-8c96-945cd4ae192f', N'c7ea41d5-8905-443a-a920-76157baccc59', N'設計風格', N'北歐風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'4e08f6ee-0ee1-4fe9-8e42-330f00a149f6', N'6945ac57-3522-46ef-982e-d07a9578f58e', N'預算', N'25-35萬元', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'4ec8cff2-03b8-4169-9cdf-18ec51fd583d', N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'設計風格', N'輕奢風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'4eec38a5-ee10-4ba7-83a2-73f84cc254f6', N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'系列', N'君璽廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'4efb3fe7-3a43-46b7-90c8-e6819ffb8993', N'c7ea41d5-8905-443a-a920-76157baccc59', N'坪數', N'2坪-4坪', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'510bf5ff-4f97-456a-b1dd-764d3cb8e527', N'64d4f060-239e-4431-931e-9d643aee46ff', N'預算', N'35-50萬元', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'5301d2cb-6e7d-4998-b9a8-904e343b348f', N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'設計風格', N'工業風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'53dd8466-32da-460c-b3a0-d26a63e7de8c', N'64d4f060-239e-4431-931e-9d643aee46ff', N'尺寸', N'300-400CM', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'53f479e7-5830-4d76-a856-c0f2018747ea', N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'預算', N'35-50萬元', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'547b8843-c9fa-4b75-a81e-af3f52d0160f', N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'坪數', N'4坪以上', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'5511d46d-ab8c-43af-b093-e3eb29706e5b', N'7c016bf0-6327-47d3-b136-a18112934ee7', N'預算', N'65萬元以上', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'55fcf57c-9760-4417-acd4-0fecc1b12a0e', N'e206493f-4066-4133-9df7-b73264ecf135', N'尺寸', N'400CM以上', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'568e779b-567e-4c2f-a228-2f47fd3aa68e', N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'系列', N'大廚廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'56bf4fb8-1b6c-4fa1-9976-1968c9e30354', N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'設計顏色', N'跳色', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'57b10b71-fb36-4555-be0c-799b52900596', N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'設計顏色', N'跳色', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'58fae137-e071-4306-ad4d-77a7f0f63026', N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'預算', N'35-50萬元', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'5a1b64d7-dad2-49c7-8476-286a15451450', N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'系列', N'君璽廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'5c58f6c2-16d1-4c35-ac99-a0547ef25594', N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'型式', N'ㄇ字型', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'5ff34027-6758-45e7-b50f-13bfa1e07777', N'64d4f060-239e-4431-931e-9d643aee46ff', N'系列', N'大廚廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'6113f602-e606-4dd2-b5e0-e21ffc66449f', N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'系列', N'其他', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'619020d7-3866-4eaa-88cf-7dcde76c55e9', N'd60e24e3-9568-4613-89b8-931007f21e47', N'型式', N'L型+中島', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'619b5c5f-11b8-4a65-9454-fd6b05254bee', N'7c016bf0-6327-47d3-b136-a18112934ee7', N'檯面', N'卡沃石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'6346c39a-1e57-4f19-a120-e658c2594612', N'd60e24e3-9568-4613-89b8-931007f21e47', N'系列', N'君璽廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'648588f6-d276-4e5f-a8a3-208d3ddb92d7', N'9dd35f53-312a-451d-b4ba-2703038dd030', N'坪數', N'2坪以內', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'64a9d639-1611-4e18-b751-9284853d0fdf', N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'預算', N'50-65萬元', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'663c45fe-04f2-43f4-bc47-8314c600d766', N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'坪數', N'2坪以內', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'66577aea-8b58-445c-8f72-a603474c0dcc', N'd60e24e3-9568-4613-89b8-931007f21e47', N'設計顏色', N'單色系(非白色)', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'670caea4-5840-4be5-a87d-23167e7b63a4', N'd60e24e3-9568-4613-89b8-931007f21e47', N'坪數', N'4坪以上', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'67fce08c-d5f0-4b87-ac42-01bf7f26f345', N'346a9a54-8afa-4561-9893-190c614f068b', N'系列', N'闔樂廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'68268425-9869-4d16-a83e-f0447b37b201', N'23abb27b-531d-4dd2-9476-a12847e6f410', N'預算', N'65萬元以上', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'689b4d93-2866-4112-be39-d6075e89057e', N'6945ac57-3522-46ef-982e-d07a9578f58e', N'設計風格', N'北歐風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'6cf5dda9-12a4-4b44-85db-a67b431699fc', N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'檯面', N'櫻花石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'6d003430-be7c-42fa-b664-3b1c17e24dbd', N'e206493f-4066-4133-9df7-b73264ecf135', N'預算', N'65萬元以上', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'6e035cea-7734-4cbf-8752-f2243eb2cd4f', N'346a9a54-8afa-4561-9893-190c614f068b', N'檯面', N'櫻花石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'72e10e06-eedc-4567-a110-dcf31af90f98', N'd60e24e3-9568-4613-89b8-931007f21e47', N'設計風格', N'輕奢風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'7458a2b0-2359-4996-9fcf-a599c90fa56a', N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'坪數', N'2坪以內', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'778f70c5-2971-4942-b647-29990b799ffe', N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'設計風格', N'北歐風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'7aa8b277-ba3c-4236-ba18-a94f77212744', N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'系列', N'童樂廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'7b5a4286-3f6c-47f8-bc04-f3fc0553a69d', N'6945ac57-3522-46ef-982e-d07a9578f58e', N'設計顏色', N'跳色', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'7d133d97-6403-4b79-8ffd-425773c6530e', N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'預算', N'65萬元以上', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'7f4809f4-a1e4-4c78-b704-b685d93c7938', N'9dd35f53-312a-451d-b4ba-2703038dd030', N'檯面', N'櫻花石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'80861eef-9783-45d4-935a-d349ed1200f7', N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'系列', N'巧域廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'81f78974-4b03-4245-a12e-39ecd6b63fa7', N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'預算', N'65萬元以上', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'8218dbdc-88c3-43e8-be5d-f696aad2c99d', N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'檯面', N'櫻花石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'836ea97f-334a-419a-9837-879af892e37e', N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'設計顏色', N'跳色', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'849965fb-12dc-4115-8edc-2a24cb931d0e', N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'設計顏色', N'淺木紋色系', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'859545e8-3829-4221-ad8c-5bb73fdb4cc2', N'1b285159-1d13-422e-8ea3-caa87053b753', N'坪數', N'4坪以上', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'86aa9124-ada2-43ac-a743-dc49564c52c6', N'c7ea41d5-8905-443a-a920-76157baccc59', N'設計顏色', N'淺木紋色系', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'886410d9-2036-47de-8298-17b3a4aca41d', N'd60e24e3-9568-4613-89b8-931007f21e47', N'預算', N'65萬元以上', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'899a2924-a623-4612-bbe2-aaf29c0abe68', N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'尺寸', N'400CM以上', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'89b51e5d-54e0-4a22-953d-457d9154311d', N'346a9a54-8afa-4561-9893-190c614f068b', N'尺寸', N'400CM以上', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'8bddcc71-1c76-4e61-85e3-7883f73e18dc', N'64d4f060-239e-4431-931e-9d643aee46ff', N'型式', N'L型+中島', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'8d44c261-5b21-4c7c-9bfd-6d6eb2036f2c', N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'型式', N'一字型', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'8d465e3d-766c-455d-aeb4-713709de69d1', N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'檯面', N'人造石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'8effe271-e2b3-4f38-8c66-f78507a5b267', N'64d4f060-239e-4431-931e-9d643aee46ff', N'設計顏色', N'跳色', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'90c12051-a347-40f4-a8f3-9e4fbf7faa7b', N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'尺寸', N'400CM以上', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'90de3f9e-dac1-4363-8f82-1d851d7e50d9', N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'設計顏色', N'跳色', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'91689ad1-2943-45ad-8606-a4584e4ced27', N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'預算', N'35-50萬', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'9198f8af-8ec4-455b-84e2-a64572f9e3aa', N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'型式', N'一字型', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'91d62774-047a-49ae-b637-456cb6b28f41', N'9dd35f53-312a-451d-b4ba-2703038dd030', N'型式', N'一字型', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'963306a3-7a64-4283-afe0-6d3714b03b0a', N'7c016bf0-6327-47d3-b136-a18112934ee7', N'型式', N'一字型+中島', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'9865be37-3601-4daf-a043-511a502ed323', N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'設計顏色', N'跳色', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'9952fd34-0be7-4c24-9705-75aea7d2cd59', N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'系列', N'童樂廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'9ae8cd89-d567-49fe-8319-a076d864cd95', N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'檯面', N'櫻花石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'9be0de2e-4587-4bfc-923f-4f4ba5f0af1d', N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'設計風格', N'北歐風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'a02cd9e4-f940-430f-98ec-098e9610a51b', N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'坪數', N'2坪-4坪', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'a0967f16-fec1-4f57-9804-255d5bec76ba', N'1b285159-1d13-422e-8ea3-caa87053b753', N'預算', N'65萬元以上', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'a1414940-2099-4bff-99a6-ffc65c627ea0', N'23abb27b-531d-4dd2-9476-a12847e6f410', N'設計風格', N'美式風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'a1c7579a-e82c-4fec-a134-75f178e7ee29', N'e206493f-4066-4133-9df7-b73264ecf135', N'設計顏色', N'跳色', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'aabb665b-322a-468f-85e4-af1860eb1499', N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'尺寸', N'300-400CM', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'adba6ca0-f31d-45a0-b19f-2f8ff3db76ba', N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'設計風格', N'輕奢風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'b1075174-c3f9-4019-8ba9-212fcc1fd36b', N'1b285159-1d13-422e-8ea3-caa87053b753', N'型式', N'一字型', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'b1311df4-92ec-4e0b-a805-2c06c5147c78', N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'系列', N'潮派廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'b23a3ccb-1742-40fb-8eb9-7278f6874993', N'23abb27b-531d-4dd2-9476-a12847e6f410', N'檯面', N'櫻花石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'b23f2031-1fdf-499f-896d-55745dda967c', N'd60e24e3-9568-4613-89b8-931007f21e47', N'檯面', N'卡沃石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'b2f8aae2-a707-4e41-990b-ad745a46d221', N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'坪數', N'4坪以上', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'b61fcb14-2311-4710-8715-d30046efe40b', N'23abb27b-531d-4dd2-9476-a12847e6f410', N'尺寸', N'400CM以上', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'b6f91797-bf2b-4eea-8b5e-f9747d28325d', N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'型式', N'ㄇ字型', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'b823dc07-c682-4a35-a56d-0383242ca07e', N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'坪數', N'2坪以內', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'b90f295a-fd39-4361-9fe8-12a7380689e7', N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'設計風格', N'鄉村風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'b9f1630a-d715-4dc9-9e43-79f81323242a', N'7c016bf0-6327-47d3-b136-a18112934ee7', N'系列', N'君璽廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'bbe0915a-b842-4239-95ef-8f68e2006979', N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'檯面', N'櫻花石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'bc767c4e-8b3c-42c6-8b48-c027409ec0a9', N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'坪數', N'2坪以內', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'befe17aa-e3a6-4ba3-ab75-3b3638eedfb6', N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'設計風格', N'其他', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'bf0d2539-de31-4b6d-82ca-b8e29bcea87a', N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'坪數', N'2坪-4坪', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'bf7a3c1e-9237-49e5-82d9-5c66ea6552ff', N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'設計顏色', N'跳色', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'c1651ba5-646c-4861-9925-032c88945b2a', N'9dd35f53-312a-451d-b4ba-2703038dd030', N'系列', N'巧域廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'c38b904f-a109-4a85-86fb-8c05b3e36007', N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'系列', N'大廚廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'c48df893-fc1e-4c4e-bf2a-0021cef96c01', N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'尺寸', N'400CM以上', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'c6fac598-9552-4917-bea1-550790cc0572', N'7c016bf0-6327-47d3-b136-a18112934ee7', N'尺寸', N'400CM以上', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'c7e380fb-4f74-43e8-b85d-9b4eb7d3fed3', N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'系列', N'童樂廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'c9f8fad3-6875-4d5a-955e-7dcdd25c04ea', N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'型式', N'L型', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'cc5ace43-2643-40ba-8bc9-1b16ee5499f4', N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'預算', N'50-65萬元', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'cd3a61bf-1cb7-450c-8d39-a2e137d5bfe1', N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'坪數', N'4坪以上', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'cd4709a5-8490-4445-96c5-a5153e1243d2', N'6945ac57-3522-46ef-982e-d07a9578f58e', N'檯面', N'人造石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'cdef69b2-2684-4e78-a092-2decdc971a82', N'6945ac57-3522-46ef-982e-d07a9578f58e', N'尺寸', N'400CM以上', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'cf2dfbb7-9152-4fb1-870b-da3425d5a0d9', N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'檯面', N'卡沃石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'cfa8368b-0180-49ea-9918-902e6657bb88', N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'設計顏色', N'跳色', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'd00f20f7-205a-4afe-b456-b4722446791c', N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'設計顏色', N'跳色', N'900')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'd1212d8b-93f8-4936-966d-7623ec87b4cb', N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'坪數', N'4坪以上', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'd2c83005-2185-4bc6-a8f2-726692cf9bb3', N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'型式', N'ㄇ字型', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'd2ca7f5f-9e42-420b-91fa-8aab2b2ccc05', N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'尺寸', N'400CM以上', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'd360795d-452e-4d4a-aea1-df42848595ba', N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'系列', N'鄉村廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'd8b1f5b5-d853-4550-9dad-2fdf1bec17e0', N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'尺寸', N'400CM以上', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'd8f03126-ca36-4c82-9f9c-1adf1a1accf3', N'e206493f-4066-4133-9df7-b73264ecf135', N'坪數', N'4坪以上', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'daa2430d-2d30-47b9-9ad5-d88fd445faca', N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'尺寸', N'400CM以上', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'dc316507-a054-420f-bb6c-ca3dccb9361d', N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'預算', N'65萬元以上', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'de585ddb-04a7-42c3-a429-dc9b6472e74d', N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'設計風格', N'輕奢風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'df056a86-c796-44c0-9fcc-972ee4c96ca6', N'6945ac57-3522-46ef-982e-d07a9578f58e', N'坪數', N'2坪以內', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'df66d921-3da2-4858-87b3-382f79172ba0', N'1b285159-1d13-422e-8ea3-caa87053b753', N'尺寸', N'400CM以上', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'e05af382-9ae0-4f85-a465-dd61b8cb3812', N'd60e24e3-9568-4613-89b8-931007f21e47', N'尺寸', N'400CM以上', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'e2555990-5593-4eec-b348-32e3712c17ef', N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'型式', N'L型+中島', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'e501235e-1361-4a04-bf60-4481a332cf87', N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'系列', N'巧域廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'eb144e64-55f2-426f-81b3-b75ae372c73b', N'1b285159-1d13-422e-8ea3-caa87053b753', N'設計風格', N'輕奢風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'eb199a8d-b4a8-4a48-86a1-7743f4e2561e', N'e206493f-4066-4133-9df7-b73264ecf135', N'設計風格', N'輕奢風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'ecd02a4f-61e9-46a5-8c04-30375b26ccc7', N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'系列', N'大廚廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'ed1b3b38-c3c0-4df1-b47f-3ab321248e76', N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'檯面', N'櫻花石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'ee41f983-5484-4302-805b-11a336bbe549', N'9dd35f53-312a-451d-b4ba-2703038dd030', N'尺寸', N'300-400CM', N'600')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'ee92e409-abbc-47cf-85ea-14184c23ade7', N'23abb27b-531d-4dd2-9476-a12847e6f410', N'坪數', N'4坪以上', N'500')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'eee8e605-f04b-49e9-932e-24e5580b148d', N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'設計風格', N'現代風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'f00adfee-97a6-469d-a5ec-a21813cef7da', N'e206493f-4066-4133-9df7-b73264ecf135', N'型式', N'一字型+中島', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'f082b908-c622-45db-adad-9ac4f8cc9f35', N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'預算', N'35-50萬元', N'400')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'f26495d6-9841-4a17-bfaf-8aca83cdba21', N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'檯面', N'櫻花石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'f307525f-8b6d-478e-af36-57c719021023', N'6945ac57-3522-46ef-982e-d07a9578f58e', N'系列', N'童樂廚房', N'800')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'f380619e-58df-4dc9-a24d-6784e189eed3', N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'設計風格', N'輕奢風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'f41a74e0-d22e-486d-b14a-24c49a945a73', N'23abb27b-531d-4dd2-9476-a12847e6f410', N'型式', N'L型+中島', N'700')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'f508e8d6-fbf5-41dd-85a3-d34a7bd68f6e', N'e206493f-4066-4133-9df7-b73264ecf135', N'檯面', N'櫻花石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'f6e42ac5-5ebf-46f3-9490-3d0ef63b4437', N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'檯面', N'卡沃石', N'300')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'fe340983-4bf9-45ca-8ccd-e80a68c9870d', N'346a9a54-8afa-4561-9893-190c614f068b', N'設計風格', N'現代風', N'1000')
GO

INSERT INTO [guest].[DesignCloudProperty] ([id], [caseId], [name], [value], [sort]) VALUES (N'fefeb01b-072a-476b-acaf-8007b96b9b57', N'c7ea41d5-8905-443a-a920-76157baccc59', N'系列', N'童樂廚房', N'800')
GO
