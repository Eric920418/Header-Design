/*
 Navicat Premium Data Transfer

 Source Server         : sakura官網(AWS)
 Source Server Type    : SQL Server
 Source Server Version : 12002000 (12.00.2000)
 Source Host           : SakuraWebDB2017:1433
 Source Catalog        : buy_prd
 Source Schema         : sync

 Target Server Type    : SQL Server
 Target Server Version : 12002000 (12.00.2000)
 File Encoding         : 65001

 Date: 19/03/2026 13:03:42
*/


-- ----------------------------
-- Table structure for BuyKitchenProductClass
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[sync].[BuyKitchenProductClass]') AND type IN ('U'))
	DROP TABLE [sync].[BuyKitchenProductClass]
GO

CREATE TABLE [sync].[BuyKitchenProductClass] (
  [product_id] int  NOT NULL,
  [product_class_id] int  NOT NULL
)
GO

ALTER TABLE [sync].[BuyKitchenProductClass] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of BuyKitchenProductClass
-- ----------------------------
INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'8', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'8', N'33')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'8', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'11', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'11', N'35')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'11', N'53')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'11', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'17', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'17', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'34', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'34', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'34', N'175')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'34', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'48', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'48', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'48', N'23')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'48', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'49', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'49', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'49', N'23')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'49', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'83', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'83', N'34')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'83', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'84', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'84', N'34')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'84', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'85', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'85', N'34')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'85', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'86', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'86', N'34')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'86', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'94', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'94', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'94', N'83236')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'95', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'95', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'95', N'83236')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'96', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'96', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'97', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'97', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'98', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'98', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'98', N'83236')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'99', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'99', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'99', N'83238')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'100', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'100', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'101', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'101', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'102', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'102', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'102', N'83237')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'103', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'103', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'103', N'83237')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'104', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'104', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'104', N'83238')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'105', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'105', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'106', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'106', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'107', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'107', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'107', N'83238')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'108', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'108', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'109', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'109', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'110', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'110', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'111', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'111', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'112', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'112', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'112', N'83236')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'113', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'113', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'114', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'114', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'114', N'83236')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'118', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'118', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'119', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'119', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'120', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'120', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'121', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'121', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'122', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'122', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'123', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'123', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'124', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'124', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'125', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'125', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'126', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'126', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'127', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'127', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'128', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'128', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'137', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'137', N'35')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'137', N'54')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'137', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'147', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'147', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'147', N'57')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'147', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'148', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'148', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'148', N'57')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'148', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'149', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'149', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'149', N'57')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'149', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'158', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'158', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'158', N'60')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'158', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'159', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'159', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'159', N'60')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'159', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'164', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'164', N'74')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'164', N'75')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'164', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'892', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'892', N'74')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'892', N'76')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'892', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'893', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'893', N'30')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'893', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'912', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'912', N'39')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'912', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'913', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'913', N'39')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'913', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'920', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'920', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'920', N'147')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'920', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'921', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'921', N'31')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'921', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'924', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'924', N'74')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'924', N'76')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'924', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'926', N'26')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'926', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'926', N'83235')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'926', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'929', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'929', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'929', N'20')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'929', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'930', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'930', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'930', N'175')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'930', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'932', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'932', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'932', N'176')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'932', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'939', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'939', N'31')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'939', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'940', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'940', N'35')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'940', N'53')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'940', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'941', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'941', N'74')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'941', N'75')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'941', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'942', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'942', N'39')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'942', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'944', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'944', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'944', N'153')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'944', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'946', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'946', N'31')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'946', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'952', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'952', N'35')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'952', N'163')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'952', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'953', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'953', N'74')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'953', N'165')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'953', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'954', N'26')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'954', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'954', N'83234')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'954', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'955', N'26')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'955', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'955', N'83235')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'955', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'958', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'958', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'958', N'23')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'958', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'963', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'963', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'963', N'83161')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'963', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'973', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'973', N'83230')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'973', N'83231')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'973', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'974', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'974', N'83230')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'974', N'83231')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'974', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'975', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'975', N'83229')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'975', N'83231')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'975', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'976', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'976', N'83229')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'976', N'83231')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'976', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'978', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'978', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'978', N'157')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'978', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'979', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'979', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'979', N'157')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'979', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'981', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'981', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'981', N'157')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'981', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'982', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'982', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'982', N'157')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'982', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'993', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'993', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'993', N'171')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'993', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'997', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'997', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'997', N'20')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'997', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'998', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'998', N'83229')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'998', N'83231')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'998', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'999', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'999', N'83229')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'999', N'83231')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'999', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1003', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1003', N'30')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1003', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1004', N'48')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1004', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1005', N'48')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1005', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1006', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1006', N'83114')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1006', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1007', N'172')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1007', N'173')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1010', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1010', N'40')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1010', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1012', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1012', N'31')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1012', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1013', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1013', N'31')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1013', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1014', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1014', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1014', N'164')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1014', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1015', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1015', N'83303')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1015', N'83307')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1018', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1018', N'40')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1018', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1019', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1019', N'40')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1019', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1022', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1022', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1022', N'166')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1022', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1023', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1023', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1023', N'166')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1023', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1025', N'162')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1025', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1027', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1027', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1027', N'164')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1027', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1028', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1028', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1028', N'164')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1028', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1033', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1033', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1033', N'23')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'1033', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70015', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70015', N'72006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70015', N'73007')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70027', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70027', N'72001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70027', N'73003')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70030', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70030', N'72001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70030', N'73002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70031', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70031', N'72001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70031', N'73004')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70039', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70039', N'73011')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70046', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70046', N'73034')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70047', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70047', N'73034')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70123', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70123', N'73034')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70124', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70124', N'73034')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70125', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70125', N'73034')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70127', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'70127', N'73034')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80080', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80080', N'82001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80080', N'83002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80083', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80083', N'82001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80083', N'83003')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80092', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80092', N'83010')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80100', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80100', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80100', N'83364')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80100', N'83364')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80101', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80101', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80101', N'83364')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80101', N'83364')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80102', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80102', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80102', N'83364')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80102', N'83364')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80103', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80103', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80103', N'83364')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80103', N'83364')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80104', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80104', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80104', N'83364')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80104', N'83364')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80134', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80134', N'83243')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80141', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80141', N'83013')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80142', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80142', N'83013')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80146', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80146', N'82001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80146', N'83002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80304', N'49')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80304', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80304', N'83307')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80339', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80339', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80339', N'164')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80339', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80351', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80351', N'40')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80351', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80365', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80365', N'83229')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80365', N'83231')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80365', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80377', N'83096')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80377', N'83103')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80378', N'83096')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80378', N'83103')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80379', N'83096')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80379', N'83103')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80380', N'83096')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80380', N'83103')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80381', N'83096')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80381', N'83103')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80393', N'83096')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80393', N'83115')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80394', N'83096')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80394', N'83115')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80395', N'83096')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80395', N'83115')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80396', N'83096')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80396', N'83115')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80401', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80401', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80401', N'83198')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80401', N'83198')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80402', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80402', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80402', N'83356')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80402', N'83356')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80434', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80434', N'34')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80434', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80623', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80623', N'30')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80623', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80625', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80625', N'35')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80625', N'53')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80625', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80627', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80627', N'74')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80627', N'75')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80627', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80628', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80628', N'30')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80628', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80630', N'83096')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80630', N'83189')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80640', N'83096')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80640', N'83190')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80659', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80659', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80659', N'83358')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80659', N'83358')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80660', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80660', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80660', N'83201')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80660', N'83201')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80661', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80661', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80661', N'83358')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80661', N'83358')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80662', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80662', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80662', N'83201')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80662', N'83201')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80663', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80663', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80663', N'83201')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80663', N'83201')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80667', N'83096')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80667', N'83115')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80794', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80794', N'83205')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80794', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80795', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80795', N'40')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80795', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80800', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80800', N'35')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80800', N'54')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80800', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80801', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80801', N'74')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80801', N'76')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80801', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80819', N'83096')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80819', N'83206')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80820', N'83096')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80820', N'83206')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80821', N'83096')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80821', N'83206')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80822', N'83096')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80822', N'83206')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80823', N'160')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80823', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80823', N'83307')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80833', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80833', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80833', N'83359')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80833', N'83359')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80839', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80839', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80839', N'83359')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80839', N'83359')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80844', N'46')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80844', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80844', N'83307')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80855', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80855', N'155')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80893', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80893', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80893', N'83359')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80893', N'83359')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80894', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80894', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80894', N'83362')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80894', N'83362')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80896', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80896', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80896', N'83197')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80896', N'83197')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80897', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80897', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80897', N'83197')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80897', N'83197')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80898', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80898', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80898', N'83197')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80898', N'83197')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80899', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80899', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80899', N'83197')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80899', N'83197')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80905', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80905', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80905', N'83359')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80905', N'83359')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80906', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80906', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80906', N'83362')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80906', N'83362')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80909', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80909', N'83204')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80909', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80909', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80912', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80912', N'83204')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80912', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80912', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80914', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80914', N'83204')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80914', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80914', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80917', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80917', N'83204')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80917', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80917', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80924', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80924', N'83204')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80924', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80924', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80928', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80928', N'72006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80928', N'73007')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80943', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80943', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80943', N'154')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80943', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80945', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80945', N'83006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80946', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80946', N'83006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80974', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80974', N'29')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80974', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80988', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80988', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80989', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80989', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80989', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80989', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80990', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80990', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80990', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80990', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80991', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80991', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80991', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80991', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80992', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80992', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80992', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80992', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80993', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80993', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80993', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80993', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80994', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80994', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80994', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80994', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80996', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80996', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80996', N'83218')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80996', N'83218')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80997', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80997', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80997', N'83218')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80997', N'83218')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80998', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80998', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80998', N'83218')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80998', N'83218')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80999', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80999', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80999', N'83219')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'80999', N'83219')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81003', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81003', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81003', N'83219')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81003', N'83219')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81007', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81007', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81007', N'83220')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81007', N'83220')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81008', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81008', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81008', N'83220')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81008', N'83220')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81009', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81009', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81009', N'83221')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81009', N'83221')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81010', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81010', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81010', N'83221')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81010', N'83221')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81011', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81011', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81011', N'83221')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81011', N'83221')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81013', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81013', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81013', N'83355')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81013', N'83355')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81014', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81014', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81014', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81014', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81015', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81015', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81015', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81015', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81017', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81017', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81017', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81017', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81018', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81018', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81018', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81018', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81024', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81024', N'41')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81029', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81029', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81029', N'83236')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81030', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81030', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81030', N'83236')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81031', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81031', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81031', N'83236')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81032', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81032', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81032', N'83236')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81033', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81033', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81033', N'83237')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81034', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81034', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81034', N'83237')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81035', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81035', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81035', N'83237')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81036', N'16')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81036', N'83240')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81036', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81036', N'83302')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81063', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81063', N'83204')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81063', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81063', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81078', N'49')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81078', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81078', N'83307')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81083', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81083', N'83006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81086', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81086', N'83006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81088', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81088', N'83006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81089', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81089', N'83006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81095', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81095', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81095', N'83244')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81096', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81096', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81096', N'83244')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81097', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81097', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81097', N'83244')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81098', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81098', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81098', N'83244')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81099', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81099', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81099', N'83244')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81100', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81100', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81100', N'83244')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81119', N'83246')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81120', N'83246')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81121', N'83246')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81125', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81125', N'72001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81125', N'73003')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81128', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81128', N'73014')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81129', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81129', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81129', N'83254')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81129', N'83254')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81130', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81130', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81130', N'83254')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81130', N'83254')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81139', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81139', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81139', N'83254')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81139', N'83254')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81140', N'83247')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81140', N'83247')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81140', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81140', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81141', N'83247')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81141', N'83247')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81141', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81141', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81142', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81142', N'42')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81144', N'83247')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81144', N'83247')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81144', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81144', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81145', N'83248')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81145', N'83248')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81145', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81145', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81146', N'83248')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81146', N'83248')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81146', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81146', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81147', N'83248')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81147', N'83248')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81147', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81147', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81148', N'83246')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81148', N'83246')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81148', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81148', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81149', N'83246')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81149', N'83246')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81149', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81149', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81150', N'83246')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81150', N'83246')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81150', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81150', N'83250')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81161', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81161', N'72006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81161', N'73007')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81164', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81164', N'72006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81164', N'73009')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81165', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81165', N'72006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81165', N'73009')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81167', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81167', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81167', N'83198')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81167', N'83198')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81168', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81168', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81168', N'83198')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81168', N'83198')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81169', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81169', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81169', N'83198')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81169', N'83198')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81175', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81175', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81175', N'83198')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81175', N'83198')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81176', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81176', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81176', N'83198')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81176', N'83198')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81177', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81177', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81177', N'83198')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81177', N'83198')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81180', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81180', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81180', N'83198')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81180', N'83198')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81181', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81181', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81181', N'83198')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81181', N'83198')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81183', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81183', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81183', N'83356')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81183', N'83356')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81184', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81184', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81184', N'83356')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81184', N'83356')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81186', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81186', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81186', N'83358')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81186', N'83358')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81188', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81188', N'32')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81188', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81191', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81191', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81191', N'83219')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81191', N'83219')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81196', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81196', N'40')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81196', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81199', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81199', N'82001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81199', N'83003')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81207', N'16')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81207', N'83271')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81207', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81207', N'83302')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81208', N'16')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81208', N'83271')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81208', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81208', N'83302')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81281', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81281', N'83010')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81282', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81282', N'83010')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81283', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81283', N'83242')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81284', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81284', N'29')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81284', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81287', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81287', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81287', N'83244')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81288', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81288', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81288', N'83282')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81288', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81302', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81302', N'24')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81302', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81302', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81303', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81303', N'24')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81303', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81303', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81304', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81304', N'24')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81304', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81304', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81305', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81305', N'24')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81305', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81305', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81306', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81306', N'24')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81306', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81306', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81307', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81307', N'24')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81307', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81307', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81308', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81308', N'24')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81308', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81308', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81309', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81309', N'29')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81309', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81310', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81310', N'42')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81361', N'162')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81361', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81362', N'162')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81362', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81373', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81373', N'42')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81374', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81374', N'73013')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81375', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81375', N'73013')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81376', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81376', N'73013')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81377', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81377', N'73013')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81379', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81379', N'73014')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81384', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81384', N'82001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81384', N'83002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81385', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81385', N'82001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81385', N'83002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81387', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81387', N'41')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81421', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81421', N'29')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81421', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81422', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81422', N'29')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81422', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81427', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81427', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81427', N'83236')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81428', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81428', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81428', N'83236')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81429', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81429', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81429', N'83236')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81430', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81430', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81430', N'83236')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81431', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81431', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81431', N'83236')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81432', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81432', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81432', N'83236')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81445', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81445', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81445', N'83236')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81481', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81481', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81481', N'83237')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81491', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81491', N'82001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81491', N'83005')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81497', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81497', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81497', N'157')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81497', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81500', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81500', N'83013')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81544', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81544', N'83013')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81545', N'162')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81545', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81546', N'162')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81546', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81547', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81547', N'40')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81547', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81548', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81548', N'82001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81548', N'83003')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81549', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81549', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81549', N'83357')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81549', N'83357')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81550', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81550', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81550', N'83357')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81550', N'83357')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81551', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81551', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81551', N'83357')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81551', N'83357')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81554', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81554', N'83010')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81582', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81582', N'25')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81582', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81582', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81584', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81584', N'25')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81584', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81584', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81586', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81586', N'156')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81586', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81587', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81587', N'156')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81587', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81588', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81588', N'29')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81588', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81591', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81591', N'72001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81591', N'73003')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81596', N'162')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81596', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81606', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81606', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81606', N'83244')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81607', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81607', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81607', N'83244')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81608', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81608', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81608', N'83244')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81609', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81609', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81609', N'83244')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81610', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81610', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81610', N'83244')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81611', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81611', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81611', N'83244')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81612', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81612', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81612', N'83244')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81615', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81615', N'72001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81615', N'73002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81616', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81616', N'72001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81616', N'73002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81618', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81618', N'25')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81618', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81618', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81619', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81619', N'25')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81619', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81619', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81620', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81620', N'83243')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81622', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81622', N'73013')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81623', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81623', N'73013')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81624', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81624', N'72001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81624', N'73003')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81629', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81629', N'72006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81629', N'73007')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81630', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81630', N'72006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81630', N'73007')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81632', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81632', N'72006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81632', N'73007')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81633', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81633', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81633', N'164')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81633', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81640', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81640', N'83013')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81643', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81643', N'83205')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81643', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81679', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81679', N'83013')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81684', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81684', N'35')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81684', N'54')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81684', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81685', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81685', N'74')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81685', N'76')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81685', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81687', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81687', N'42')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81688', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81688', N'42')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81689', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81689', N'42')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81690', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81690', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81690', N'83237')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81691', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81691', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81691', N'83237')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81692', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81692', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81692', N'83237')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81693', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81693', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81693', N'153')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81693', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81694', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81694', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81694', N'83198')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81694', N'83198')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81696', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81696', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81696', N'83198')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81696', N'83198')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81698', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81698', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81698', N'83201')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81698', N'83201')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81699', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81699', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81699', N'83201')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81699', N'83201')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81702', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81702', N'83006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81709', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81709', N'83006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81711', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81711', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81711', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81711', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81716', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81716', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81716', N'177')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81716', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81717', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81717', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81717', N'177')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81717', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81718', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81718', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81718', N'83094')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81718', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81719', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81719', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81719', N'83094')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81719', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81720', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81720', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81720', N'83094')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81720', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81755', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81755', N'74')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81755', N'76')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81755', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81756', N'83210')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81756', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81756', N'83307')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81757', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81757', N'82001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81757', N'83005')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81758', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81758', N'83010')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81759', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81759', N'83010')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81760', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81760', N'39')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81760', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81763', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81763', N'83006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81778', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81778', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81778', N'83191')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81778', N'83191')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81779', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81779', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81779', N'83363')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81779', N'83363')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81790', N'71001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81790', N'72006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81790', N'73007')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81791', N'162')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81791', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81792', N'162')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81792', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81829', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81829', N'83013')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81830', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81830', N'83242')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81833', N'162')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81833', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81834', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81834', N'40')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81834', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81835', N'48')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81835', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81836', N'48')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81836', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81838', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81838', N'83114')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81838', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81839', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81839', N'83313')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81839', N'83332')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81840', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81840', N'156')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81840', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81841', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81841', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81841', N'157')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81841', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81842', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81842', N'82001')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81842', N'83003')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81845', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81845', N'83006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81851', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81851', N'24')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81851', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81851', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81852', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81852', N'24')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81852', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81852', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81853', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81853', N'24')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81853', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81853', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81854', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81854', N'24')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81854', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81854', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81855', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81855', N'24')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81855', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81855', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81856', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81856', N'24')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81856', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81856', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81857', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81857', N'24')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81857', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81857', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81858', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81858', N'83313')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81858', N'83332')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81859', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81859', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81859', N'83237')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81859', N'83244')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81860', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81860', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81860', N'83237')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81860', N'83244')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81861', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81861', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81861', N'83237')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81861', N'83244')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81863', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81863', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81863', N'83244')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81863', N'83280')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81864', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81864', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81864', N'164')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81864', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81866', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81866', N'83314')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81866', N'83326')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81868', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81868', N'83324')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81869', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81869', N'83317')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81869', N'83330')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81870', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81870', N'83317')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81870', N'83330')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81872', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81872', N'83320')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81872', N'83336')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81873', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81873', N'83315')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81876', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81876', N'83319')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81876', N'83338')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81877', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81877', N'83205')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81877', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81878', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81878', N'83205')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81878', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81888', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81888', N'83204')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81888', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81888', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81890', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81890', N'83204')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81890', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81890', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81891', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81891', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81891', N'83282')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81891', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81893', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81893', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81893', N'83282')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81893', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81896', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81896', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81896', N'83282')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81896', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81897', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81897', N'83204')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81897', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81897', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81898', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81898', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81898', N'83282')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81898', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81899', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81899', N'83204')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81899', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81899', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81902', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81902', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81902', N'83282')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81902', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81903', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81903', N'41')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81904', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81904', N'83319')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81904', N'83338')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81905', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81905', N'83319')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81905', N'83338')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81906', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81906', N'83319')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81906', N'83338')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81907', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81907', N'83319')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81907', N'83338')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81908', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81908', N'83319')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81908', N'83338')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81909', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81909', N'83319')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81909', N'83338')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81910', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81910', N'83319')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81910', N'83338')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81911', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81911', N'83205')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81911', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81912', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81912', N'83205')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81912', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81913', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81913', N'41')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81915', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81915', N'83280')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81918', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81918', N'83319')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81918', N'83339')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81919', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81919', N'83319')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81919', N'83339')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81920', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81920', N'83319')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81920', N'83339')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81921', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81921', N'83319')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81921', N'83339')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81925', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81925', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81925', N'157')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81925', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81926', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81926', N'35')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81926', N'54')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81926', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81927', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81927', N'74')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81927', N'76')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81927', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81928', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81928', N'35')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81928', N'54')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81928', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81929', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81929', N'74')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81929', N'76')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81929', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81930', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81930', N'83317')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81930', N'83330')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81932', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81932', N'83205')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81932', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81933', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81933', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81933', N'83094')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81933', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81935', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81935', N'83013')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81936', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81936', N'83317')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81936', N'83330')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81937', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81937', N'83317')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81937', N'83330')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81938', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81938', N'83317')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81938', N'83330')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81939', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81939', N'83317')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81939', N'83330')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81942', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81942', N'83010')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81943', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81943', N'83006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81944', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81944', N'83010')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81945', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81945', N'83016')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81947', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81947', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81947', N'83200')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81947', N'83200')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81948', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81948', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81948', N'83200')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81948', N'83200')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81949', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81949', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81949', N'83200')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81949', N'83200')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81950', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81950', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81950', N'83200')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81950', N'83200')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81951', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81951', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81951', N'83200')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81951', N'83200')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81952', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81952', N'83100')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81952', N'83200')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81952', N'83200')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81954', N'46')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81954', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81954', N'83307')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81957', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81957', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81957', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81957', N'83343')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81958', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81958', N'83227')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81958', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81958', N'83343')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81960', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81960', N'83280')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81961', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81961', N'83280')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81962', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81962', N'83205')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81962', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81963', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81963', N'29')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81963', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81964', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81964', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81964', N'164')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81964', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81965', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81965', N'83006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81966', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81966', N'83010')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81967', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81967', N'83010')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81968', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81968', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81968', N'83236')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81969', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81969', N'83016')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81973', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81973', N'155')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81976', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81976', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81976', N'83194')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81976', N'83194')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81977', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81977', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81977', N'83194')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81977', N'83194')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81978', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81978', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81978', N'83194')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81978', N'83194')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81979', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81979', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81979', N'83194')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81979', N'83194')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81980', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81980', N'83006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81981', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81981', N'83349')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81982', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81982', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81982', N'83219')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81982', N'83219')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81986', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81986', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81986', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81986', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81992', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81992', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81992', N'83220')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81992', N'83220')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81993', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81993', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81993', N'83220')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81993', N'83220')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81994', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81994', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81994', N'83220')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81994', N'83220')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81995', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81995', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81995', N'83220')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81995', N'83220')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81996', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81996', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81996', N'83220')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81996', N'83220')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81997', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81997', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81997', N'83220')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81997', N'83220')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81998', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81998', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81998', N'83355')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'81998', N'83355')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82000', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82000', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82000', N'83355')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82000', N'83355')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82001', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82001', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82001', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82001', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82002', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82002', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82002', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82002', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82003', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82003', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82003', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82003', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82004', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82004', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82004', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82004', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82005', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82005', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82005', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82005', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82006', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82006', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82006', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82006', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82007', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82007', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82007', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82007', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82008', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82008', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82008', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82008', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82009', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82009', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82009', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82009', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82010', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82010', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82010', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82010', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82011', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82011', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82011', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82011', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82012', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82012', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82012', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82012', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82013', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82013', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82013', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82013', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82014', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82014', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82014', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82014', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82015', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82015', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82015', N'83354')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82015', N'83354')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82016', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82016', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82016', N'83354')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82016', N'83354')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82017', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82017', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82017', N'83354')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82017', N'83354')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82018', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82018', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82018', N'83354')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82018', N'83354')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82019', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82019', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82019', N'83354')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82019', N'83354')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82020', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82020', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82020', N'157')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82020', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82022', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82022', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82022', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82022', N'83258')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82023', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82023', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82023', N'83354')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82023', N'83354')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82024', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82024', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82024', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82024', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82025', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82025', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82025', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82025', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82026', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82026', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82026', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82026', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82027', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82027', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82027', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82027', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82028', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82028', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82028', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82028', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82029', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82029', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82029', N'83221')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82029', N'83221')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82030', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82030', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82030', N'83221')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82030', N'83221')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82031', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82031', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82031', N'83221')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82031', N'83221')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82032', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82032', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82032', N'83219')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82032', N'83219')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82033', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82033', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82033', N'83220')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82033', N'83220')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82034', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82034', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82034', N'83220')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82034', N'83220')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82035', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82035', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82035', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82035', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82036', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82036', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82036', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82036', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82037', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82037', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82037', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82037', N'83217')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82040', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82040', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82040', N'83353')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82040', N'83353')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82042', N'48')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82042', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82057', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82057', N'83314')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82057', N'83328')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82058', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82058', N'83320')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82058', N'83336')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82059', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82059', N'83324')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82060', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82060', N'83313')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82060', N'83333')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82061', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82061', N'83314')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82061', N'83327')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82062', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82062', N'83314')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82062', N'83327')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82063', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82063', N'83318')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82068', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82068', N'34')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82068', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82069', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82069', N'34')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82069', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82070', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82070', N'34')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82070', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82085', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82085', N'83349')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82086', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82086', N'42')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82087', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82087', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82088', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82088', N'41')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82089', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82089', N'41')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82090', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82090', N'41')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82091', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82091', N'41')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82092', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82092', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82096', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82096', N'83006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82099', N'49')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82099', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82099', N'83307')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82101', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82101', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82101', N'83244')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82102', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82102', N'45')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82102', N'83244')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82103', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82103', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82103', N'35')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82103', N'35')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82103', N'54')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82103', N'54')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82104', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82104', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82104', N'74')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82104', N'74')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82104', N'76')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82104', N'76')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82105', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82105', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82105', N'164')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82105', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82106', N'49')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82106', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82106', N'83307')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82110', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82110', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82110', N'157')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82110', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82111', N'7')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82111', N'37')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82111', N'157')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82111', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82112', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82112', N'83013')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82113', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82113', N'83006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82114', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82114', N'39')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82114', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82118', N'162')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82118', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82119', N'162')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82119', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82120', N'162')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82120', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82121', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82121', N'39')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82121', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82122', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82122', N'39')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82122', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82129', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82129', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82129', N'83094')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82129', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82131', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82131', N'83205')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82131', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82132', N'162')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82132', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82133', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82133', N'31')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82133', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82134', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82134', N'31')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82134', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82137', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82137', N'83313')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82137', N'83333')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82138', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82138', N'83313')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82138', N'83332')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82139', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82139', N'83006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82140', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82140', N'83010')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82143', N'162')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82143', N'83301')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82162', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82162', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82162', N'83094')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82162', N'83300')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82163', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82163', N'83010')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82164', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82164', N'83013')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82165', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82165', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82165', N'83194')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82165', N'83194')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82169', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82169', N'83006')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82170', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82170', N'83320')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82170', N'83335')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82171', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82171', N'83317')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82171', N'83367')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82172', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82172', N'83242')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82173', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82173', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82173', N'83194')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82173', N'83194')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82174', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82174', N'83384')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82174', N'83435')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82175', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82175', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82176', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82176', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82177', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82177', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82178', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82178', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82179', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82179', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82180', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82180', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82181', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82181', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82182', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82182', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82183', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82183', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82184', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82184', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82185', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82185', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82186', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82186', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82187', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82187', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82188', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82188', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82189', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82189', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82190', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82190', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82191', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82191', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82192', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82192', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82193', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82193', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82194', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82194', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82195', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82195', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82196', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82196', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82197', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82197', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82198', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82198', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82199', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82199', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82200', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82200', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82201', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82201', N'83386')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82202', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82202', N'83387')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82203', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82203', N'83387')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82204', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82204', N'83387')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82205', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82205', N'83387')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82206', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82206', N'83387')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82207', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82207', N'83388')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82208', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82208', N'83388')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82209', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82209', N'83388')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82210', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82210', N'83388')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82211', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82211', N'83388')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82212', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82212', N'83389')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82213', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82213', N'83389')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82214', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82214', N'83389')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82215', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82215', N'83389')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82216', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82216', N'83389')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82217', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82217', N'83389')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82218', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82218', N'83389')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82219', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82219', N'83389')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82220', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82220', N'83389')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82221', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82221', N'83390')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82222', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82222', N'83390')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82223', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82223', N'83390')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82224', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82224', N'83384')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82224', N'83435')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82225', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82225', N'83384')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82225', N'83435')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82226', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82226', N'83384')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82226', N'83435')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82227', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82227', N'83384')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82227', N'83435')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82228', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82228', N'83391')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82229', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82229', N'83391')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82230', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82230', N'83391')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82231', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82231', N'83391')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82232', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82232', N'83391')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82233', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82233', N'83391')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82234', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82234', N'83391')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82235', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82235', N'83392')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82236', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82236', N'83392')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82237', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82237', N'83393')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82238', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82238', N'83393')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82239', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82239', N'83394')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82240', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82240', N'83394')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82241', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82241', N'83394')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82242', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82242', N'83394')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82243', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82243', N'83394')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82244', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82244', N'83394')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82245', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82245', N'83394')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82246', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82246', N'83394')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82247', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82247', N'83394')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82248', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82248', N'83394')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82249', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82249', N'83396')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82250', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82250', N'83396')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82251', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82251', N'83396')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82252', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82252', N'83396')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82253', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82253', N'83384')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82253', N'83435')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82254', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82254', N'83396')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82255', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82255', N'83396')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82256', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82256', N'83396')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82257', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82257', N'83396')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82258', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82258', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82258', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82259', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82259', N'83396')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82260', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82260', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82260', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82261', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82261', N'83396')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82262', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82262', N'83396')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82263', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82263', N'83396')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82264', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82264', N'83396')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82265', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82265', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82265', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82266', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82266', N'83396')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82267', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82267', N'83396')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82268', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82268', N'83396')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82269', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82269', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82269', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82270', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82270', N'83396')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82271', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82271', N'83396')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82272', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82272', N'83397')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82273', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82273', N'83397')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82274', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82274', N'83398')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82275', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82275', N'83398')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82276', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82276', N'83398')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82277', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82277', N'83398')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82278', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82278', N'83398')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82279', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82279', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82279', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82280', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82280', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82280', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82281', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82281', N'83399')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82282', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82282', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82282', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82283', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82283', N'83399')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82284', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82284', N'83400')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82285', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82285', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82285', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82286', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82286', N'83400')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82287', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82287', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82287', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82288', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82288', N'83400')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82289', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82289', N'83400')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82290', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82290', N'83400')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82291', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82291', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82291', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82293', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82293', N'83400')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82294', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82294', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82294', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82295', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82295', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82295', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82296', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82296', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82296', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82297', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82297', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82297', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82298', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82298', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82298', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82299', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82299', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82299', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82300', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82300', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82300', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82301', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82301', N'83400')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82302', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82302', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82302', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82303', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82303', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82303', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82304', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82304', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82304', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82305', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82305', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82305', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82306', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82306', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82306', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82307', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82307', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82307', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82308', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82308', N'83400')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82309', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82309', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82309', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82310', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82310', N'83400')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82311', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82311', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82311', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82312', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82312', N'83420')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82312', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82313', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82313', N'83420')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82313', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82314', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82314', N'83420')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82314', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82315', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82315', N'83420')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82315', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82316', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82316', N'83420')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82316', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82317', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82317', N'83420')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82317', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82318', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82318', N'83420')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82318', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82319', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82319', N'83401')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82320', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82320', N'83420')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82320', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82321', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82321', N'83421')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82321', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82322', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82322', N'83421')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82322', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82323', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82323', N'83421')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82323', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82324', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82324', N'83421')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82324', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82325', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82325', N'83421')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82325', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82326', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82326', N'83421')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82326', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82327', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82327', N'83402')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82328', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82328', N'83421')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82328', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82329', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82329', N'83421')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82329', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82330', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82330', N'83421')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82330', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82331', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82331', N'83421')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82331', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82332', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82332', N'83402')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82333', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82333', N'83421')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82333', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82334', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82334', N'83402')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82335', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82335', N'83421')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82335', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82336', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82336', N'83421')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82336', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82337', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82337', N'83421')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82337', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82338', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82338', N'83402')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82339', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82339', N'83421')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82339', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82340', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82340', N'83402')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82341', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82341', N'83421')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82341', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82342', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82342', N'83402')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82343', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82343', N'83402')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82344', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82344', N'83421')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82344', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82345', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82345', N'83402')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82346', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82346', N'83402')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82347', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82347', N'83421')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82347', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82348', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82348', N'83404')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82349', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82349', N'83404')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82350', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82350', N'83422')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82350', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82351', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82351', N'83404')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82352', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82352', N'83422')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82352', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82353', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82353', N'83404')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82354', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82354', N'83404')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82355', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82355', N'83422')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82355', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82356', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82356', N'83404')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82357', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82357', N'83405')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82358', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82358', N'83422')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82358', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82359', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82359', N'83422')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82359', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82360', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82360', N'83422')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82360', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82361', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82361', N'83422')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82361', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82362', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82362', N'83422')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82362', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82363', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82363', N'83422')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82363', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82364', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82364', N'83422')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82364', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82365', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82365', N'83422')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82365', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82366', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82366', N'83422')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82366', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82367', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82367', N'83422')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82367', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82368', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82368', N'83422')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82368', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82369', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82369', N'83422')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82369', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82370', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82370', N'83422')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82370', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82371', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82371', N'83422')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82371', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82372', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82372', N'83422')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82372', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82373', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82373', N'83422')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82373', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82374', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82374', N'83422')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82374', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82375', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82375', N'83406')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82376', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82376', N'83406')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82377', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82377', N'83407')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82378', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82378', N'83407')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82379', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82379', N'83407')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82380', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82380', N'83407')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82381', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82381', N'83407')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82382', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82382', N'83407')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82383', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82383', N'83407')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82384', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82384', N'83407')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82385', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82385', N'83407')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82386', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82386', N'83408')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82387', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82387', N'83408')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82388', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82388', N'83408')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82389', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82389', N'83408')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82390', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82390', N'83408')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82391', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82391', N'83408')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82392', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82392', N'83408')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82393', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82393', N'83408')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82394', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82394', N'83408')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82395', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82395', N'83409')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82396', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82396', N'83409')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82397', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82397', N'83409')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82398', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82398', N'83409')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82399', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82399', N'83409')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82400', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82400', N'83409')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82401', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82401', N'83409')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82402', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82402', N'83409')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82403', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82403', N'83409')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82404', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82404', N'83410')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82405', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82405', N'83411')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82406', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82406', N'83412')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82407', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82407', N'83412')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82408', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82408', N'83412')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82409', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82409', N'83412')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82410', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82410', N'83412')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82411', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82411', N'83412')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82412', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82412', N'83412')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82413', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82413', N'83412')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82414', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82414', N'83412')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82415', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82415', N'83413')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82416', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82416', N'83413')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82417', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82417', N'83413')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82418', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82418', N'83413')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82419', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82419', N'83413')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82420', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82420', N'83413')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82421', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82421', N'83413')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82422', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82422', N'83413')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82423', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82423', N'83413')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82424', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82424', N'83423')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82424', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82425', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82425', N'83414')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82426', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82426', N'83414')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82427', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82427', N'83423')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82427', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82428', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82428', N'83415')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82429', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82429', N'83415')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82430', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82430', N'83415')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82431', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82431', N'83415')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82432', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82432', N'83415')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82433', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82433', N'83415')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82434', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82434', N'83415')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82435', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82435', N'83423')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82435', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82436', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82436', N'83423')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82436', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82437', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82437', N'83423')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82437', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82438', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82438', N'83416')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82439', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82439', N'83423')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82439', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82440', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82440', N'83416')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82441', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82441', N'83423')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82441', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82442', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82442', N'83423')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82442', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82443', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82443', N'83424')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82443', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82444', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82444', N'83424')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82444', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82445', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82445', N'83425')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82445', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82446', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82446', N'83425')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82446', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82447', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82447', N'83425')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82447', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82448', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82448', N'83425')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82448', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82449', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82449', N'83425')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82449', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82450', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82450', N'83425')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82450', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82451', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82451', N'83425')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82451', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82452', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82452', N'83425')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82452', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82453', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82453', N'83425')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82453', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82454', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82454', N'83425')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82454', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82455', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82455', N'83425')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82455', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82456', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82456', N'83425')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82456', N'83437')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82457', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82457', N'83426')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82457', N'83438')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82458', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82458', N'83427')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82458', N'83438')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82459', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82459', N'83428')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82459', N'83439')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82460', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82460', N'83428')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82460', N'83439')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82461', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82461', N'83428')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82461', N'83439')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82462', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82462', N'83428')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82462', N'83439')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82463', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82463', N'83428')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82463', N'83439')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82464', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82464', N'83428')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82464', N'83439')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82465', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82465', N'83428')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82465', N'83439')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82466', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82466', N'83395')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82467', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82467', N'83098')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82467', N'83362')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82467', N'83362')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82468', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82468', N'83314')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82468', N'83327')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82469', N'83377')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82469', N'83403')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82470', N'83097')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82470', N'83222')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82471', N'83378')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82471', N'83385')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82471', N'83436')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82472', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82472', N'83013')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82482', N'81002')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82482', N'83013')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82483', N'83312')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82483', N'83317')
GO

INSERT INTO [sync].[BuyKitchenProductClass] ([product_id], [product_class_id]) VALUES (N'82483', N'83367')
GO

