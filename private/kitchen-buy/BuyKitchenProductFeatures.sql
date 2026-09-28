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

 Date: 19/03/2026 13:03:48
*/


-- ----------------------------
-- Table structure for BuyKitchenProductFeatures
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[sync].[BuyKitchenProductFeatures]') AND type IN ('U'))
	DROP TABLE [sync].[BuyKitchenProductFeatures]
GO

CREATE TABLE [sync].[BuyKitchenProductFeatures] (
  [product_id] int  NOT NULL,
  [product_feature_id] int  NOT NULL
)
GO

ALTER TABLE [sync].[BuyKitchenProductFeatures] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of BuyKitchenProductFeatures
-- ----------------------------
INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'8', N'51')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'8', N'76')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'8', N'397')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'8', N'398')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'8', N'401')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'11', N'418')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'11', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'11', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'11', N'423')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'11', N'425')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'11', N'430')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'34', N'2')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'34', N'3')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'34', N'4')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'34', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'34', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'34', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'34', N'11')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'34', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'34', N'282')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'99', N'1917')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'99', N'1918')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'99', N'1919')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'112', N'1003')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'137', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'137', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'137', N'428')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'137', N'430')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'137', N'434')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'147', N'345')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'147', N'382')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'147', N'416')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'147', N'418')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'147', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'147', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'147', N'423')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'148', N'382')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'148', N'416')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'148', N'418')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'148', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'148', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'148', N'423')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'149', N'345')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'149', N'382')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'149', N'416')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'149', N'418')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'149', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'149', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'149', N'423')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'158', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'158', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'158', N'428')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'159', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'159', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'159', N'428')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'164', N'418')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'164', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'164', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'164', N'423')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'164', N'425')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'164', N'430')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'892', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'892', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'892', N'428')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'892', N'430')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'892', N'434')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'893', N'51')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'893', N'75')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'893', N'343')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'893', N'397')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'893', N'398')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'912', N'219')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'912', N'242')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'912', N'473')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'913', N'35')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'913', N'242')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'913', N'480')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'913', N'481')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'920', N'2')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'920', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'920', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'920', N'278')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'920', N'290')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'920', N'485')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'920', N'486')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'921', N'51')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'921', N'313')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'921', N'315')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'921', N'368')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'921', N'369')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'921', N'407')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'921', N'415')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'924', N'87')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'924', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'924', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'924', N'428')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'924', N'430')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'926', N'301')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'926', N'303')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'926', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'926', N'1238')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'926', N'1239')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'926', N'1240')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'929', N'4')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'929', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'929', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'929', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'929', N'15')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'929', N'16')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'929', N'390')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'929', N'667')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'929', N'1048')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'929', N'1049')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'930', N'3')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'930', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'930', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'930', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'930', N'11')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'930', N'281')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'930', N'282')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'930', N'651')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'930', N'1048')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'930', N'1049')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'932', N'3')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'932', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'932', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'932', N'11')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'932', N'282')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'932', N'284')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'932', N'285')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'932', N'651')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'932', N'1048')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'932', N'1049')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'939', N'51')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'939', N'318')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'939', N'319')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'939', N'368')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'939', N'369')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'939', N'407')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'939', N'415')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'940', N'416')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'940', N'418')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'940', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'940', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'940', N'423')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'940', N'425')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'940', N'430')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'941', N'416')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'941', N'418')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'941', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'941', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'941', N'423')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'941', N'425')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'941', N'430')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'942', N'218')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'942', N'242')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'942', N'473')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'944', N'97')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'944', N'100')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'944', N'103')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'944', N'345')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'944', N'348')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'944', N'419')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'944', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'944', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'946', N'321')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'946', N'322')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'946', N'323')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'946', N'324')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'946', N'325')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'946', N'327')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'952', N'417')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'952', N'418')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'952', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'952', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'952', N'423')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'952', N'426')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'952', N'430')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'952', N'431')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'953', N'417')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'953', N'418')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'953', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'953', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'953', N'423')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'953', N'426')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'953', N'429')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'953', N'430')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'954', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'954', N'1233')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'954', N'1234')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'954', N'1235')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'954', N'1236')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'954', N'1237')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'955', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'955', N'1235')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'955', N'1236')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'955', N'1237')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'955', N'1238')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'955', N'1248')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'963', N'3')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'963', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'963', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'963', N'9')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'963', N'10')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'963', N'11')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'963', N'13')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'963', N'281')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'963', N'651')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'973', N'1276')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'973', N'1277')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'973', N'1278')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'973', N'1279')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'973', N'1280')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'973', N'1283')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'973', N'1284')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'974', N'1277')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'974', N'1278')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'974', N'1279')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'974', N'1280')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'974', N'1281')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'974', N'1283')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'974', N'1284')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'975', N'1276')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'975', N'1277')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'975', N'1278')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'975', N'1280')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'975', N'1283')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'975', N'1284')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'976', N'1277')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'976', N'1278')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'976', N'1280')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'976', N'1281')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'976', N'1283')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'976', N'1284')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'978', N'97')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'978', N'100')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'978', N'345')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'978', N'419')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'978', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'978', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'978', N'423')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'979', N'97')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'979', N'100')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'979', N'348')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'979', N'419')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'979', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'979', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'979', N'423')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'979', N'426')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'981', N'97')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'981', N'100')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'981', N'348')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'981', N'419')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'981', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'981', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'981', N'543')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'982', N'97')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'982', N'100')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'982', N'348')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'982', N'419')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'982', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'982', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'982', N'427')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'993', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'993', N'286')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'993', N'287')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'993', N'288')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'993', N'290')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'993', N'387')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'993', N'487')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'993', N'651')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'997', N'4')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'997', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'997', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'997', N'14')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'997', N'15')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'997', N'16')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'997', N'390')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'997', N'667')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'997', N'1048')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'997', N'1049')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'998', N'1277')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'998', N'1278')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'998', N'1280')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'998', N'1281')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'998', N'1283')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'998', N'1284')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'999', N'1276')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'999', N'1277')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'999', N'1278')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'999', N'1280')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'999', N'1283')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'999', N'1284')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1003', N'51')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1003', N'72')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1003', N'73')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1003', N'75')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1003', N'343')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1003', N'397')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1003', N'398')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1004', N'196')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1004', N'198')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1004', N'200')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1004', N'201')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1004', N'203')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1004', N'436')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1004', N'437')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1004', N'438')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1005', N'198')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1005', N'200')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1005', N'201')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1005', N'203')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1005', N'258')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1005', N'436')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1005', N'437')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1005', N'438')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1006', N'238')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1006', N'242')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1006', N'471')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1006', N'472')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1006', N'473')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1006', N'475')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1010', N'218')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1010', N'242')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1010', N'472')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1010', N'473')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1010', N'476')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1010', N'477')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1012', N'51')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1012', N'330')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1012', N'331')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1012', N'415')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1013', N'51')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1013', N'330')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1013', N'332')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1013', N'415')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1014', N'83')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1014', N'372')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1014', N'373')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1014', N'416')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1014', N'417')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1014', N'418')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1014', N'420')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1014', N'432')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1015', N'180')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1015', N'181')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1015', N'186')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1015', N'439')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1015', N'440')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1015', N'441')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1015', N'442')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1018', N'242')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1018', N'472')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1018', N'473')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1018', N'476')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1018', N'477')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1018', N'478')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1018', N'479')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1019', N'242')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1019', N'472')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1019', N'473')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1019', N'476')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1019', N'477')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1019', N'478')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1019', N'479')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1022', N'2')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1022', N'3')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1022', N'4')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1022', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1022', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1022', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1022', N'11')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1022', N'280')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1022', N'1048')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1022', N'1049')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1023', N'3')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1023', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1023', N'6')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1023', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1023', N'11')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1023', N'280')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1023', N'281')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1023', N'282')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1023', N'651')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1023', N'1048')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1023', N'1049')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1025', N'445')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1025', N'446')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1025', N'447')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1025', N'448')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1025', N'450')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1025', N'451')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1027', N'97')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1027', N'345')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1027', N'417')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1027', N'418')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1027', N'419')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1027', N'420')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1027', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1027', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1028', N'97')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1028', N'345')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1028', N'417')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1028', N'418')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1028', N'419')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1028', N'420')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1028', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'1028', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80080', N'848')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80080', N'849')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80080', N'850')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80080', N'851')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80080', N'852')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80083', N'137')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80083', N'855')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80083', N'856')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80083', N'857')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80083', N'858')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80083', N'859')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80092', N'829')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80092', N'830')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80092', N'831')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80092', N'832')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80092', N'833')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80092', N'834')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80100', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80100', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80100', N'779')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80100', N'779')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80101', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80101', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80101', N'779')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80101', N'779')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80101', N'1599')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80101', N'1599')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80102', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80102', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80102', N'779')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80102', N'779')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80103', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80103', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80103', N'779')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80103', N'779')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80104', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80104', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80104', N'779')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80104', N'779')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80134', N'890')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80134', N'891')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80134', N'892')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80134', N'893')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80134', N'894')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80134', N'895')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80134', N'896')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80134', N'897')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80134', N'898')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80134', N'899')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80134', N'901')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80141', N'198')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80141', N'203')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80141', N'873')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80141', N'874')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80141', N'875')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80141', N'876')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80141', N'877')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80141', N'878')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80142', N'198')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80142', N'203')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80142', N'873')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80142', N'876')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80142', N'1027')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80142', N'1080')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80146', N'848')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80146', N'849')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80146', N'853')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80146', N'854')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80304', N'360')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80304', N'361')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80304', N'362')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80304', N'363')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80304', N'364')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80304', N'365')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80339', N'372')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80339', N'373')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80339', N'375')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80339', N'376')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80339', N'377')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80339', N'382')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80339', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80351', N'242')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80351', N'472')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80351', N'473')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80351', N'476')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80365', N'1276')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80365', N'1278')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80365', N'1280')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80401', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80401', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80401', N'526')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80401', N'526')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80401', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80401', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80401', N'780')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80401', N'780')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80401', N'788')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80401', N'788')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80401', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80401', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80401', N'799')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80401', N'799')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80402', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80402', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80402', N'536')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80402', N'536')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80402', N'779')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80402', N'779')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80402', N'787')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80402', N'787')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80402', N'793')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80402', N'793')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80402', N'798')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80402', N'798')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80623', N'51')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80623', N'75')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80623', N'397')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80623', N'398')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80623', N'674')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80623', N'675')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80625', N'348')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80625', N'418')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80625', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80625', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80625', N'425')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80625', N'430')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80625', N'543')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80625', N'544')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80627', N'418')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80627', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80627', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80627', N'423')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80627', N'425')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80627', N'430')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80627', N'543')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80627', N'544')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80628', N'51')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80628', N'75')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80628', N'343')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80628', N'397')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80628', N'398')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80659', N'555')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80659', N'555')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80659', N'556')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80659', N'556')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80659', N'790')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80659', N'790')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80659', N'796')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80659', N'796')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80660', N'552')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80660', N'552')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80660', N'555')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80660', N'555')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80660', N'791')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80660', N'791')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80660', N'793')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80660', N'793')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80661', N'555')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80661', N'555')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80661', N'556')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80661', N'556')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80661', N'790')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80661', N'790')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80661', N'796')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80661', N'796')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80662', N'555')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80662', N'555')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80662', N'561')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80662', N'561')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80662', N'792')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80662', N'792')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80662', N'793')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80662', N'793')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80662', N'799')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80662', N'799')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80663', N'555')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80663', N'555')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80663', N'561')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80663', N'561')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80663', N'792')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80663', N'792')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80663', N'793')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80663', N'793')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80663', N'799')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80663', N'799')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80794', N'51')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80794', N'599')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80794', N'600')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80794', N'601')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80794', N'602')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80794', N'603')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80795', N'245')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80795', N'246')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80795', N'247')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80795', N'593')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80795', N'595')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80800', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80800', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80800', N'604')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80800', N'605')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80800', N'606')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80800', N'607')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80800', N'608')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80800', N'609')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80801', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80801', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80801', N'604')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80801', N'606')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80801', N'607')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80801', N'608')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80823', N'173')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80823', N'621')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80823', N'622')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80823', N'623')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80823', N'624')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80823', N'625')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80823', N'626')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80823', N'627')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80833', N'521')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80833', N'521')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80833', N'547')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80833', N'547')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80833', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80833', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80833', N'719')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80833', N'719')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80833', N'720')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80833', N'720')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80833', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80833', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80839', N'521')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80839', N'521')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80839', N'523')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80839', N'523')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80839', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80839', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80839', N'719')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80839', N'719')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80839', N'720')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80839', N'720')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80839', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80839', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80844', N'173')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80844', N'625')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80844', N'626')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80844', N'633')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80844', N'634')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80844', N'635')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80855', N'137')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80855', N'465')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80855', N'467')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80855', N'638')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80855', N'640')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80855', N'641')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80855', N'642')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80855', N'643')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80855', N'817')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80893', N'521')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80893', N'521')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80893', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80893', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80893', N'632')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80893', N'632')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80893', N'719')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80893', N'719')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80893', N'720')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80893', N'720')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80893', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80893', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80894', N'521')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80894', N'521')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80894', N'548')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80894', N'548')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80894', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80894', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80894', N'719')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80894', N'719')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80894', N'720')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80894', N'720')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80894', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80894', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80896', N'521')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80896', N'521')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80896', N'551')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80896', N'551')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80896', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80896', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80896', N'719')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80896', N'719')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80896', N'720')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80896', N'720')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80896', N'724')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80896', N'724')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80896', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80896', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80897', N'521')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80897', N'521')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80897', N'632')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80897', N'632')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80898', N'521')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80898', N'521')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80898', N'551')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80898', N'551')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80899', N'521')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80899', N'521')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80899', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80899', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80899', N'632')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80899', N'632')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80899', N'719')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80899', N'719')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80899', N'720')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80899', N'720')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80899', N'724')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80899', N'724')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80899', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80899', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80905', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80905', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80905', N'664')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80905', N'664')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80905', N'719')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80905', N'719')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80905', N'720')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80905', N'720')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80905', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80905', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80906', N'521')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80906', N'521')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80906', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80906', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80906', N'665')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80906', N'665')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80906', N'719')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80906', N'719')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80906', N'720')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80906', N'720')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80906', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80906', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80909', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80909', N'1223')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80909', N'1224')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80909', N'1225')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80909', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80909', N'1605')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80912', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80912', N'1223')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80912', N'1224')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80912', N'1225')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80912', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80912', N'1605')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80914', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80914', N'1223')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80914', N'1224')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80914', N'1225')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80914', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80914', N'1605')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80917', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80917', N'1223')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80917', N'1224')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80917', N'1225')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80917', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80917', N'1605')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80924', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80924', N'1223')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80924', N'1224')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80924', N'1225')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80924', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80924', N'1605')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80943', N'97')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80943', N'379')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80943', N'418')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80943', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80943', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80943', N'423')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80943', N'425')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80943', N'671')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80943', N'672')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80945', N'450')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80945', N'451')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80945', N'838')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80945', N'839')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80945', N'840')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80946', N'450')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80946', N'451')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80946', N'840')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80946', N'843')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80974', N'51')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80974', N'677')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80974', N'678')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80974', N'679')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80974', N'680')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80974', N'681')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80974', N'682')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80988', N'1726')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80988', N'1727')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80989', N'1728')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80989', N'1728')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80989', N'1730')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80989', N'1730')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80991', N'1735')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80991', N'1735')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80991', N'1736')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80991', N'1736')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80991', N'1737')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80991', N'1737')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80993', N'1731')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80993', N'1731')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80993', N'1738')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80993', N'1738')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80993', N'1740')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80993', N'1740')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80993', N'1741')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80993', N'1741')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80993', N'1742')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80993', N'1742')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80993', N'1743')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80993', N'1743')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80994', N'1733')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80994', N'1733')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80994', N'1734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80994', N'1734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80994', N'1744')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80994', N'1744')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80996', N'1745')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80996', N'1745')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80996', N'1746')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80996', N'1746')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80996', N'1747')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80996', N'1747')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80996', N'1748')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80996', N'1748')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80996', N'1749')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80996', N'1749')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80997', N'1750')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80997', N'1750')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80997', N'1751')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80997', N'1751')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80997', N'1752')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80997', N'1752')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80997', N'1753')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80997', N'1753')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80998', N'1754')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80998', N'1754')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80998', N'1755')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80998', N'1755')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80998', N'1756')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80998', N'1756')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80999', N'1757')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80999', N'1757')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80999', N'1758')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80999', N'1758')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80999', N'1759')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'80999', N'1759')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81003', N'1758')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81003', N'1758')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81003', N'1760')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81003', N'1760')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81003', N'1761')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81003', N'1761')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81003', N'1762')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81003', N'1762')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81007', N'1763')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81007', N'1763')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81007', N'1764')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81007', N'1764')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81007', N'1765')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81007', N'1765')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81007', N'1766')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81007', N'1766')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81008', N'1767')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81008', N'1767')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81008', N'1768')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81008', N'1768')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81008', N'1769')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81008', N'1769')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81008', N'1787')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81008', N'1787')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81009', N'1770')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81009', N'1770')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81009', N'1771')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81009', N'1771')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81009', N'1772')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81009', N'1772')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81009', N'1773')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81009', N'1773')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81010', N'1774')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81010', N'1774')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81010', N'1775')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81010', N'1775')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81011', N'1776')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81011', N'1776')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81011', N'1777')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81011', N'1777')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81014', N'1782')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81014', N'1782')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81014', N'1783')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81014', N'1783')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81015', N'1784')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81015', N'1784')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81015', N'1785')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81015', N'1785')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81015', N'1786')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81015', N'1786')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81017', N'1788')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81017', N'1788')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81017', N'1789')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81017', N'1789')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81018', N'1790')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81018', N'1790')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81018', N'1791')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81018', N'1791')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81018', N'1792')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81018', N'1792')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81024', N'768')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81024', N'771')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81024', N'773')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81024', N'774')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81024', N'776')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81024', N'989')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81029', N'706')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81029', N'707')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81030', N'707')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81030', N'708')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81030', N'709')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81030', N'710')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81030', N'711')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81031', N'707')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81031', N'711')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81031', N'712')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81031', N'713')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81032', N'707')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81033', N'1270')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81033', N'1273')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81033', N'1274')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81034', N'717')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81034', N'1270')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81035', N'707')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81035', N'718')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81036', N'1244')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81036', N'1247')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81036', N'1249')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81063', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81063', N'1223')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81063', N'1224')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81063', N'1225')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81063', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81063', N'1605')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81078', N'823')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81078', N'824')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81078', N'825')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81078', N'826')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81078', N'827')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81078', N'828')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81083', N'450')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81083', N'451')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81083', N'837')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81083', N'840')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81083', N'841')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81083', N'842')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81086', N'450')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81086', N'451')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81086', N'842')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81088', N'448')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81088', N'450')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81088', N'451')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81088', N'670')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81089', N'448')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81089', N'450')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81089', N'451')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81089', N'670')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81095', N'905')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81095', N'906')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81096', N'905')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81096', N'906')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81097', N'905')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81097', N'906')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81098', N'905')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81098', N'906')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81099', N'905')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81099', N'906')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81100', N'905')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81100', N'906')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81142', N'111')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81142', N'453')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81142', N'700')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81142', N'914')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81142', N'915')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81142', N'916')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81167', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81167', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81167', N'1595')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81167', N'1595')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81167', N'1596')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81167', N'1596')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81167', N'1597')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81167', N'1597')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81168', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81168', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81168', N'1595')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81168', N'1595')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81168', N'1596')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81168', N'1596')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81168', N'1597')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81168', N'1597')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81169', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81169', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81169', N'1595')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81169', N'1595')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81169', N'1596')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81169', N'1596')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81169', N'1597')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81169', N'1597')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81169', N'1598')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81169', N'1598')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81175', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81175', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81175', N'1595')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81175', N'1595')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81175', N'1596')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81175', N'1596')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81175', N'1599')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81175', N'1599')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81175', N'1602')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81175', N'1602')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81176', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81176', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81176', N'1595')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81176', N'1595')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81176', N'1596')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81176', N'1596')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81176', N'1599')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81176', N'1599')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81176', N'1600')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81176', N'1600')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81177', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81177', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81177', N'1595')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81177', N'1595')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81177', N'1596')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81177', N'1596')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81177', N'1601')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81177', N'1601')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81177', N'1604')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81177', N'1604')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81180', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81180', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81180', N'1595')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81180', N'1595')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81180', N'1596')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81180', N'1596')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81180', N'1597')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81180', N'1597')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81181', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81181', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81181', N'1595')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81181', N'1595')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81181', N'1596')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81181', N'1596')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81181', N'1597')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81181', N'1597')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81181', N'1598')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81181', N'1598')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81183', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81183', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81183', N'779')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81183', N'779')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81184', N'1595')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81184', N'1595')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81184', N'1596')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81184', N'1596')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81184', N'1601')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81184', N'1601')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81184', N'1603')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81184', N'1603')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81184', N'1604')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81184', N'1604')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81186', N'556')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81186', N'556')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81186', N'560')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81186', N'560')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81186', N'790')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81186', N'790')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81186', N'796')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81186', N'796')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81188', N'51')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81188', N'339')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81188', N'399')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81188', N'674')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81188', N'930')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81191', N'1793')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81191', N'1793')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81191', N'1794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81191', N'1794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81191', N'1795')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81191', N'1795')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81191', N'1796')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81191', N'1796')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81191', N'1797')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81191', N'1797')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81191', N'1798')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81191', N'1798')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81191', N'1799')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81191', N'1799')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81196', N'938')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81196', N'939')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81196', N'940')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81196', N'941')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81196', N'942')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81196', N'943')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81196', N'944')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81199', N'137')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81199', N'182')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81199', N'213')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81199', N'866')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81199', N'899')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81207', N'1244')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81207', N'1245')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81207', N'1246')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81208', N'1244')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81208', N'1245')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81208', N'1246')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81281', N'829')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81281', N'834')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81281', N'957')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81281', N'958')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81281', N'959')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81281', N'1220')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81282', N'829')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81282', N'834')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81282', N'957')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81282', N'958')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81282', N'959')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81282', N'1220')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81283', N'137')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81283', N'879')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81283', N'880')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81283', N'881')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81283', N'882')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81283', N'886')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81283', N'887')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81283', N'889')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81283', N'960')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81283', N'961')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81283', N'962')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81283', N'963')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81284', N'679')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81284', N'924')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81284', N'926')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81284', N'927')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81284', N'928')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81284', N'1592')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81288', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81288', N'1224')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81288', N'1225')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81288', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81288', N'1227')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81288', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81302', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81302', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81302', N'1227')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81302', N'1230')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81302', N'1231')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81302', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81303', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81303', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81303', N'1227')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81303', N'1230')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81303', N'1231')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81303', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81304', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81304', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81304', N'1227')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81304', N'1230')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81304', N'1231')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81304', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81305', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81305', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81305', N'1227')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81305', N'1230')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81305', N'1231')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81305', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81306', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81306', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81306', N'1227')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81306', N'1230')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81306', N'1231')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81306', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81307', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81307', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81307', N'1227')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81307', N'1230')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81307', N'1231')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81307', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81308', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81308', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81308', N'1227')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81308', N'1230')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81308', N'1231')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81308', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81309', N'51')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81309', N'907')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81309', N'908')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81309', N'909')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81309', N'910')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81309', N'911')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81309', N'1082')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81309', N'1083')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81310', N'718')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81310', N'966')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81310', N'967')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81361', N'450')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81361', N'451')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81361', N'969')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81361', N'970')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81361', N'971')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81361', N'1166')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81362', N'445')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81362', N'450')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81362', N'451')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81362', N'970')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81362', N'971')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81362', N'972')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81373', N'699')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81373', N'700')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81373', N'702')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81373', N'914')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81373', N'916')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81373', N'973')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81384', N'848')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81384', N'850')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81384', N'975')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81384', N'976')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81384', N'977')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81384', N'979')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81384', N'980')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81384', N'985')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81385', N'848')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81385', N'850')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81385', N'975')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81385', N'976')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81385', N'977')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81385', N'979')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81387', N'776')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81387', N'903')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81387', N'981')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81387', N'982')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81387', N'983')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81387', N'984')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81421', N'51')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81421', N'407')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81421', N'990')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81421', N'991')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81421', N'993')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81422', N'51')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81422', N'62')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81422', N'407')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81422', N'990')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81422', N'994')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81422', N'995')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81422', N'997')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81427', N'707')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81427', N'999')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81428', N'707')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81428', N'708')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81428', N'709')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81428', N'710')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81428', N'711')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81429', N'707')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81429', N'711')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81429', N'712')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81429', N'713')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81429', N'1005')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81430', N'707')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81430', N'717')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81431', N'707')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81431', N'1000')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81445', N'707')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81445', N'1003')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81481', N'1270')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81481', N'1273')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81481', N'1274')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81481', N'1275')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81491', N'1008')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81491', N'1009')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81491', N'1010')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81491', N'1011')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81491', N'1012')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81491', N'1013')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81491', N'1014')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81491', N'1015')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81497', N'100')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81497', N'345')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81497', N'419')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81497', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81497', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81497', N'809')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81497', N'998')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81500', N'199')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81500', N'878')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81500', N'1016')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81500', N'1019')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81500', N'1021')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81500', N'1022')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81500', N'1023')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81500', N'1026')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81500', N'1028')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81500', N'1080')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81500', N'1089')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81544', N'137')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81544', N'874')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81544', N'878')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81544', N'1016')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81544', N'1019')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81544', N'1020')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81544', N'1021')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81544', N'1022')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81544', N'1023')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81544', N'1026')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81544', N'1027')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81544', N'1080')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81545', N'450')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81545', N'451')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81545', N'969')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81545', N'970')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81545', N'971')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81545', N'1166')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81546', N'969')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81546', N'971')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81546', N'1029')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81546', N'1030')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81546', N'1167')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81546', N'1168')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81546', N'1367')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81547', N'939')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81547', N'1031')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81547', N'1032')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81547', N'1033')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81547', N'1149')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81548', N'54')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81548', N'137')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81548', N'624')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81548', N'976')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81548', N'977')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81548', N'979')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81548', N'985')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81548', N'1034')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81548', N'1035')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81548', N'1036')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81548', N'1037')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81548', N'1038')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81549', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81549', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81549', N'527')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81549', N'527')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81549', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81549', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81549', N'530')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81549', N'530')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81549', N'534')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81549', N'534')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81549', N'780')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81549', N'780')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81549', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81549', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81549', N'1039')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81549', N'1039')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81549', N'1040')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81549', N'1040')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81550', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81550', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81550', N'527')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81550', N'527')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81550', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81550', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81550', N'780')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81550', N'780')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81550', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81550', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81550', N'1039')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81550', N'1039')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81550', N'1040')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81550', N'1040')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81550', N'1041')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81550', N'1041')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81550', N'1042')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81550', N'1042')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81551', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81551', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81551', N'527')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81551', N'527')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81551', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81551', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81551', N'780')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81551', N'780')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81551', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81551', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81551', N'1039')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81551', N'1039')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81551', N'1058')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81551', N'1058')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81551', N'1059')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81551', N'1059')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81554', N'54')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81554', N'407')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81554', N'958')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81554', N'1043')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81554', N'1044')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81554', N'1045')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81582', N'645')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81582', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81582', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81582', N'1228')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81582', N'1229')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81582', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81584', N'645')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81584', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81584', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81584', N'1228')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81584', N'1229')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81584', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81586', N'51')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81586', N'369')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81586', N'394')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81586', N'395')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81586', N'407')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81586', N'995')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81586', N'1083')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81587', N'51')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81587', N'369')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81587', N'394')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81587', N'395')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81587', N'407')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81587', N'995')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81588', N'51')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81588', N'407')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81588', N'990')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81588', N'994')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81588', N'995')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81588', N'997')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81588', N'1046')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81596', N'448')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81596', N'450')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81596', N'451')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81596', N'670')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81596', N'1166')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81606', N'905')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81606', N'906')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81607', N'905')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81607', N'906')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81608', N'905')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81608', N'906')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81609', N'905')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81609', N'906')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81610', N'905')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81610', N'906')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81611', N'905')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81611', N'906')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81612', N'905')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81612', N'906')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81618', N'645')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81618', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81618', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81618', N'1228')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81618', N'1229')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81618', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81619', N'645')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81619', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81619', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81619', N'1228')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81619', N'1229')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81619', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81620', N'890')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81620', N'891')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81620', N'892')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81620', N'893')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81620', N'894')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81620', N'895')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81620', N'896')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81620', N'897')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81620', N'898')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81620', N'899')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81620', N'900')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81633', N'87')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81633', N'93')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81633', N'94')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81633', N'95')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81633', N'346')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81633', N'377')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81633', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81633', N'1060')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81633', N'1061')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81640', N'137')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81640', N'199')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81640', N'1016')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81640', N'1019')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81640', N'1020')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81640', N'1021')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81640', N'1022')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81640', N'1023')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81640', N'1026')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81640', N'1080')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81640', N'1081')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81643', N'1062')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81643', N'1136')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81643', N'1137')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81643', N'1138')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81643', N'1139')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81643', N'1140')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81643', N'1141')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81643', N'1142')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81643', N'1143')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81643', N'1145')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81679', N'137')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81679', N'1018')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81679', N'1026')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81679', N'1084')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81679', N'1085')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81679', N'1086')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81679', N'1087')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81679', N'1088')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81684', N'1097')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81684', N'1098')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81684', N'1099')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81684', N'1100')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81684', N'1101')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81685', N'1097')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81685', N'1098')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81685', N'1099')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81685', N'1100')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81685', N'1101')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81687', N'766')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81687', N'1102')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81687', N'1103')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81687', N'1104')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81687', N'1105')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81687', N'1106')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81687', N'1107')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81687', N'1108')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81688', N'766')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81688', N'1102')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81688', N'1103')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81688', N'1104')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81688', N'1105')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81688', N'1106')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81688', N'1107')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81688', N'1109')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81688', N'1111')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81689', N'766')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81689', N'1102')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81689', N'1103')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81689', N'1104')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81689', N'1105')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81689', N'1106')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81689', N'1107')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81689', N'1110')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81689', N'1111')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81690', N'718')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81690', N'1108')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81690', N'1269')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81690', N'1270')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81691', N'718')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81691', N'1109')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81691', N'1269')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81691', N'1270')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81692', N'766')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81692', N'1106')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81692', N'1110')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81693', N'105')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81693', N'347')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81693', N'998')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81693', N'1060')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81693', N'1061')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81693', N'1101')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81693', N'1112')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81694', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81694', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81694', N'527')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81694', N'527')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81694', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81694', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81694', N'779')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81694', N'779')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81694', N'793')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81694', N'793')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81696', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81696', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81696', N'526')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81696', N'526')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81696', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81696', N'528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81696', N'780')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81696', N'780')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81696', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81696', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81696', N'1039')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81696', N'1039')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81698', N'552')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81698', N'552')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81698', N'560')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81698', N'560')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81698', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81698', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81698', N'1113')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81698', N'1113')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81698', N'1114')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81698', N'1114')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81699', N'552')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81699', N'552')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81699', N'555')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81699', N'555')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81699', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81699', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81699', N'1113')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81699', N'1113')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81699', N'1114')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81699', N'1114')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81702', N'268')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81702', N'1030')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81702', N'1122')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81702', N'1123')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81702', N'1124')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81702', N'1125')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81702', N'1126')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81702', N'1127')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81702', N'1128')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81702', N'1129')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81702', N'1130')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81702', N'1131')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81709', N'268')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81709', N'1030')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81709', N'1123')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81709', N'1126')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81709', N'1127')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81709', N'1128')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81709', N'1129')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81709', N'1130')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81709', N'1132')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81709', N'1133')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81709', N'1134')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81711', N'1800')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81711', N'1800')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81711', N'1801')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81711', N'1801')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81711', N'1802')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81711', N'1802')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81711', N'1803')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81711', N'1803')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81716', N'4')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81716', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81716', N'351')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81716', N'820')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81716', N'821')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81716', N'1048')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81716', N'1049')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81716', N'1146')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81716', N'1147')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81716', N'1148')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81717', N'3')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81717', N'4')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81717', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81717', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81717', N'351')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81717', N'820')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81717', N'821')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81717', N'1048')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81717', N'1049')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81717', N'1146')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81718', N'4')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81718', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81718', N'11')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81718', N'820')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81718', N'821')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81718', N'1048')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81718', N'1049')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81718', N'1146')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81718', N'1147')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81718', N'1148')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81719', N'3')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81719', N'4')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81719', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81719', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81719', N'11')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81719', N'820')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81719', N'822')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81719', N'1048')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81719', N'1049')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81719', N'1146')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81720', N'3')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81720', N'4')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81720', N'5')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81720', N'8')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81720', N'23')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81720', N'820')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81720', N'1048')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81720', N'1049')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81720', N'1146')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81720', N'1147')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81755', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81755', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81755', N'428')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81755', N'430')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81755', N'434')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81756', N'166')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81756', N'168')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81756', N'169')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81756', N'170')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81756', N'1158')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81756', N'1159')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81757', N'137')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81757', N'868')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81757', N'869')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81757', N'870')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81757', N'871')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81757', N'872')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81757', N'1151')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81757', N'1152')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81757', N'1162')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81758', N'1044')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81758', N'1153')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81758', N'1154')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81758', N'1155')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81758', N'1156')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81758', N'1157')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81759', N'1044')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81759', N'1153')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81759', N'1154')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81759', N'1155')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81759', N'1156')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81759', N'1157')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81760', N'35')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81760', N'219')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81760', N'242')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81760', N'481')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81760', N'482')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81763', N'450')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81763', N'451')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81763', N'840')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81763', N'841')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81763', N'842')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81763', N'1160')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81778', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81778', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81778', N'632')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81778', N'632')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81778', N'720')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81778', N'720')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81778', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81778', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81779', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81779', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81779', N'632')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81779', N'632')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81779', N'720')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81779', N'720')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81779', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81779', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81791', N'971')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81791', N'1164')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81791', N'1165')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81791', N'1166')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81791', N'1167')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81791', N'1168')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81792', N'971')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81792', N'1166')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81792', N'1167')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81792', N'1168')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81792', N'1169')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81792', N'1170')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81792', N'1171')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81829', N'199')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81829', N'878')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81829', N'1016')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81829', N'1019')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81829', N'1021')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81829', N'1022')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81829', N'1023')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81829', N'1026')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81829', N'1028')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81829', N'1080')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81829', N'1089')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81829', N'1198')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81830', N'137')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81830', N'882')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81830', N'887')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81830', N'1201')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81830', N'1202')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81830', N'1203')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81830', N'1204')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81830', N'1205')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81830', N'1206')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81830', N'1207')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81830', N'1208')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81830', N'1390')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81833', N'971')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81833', N'1166')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81833', N'1167')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81833', N'1168')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81833', N'1215')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81833', N'1216')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81833', N'1217')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81834', N'218')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81834', N'1176')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81834', N'1177')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81834', N'1178')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81834', N'1218')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81834', N'1219')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81835', N'1180')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81835', N'1181')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81835', N'1182')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81835', N'1183')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81835', N'1184')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81835', N'1185')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81836', N'1180')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81836', N'1181')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81836', N'1182')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81836', N'1183')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81836', N'1184')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81836', N'1185')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81838', N'1176')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81838', N'1177')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81838', N'1178')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81838', N'1186')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81838', N'1187')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81838', N'1188')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81839', N'1250')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81839', N'1251')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81839', N'1252')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81839', N'1286')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81839', N'1287')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81839', N'1288')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81839', N'1289')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81839', N'1290')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81839', N'1291')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81840', N'1062')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81840', N'1063')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81840', N'1064')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81840', N'1141')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81840', N'1189')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81840', N'1190')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81840', N'1253')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81840', N'1254')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81841', N'87')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81841', N'92')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81841', N'95')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81841', N'347')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81841', N'348')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81841', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81841', N'422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81841', N'809')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81841', N'1255')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81842', N'137')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81842', N'1008')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81842', N'1012')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81842', N'1256')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81842', N'1257')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81842', N'1258')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81842', N'1259')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81842', N'1260')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81842', N'1261')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81842', N'1262')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81842', N'1263')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81845', N'268')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81845', N'1030')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81845', N'1122')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81845', N'1123')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81845', N'1124')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81845', N'1125')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81845', N'1126')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81845', N'1127')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81845', N'1128')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81845', N'1129')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81845', N'1130')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81845', N'1131')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81845', N'1282')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81851', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81851', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81851', N'1227')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81851', N'1230')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81851', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81851', N'1293')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81852', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81852', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81852', N'1227')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81852', N'1230')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81852', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81852', N'1293')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81853', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81853', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81853', N'1227')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81853', N'1230')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81853', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81853', N'1293')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81854', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81854', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81854', N'1227')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81854', N'1230')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81854', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81854', N'1293')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81855', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81855', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81855', N'1227')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81855', N'1230')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81855', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81855', N'1293')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81856', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81856', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81856', N'1227')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81856', N'1230')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81856', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81856', N'1293')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81857', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81857', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81857', N'1227')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81857', N'1230')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81857', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81857', N'1293')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81858', N'1250')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81858', N'1251')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81858', N'1252')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81858', N'1286')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81858', N'1287')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81858', N'1288')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81858', N'1289')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81858', N'1290')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81858', N'1291')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81859', N'903')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81859', N'1111')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81860', N'766')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81860', N'1109')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81860', N'1111')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81861', N'766')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81861', N'1110')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81861', N'1111')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81863', N'718')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81863', N'1270')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81863', N'1273')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81863', N'1274')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81864', N'93')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81864', N'97')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81864', N'105')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81864', N'417')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81864', N'420')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81864', N'1294')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81866', N'1300')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81866', N'1310')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81866', N'1395')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81866', N'1396')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81866', N'1397')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81866', N'1398')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81866', N'1399')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81866', N'1400')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81866', N'1401')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81866', N'1402')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81866', N'1403')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81868', N'1334')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81868', N'1335')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81868', N'1336')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81868', N'1337')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81868', N'1563')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81868', N'1565')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81868', N'1569')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81869', N'1312')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81869', N'1313')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81869', N'1314')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81869', N'1315')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81869', N'1316')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81869', N'1317')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81869', N'1318')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81869', N'1319')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81869', N'1320')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81870', N'1313')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81870', N'1314')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81870', N'1315')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81870', N'1316')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81870', N'1317')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81870', N'1318')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81870', N'1319')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81870', N'1320')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81872', N'1348')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81872', N'1349')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81872', N'1350')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81872', N'1352')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81872', N'1353')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81872', N'1548')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81873', N'1303')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81873', N'1304')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81873', N'1305')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81873', N'1306')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81873', N'1307')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81873', N'1309')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81873', N'1310')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81873', N'1311')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81876', N'1373')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81876', N'1374')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81876', N'1375')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81877', N'1360')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81877', N'1361')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81877', N'1362')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81877', N'1363')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81877', N'1364')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81877', N'1365')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81878', N'1360')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81878', N'1361')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81878', N'1363')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81878', N'1364')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81878', N'1366')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81878', N'1572')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81888', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81888', N'1223')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81888', N'1224')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81888', N'1225')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81888', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81888', N'1605')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81890', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81890', N'1223')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81890', N'1224')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81890', N'1225')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81890', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81890', N'1605')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81891', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81891', N'1224')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81891', N'1225')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81891', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81891', N'1227')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81891', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81893', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81893', N'1224')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81893', N'1225')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81893', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81893', N'1227')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81893', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81896', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81896', N'1224')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81896', N'1225')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81896', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81896', N'1227')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81896', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81897', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81897', N'1223')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81897', N'1224')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81897', N'1225')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81897', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81897', N'1605')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81898', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81898', N'1224')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81898', N'1225')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81898', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81898', N'1227')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81898', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81899', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81899', N'1223')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81899', N'1224')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81899', N'1225')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81899', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81899', N'1605')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81902', N'1221')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81902', N'1224')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81902', N'1225')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81902', N'1226')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81902', N'1227')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81902', N'1232')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81903', N'766')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81903', N'774')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81903', N'776')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81903', N'1071')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81903', N'1368')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81903', N'1369')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81903', N'1370')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81903', N'1371')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81903', N'1372')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81904', N'1373')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81904', N'1374')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81904', N'1375')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81905', N'1373')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81905', N'1374')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81905', N'1375')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81906', N'1373')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81906', N'1374')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81906', N'1375')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81907', N'1373')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81907', N'1374')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81907', N'1375')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81908', N'1373')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81908', N'1374')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81908', N'1375')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81909', N'1373')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81909', N'1374')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81909', N'1375')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81910', N'1373')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81910', N'1374')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81910', N'1375')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81911', N'1360')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81911', N'1363')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81911', N'1364')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81911', N'1365')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81911', N'1383')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81911', N'1384')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81912', N'1360')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81912', N'1363')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81912', N'1364')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81912', N'1383')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81912', N'1385')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81912', N'1572')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81913', N'766')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81913', N'774')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81913', N'776')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81913', N'986')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81913', N'987')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81913', N'1071')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81913', N'1369')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81913', N'1370')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81913', N'1371')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81913', N'1372')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81915', N'766')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81915', N'1071')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81915', N'1072')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81915', N'1075')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81915', N'1076')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81915', N'1078')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81915', N'1079')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81915', N'1386')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81915', N'1387')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81915', N'1388')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81918', N'1379')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81918', N'1380')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81918', N'1381')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81918', N'1382')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81918', N'1635')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81919', N'1379')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81919', N'1380')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81919', N'1381')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81919', N'1382')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81919', N'1635')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81920', N'1377')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81920', N'1378')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81920', N'1404')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81921', N'1377')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81921', N'1378')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81921', N'1404')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81925', N'105')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81925', N'345')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81925', N'347')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81925', N'1116')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81925', N'1255')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81925', N'1405')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81925', N'1407')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81926', N'1060')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81926', N'1098')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81926', N'1099')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81926', N'1101')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81926', N'1116')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81926', N'1120')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81926', N'1405')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81927', N'421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81927', N'428')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81927', N'430')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81927', N'434')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81927', N'1060')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81927', N'1405')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81928', N'1060')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81928', N'1101')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81928', N'1120')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81928', N'1175')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81928', N'1405')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81928', N'1408')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81929', N'1060')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81929', N'1101')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81929', N'1120')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81929', N'1175')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81929', N'1405')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81929', N'1408')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81930', N'137')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81930', N'1314')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81930', N'1316')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81930', N'1318')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81930', N'1396')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81930', N'1409')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81930', N'1410')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81930', N'1411')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81932', N'1062')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81932', N'1136')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81932', N'1137')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81932', N'1138')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81932', N'1139')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81932', N'1140')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81933', N'1280')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81933', N'1414')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81933', N'1415')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81933', N'1416')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81933', N'1417')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81933', N'1418')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81935', N'858')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81935', N'1499')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81935', N'1500')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81935', N'1501')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81935', N'1502')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81935', N'1503')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81935', N'1504')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81935', N'1505')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81935', N'1506')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81935', N'1507')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81935', N'1508')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81936', N'1314')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81936', N'1316')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81936', N'1317')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81936', N'1318')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81936', N'1396')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81936', N'1409')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81936', N'1411')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81936', N'1419')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81936', N'1421')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81936', N'1422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81937', N'1314')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81937', N'1316')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81937', N'1317')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81937', N'1318')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81937', N'1396')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81937', N'1409')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81937', N'1411')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81937', N'1422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81937', N'1423')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81937', N'1424')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81938', N'1314')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81938', N'1316')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81938', N'1317')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81938', N'1318')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81938', N'1396')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81938', N'1409')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81938', N'1411')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81938', N'1422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81938', N'1424')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81938', N'1425')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81938', N'1426')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81939', N'1316')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81939', N'1318')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81939', N'1396')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81939', N'1409')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81939', N'1411')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81939', N'1422')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81939', N'1425')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81939', N'1427')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81939', N'1428')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81942', N'1436')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81942', N'1437')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81942', N'1438')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81942', N'1439')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81942', N'1440')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81942', N'1441')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81942', N'1453')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81943', N'137')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81943', N'1429')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81943', N'1430')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81943', N'1431')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81943', N'1432')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81943', N'1433')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81943', N'1434')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81943', N'1435')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81944', N'1436')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81944', N'1437')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81944', N'1438')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81944', N'1439')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81944', N'1440')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81944', N'1441')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81944', N'1453')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81945', N'1509')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81945', N'1510')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81945', N'1511')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81945', N'1512')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81945', N'1513')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81947', N'555')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81947', N'555')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81947', N'557')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81947', N'557')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81947', N'790')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81947', N'790')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81947', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81947', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81948', N'556')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81948', N'556')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81948', N'560')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81948', N'560')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81948', N'790')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81948', N'790')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81948', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81948', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81949', N'555')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81949', N'555')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81949', N'556')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81949', N'556')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81949', N'791')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81949', N'791')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81949', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81949', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81950', N'555')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81950', N'555')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81950', N'556')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81950', N'556')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81950', N'790')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81950', N'790')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81950', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81950', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81951', N'556')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81951', N'556')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81951', N'560')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81951', N'560')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81951', N'790')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81951', N'790')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81951', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81951', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81952', N'555')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81952', N'555')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81952', N'556')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81952', N'556')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81952', N'790')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81952', N'790')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81952', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81952', N'794')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81954', N'1454')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81954', N'1455')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81954', N'1456')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81954', N'1457')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81954', N'1458')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81954', N'1465')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81957', N'1270')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81957', N'1460')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81957', N'1461')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81957', N'1462')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81957', N'1463')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81957', N'1916')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81958', N'1270')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81958', N'1461')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81958', N'1462')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81958', N'1463')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81958', N'1464')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81958', N'1916')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81960', N'766')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81960', N'1071')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81960', N'1075')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81960', N'1076')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81960', N'1079')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81960', N'1387')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81960', N'1388')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81960', N'1466')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81960', N'1467')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81960', N'1468')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81960', N'1481')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81961', N'1469')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81961', N'1470')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81961', N'1471')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81961', N'1472')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81961', N'1473')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81961', N'1474')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81961', N'1475')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81962', N'1063')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81962', N'1065')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81962', N'1067')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81962', N'1360')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81962', N'1383')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81962', N'1591')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81963', N'1063')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81963', N'1065')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81963', N'1066')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81963', N'1067')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81963', N'1360')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81963', N'1592')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81964', N'83')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81964', N'372')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81964', N'432')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81964', N'1060')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81964', N'1061')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81964', N'1101')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81964', N'1476')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81964', N'1477')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81964', N'1478')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81964', N'1479')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81964', N'1480')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81965', N'1167')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81965', N'1485')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81965', N'1486')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81965', N'1487')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81965', N'1488')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81965', N'1489')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81966', N'1490')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81966', N'1491')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81966', N'1492')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81966', N'1493')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81966', N'1494')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81966', N'1495')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81967', N'1490')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81967', N'1491')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81967', N'1492')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81967', N'1493')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81967', N'1494')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81967', N'1495')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81968', N'766')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81968', N'1496')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81968', N'1497')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81968', N'1498')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81969', N'1509')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81969', N'1510')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81969', N'1511')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81969', N'1512')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81969', N'1513')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81973', N'951')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81973', N'953')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81973', N'954')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81973', N'1050')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81973', N'1051')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81973', N'1052')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81976', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81976', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81976', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81976', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81976', N'723')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81976', N'723')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81976', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81976', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81976', N'1695')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81976', N'1695')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81977', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81977', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81977', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81977', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81977', N'723')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81977', N'723')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81977', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81977', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81977', N'1695')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81977', N'1695')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81978', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81978', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81978', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81978', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81978', N'723')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81978', N'723')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81978', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81978', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81978', N'1697')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81978', N'1697')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81979', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81979', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81979', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81979', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81979', N'723')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81979', N'723')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81979', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81979', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81979', N'1696')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81979', N'1696')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81980', N'1486')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81980', N'1487')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81980', N'1488')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81980', N'1489')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81980', N'1521')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81980', N'1522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81980', N'1523')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81980', N'1524')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81980', N'1525')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81981', N'99')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81981', N'104')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81981', N'105')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81981', N'193')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81981', N'346')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81981', N'423')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81981', N'1526')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81981', N'1527')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81982', N'1758')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81982', N'1758')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81982', N'1804')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81982', N'1804')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81982', N'1805')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81982', N'1805')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81982', N'1806')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81982', N'1806')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81982', N'1807')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81982', N'1807')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81982', N'1808')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81982', N'1808')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81982', N'1809')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81982', N'1809')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81986', N'1810')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81986', N'1810')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81986', N'1811')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81986', N'1811')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81986', N'1812')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81986', N'1812')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81992', N'1763')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81992', N'1763')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81992', N'1766')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81992', N'1766')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81992', N'1813')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81992', N'1813')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81993', N'1763')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81993', N'1763')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81993', N'1764')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81993', N'1764')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81993', N'1765')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81993', N'1765')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81993', N'1766')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81993', N'1766')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81994', N'1814')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81994', N'1814')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81994', N'1815')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81994', N'1815')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81994', N'1816')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81994', N'1816')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81994', N'1818')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81994', N'1818')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81994', N'1819')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81994', N'1819')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81994', N'1830')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81994', N'1830')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81995', N'1763')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81995', N'1763')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81995', N'1765')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81995', N'1765')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81995', N'1820')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81995', N'1820')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81995', N'1821')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81995', N'1821')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81996', N'1763')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81996', N'1763')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81996', N'1765')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81996', N'1765')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81996', N'1822')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81996', N'1822')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81997', N'1823')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81997', N'1823')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81997', N'1824')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81997', N'1824')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81997', N'1825')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81997', N'1825')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81998', N'1779')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81998', N'1779')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81998', N'1826')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81998', N'1826')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81998', N'1827')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81998', N'1827')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81998', N'1828')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81998', N'1828')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81998', N'1830')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'81998', N'1830')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82000', N'1831')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82000', N'1831')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82000', N'1832')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82000', N'1832')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82000', N'1833')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82000', N'1833')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82001', N'1731')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82001', N'1731')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82001', N'1738')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82001', N'1738')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82001', N'1739')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82001', N'1739')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82001', N'1740')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82001', N'1740')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82001', N'1742')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82001', N'1742')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82001', N'1834')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82001', N'1834')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82002', N'1835')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82002', N'1835')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82002', N'1836')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82002', N'1836')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82002', N'1837')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82002', N'1837')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82003', N'1838')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82003', N'1838')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82003', N'1839')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82003', N'1839')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82003', N'1840')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82003', N'1840')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82003', N'1841')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82003', N'1841')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82003', N'1842')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82003', N'1842')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82004', N'1843')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82004', N'1843')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82004', N'1844')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82004', N'1844')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82004', N'1845')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82004', N'1845')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82005', N'1846')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82005', N'1846')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82005', N'1847')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82005', N'1847')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82005', N'1848')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82005', N'1848')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82006', N'1848')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82006', N'1848')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82006', N'1849')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82006', N'1849')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82006', N'1850')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82006', N'1850')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82006', N'1851')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82006', N'1851')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82007', N'1852')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82007', N'1852')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82007', N'1853')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82007', N'1853')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82007', N'1854')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82007', N'1854')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82008', N'1854')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82008', N'1854')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82008', N'1855')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82008', N'1855')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82008', N'1856')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82008', N'1856')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82009', N'1746')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82009', N'1746')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82009', N'1841')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82009', N'1841')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82009', N'1858')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82009', N'1858')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82009', N'1859')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82009', N'1859')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82009', N'1860')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82009', N'1860')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82010', N'1763')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82010', N'1763')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82010', N'1765')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82010', N'1765')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82010', N'1861')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82010', N'1861')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82011', N'1855')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82011', N'1855')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82011', N'1856')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82011', N'1856')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82011', N'1857')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82011', N'1857')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82012', N'1854')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82012', N'1854')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82012', N'1862')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82012', N'1862')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82012', N'1863')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82012', N'1863')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82013', N'1763')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82013', N'1763')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82013', N'1765')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82013', N'1765')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82013', N'1861')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82013', N'1861')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82014', N'1864')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82014', N'1864')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82014', N'1865')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82014', N'1865')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82015', N'1866')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82015', N'1866')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82015', N'1867')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82015', N'1867')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82015', N'1868')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82015', N'1868')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82015', N'1869')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82015', N'1869')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82015', N'1870')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82015', N'1870')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82015', N'1871')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82015', N'1871')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82015', N'1872')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82015', N'1872')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82016', N'1866')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82016', N'1866')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82016', N'1867')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82016', N'1867')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82016', N'1869')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82016', N'1869')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82016', N'1870')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82016', N'1870')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82016', N'1873')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82016', N'1873')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82016', N'1875')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82016', N'1875')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82017', N'1866')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82017', N'1866')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82017', N'1867')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82017', N'1867')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82017', N'1869')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82017', N'1869')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82017', N'1870')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82017', N'1870')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82017', N'1874')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82017', N'1874')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82017', N'1875')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82017', N'1875')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82018', N'1876')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82018', N'1876')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82018', N'1877')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82018', N'1877')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82018', N'1878')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82018', N'1878')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82018', N'1879')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82018', N'1879')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82019', N'1866')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82019', N'1866')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82019', N'1880')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82019', N'1880')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82019', N'1881')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82019', N'1881')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82019', N'1882')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82019', N'1882')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82019', N'1883')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82019', N'1883')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82019', N'1884')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82019', N'1884')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82020', N'102')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82020', N'105')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82020', N'345')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82020', N'347')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82020', N'423')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82020', N'1255')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82022', N'1854')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82022', N'1854')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82022', N'1885')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82022', N'1885')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82022', N'1886')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82022', N'1886')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82023', N'1876')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82023', N'1876')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82023', N'1877')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82023', N'1877')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82023', N'1878')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82023', N'1878')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82023', N'1879')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82023', N'1879')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82023', N'1887')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82023', N'1887')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82024', N'1888')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82024', N'1888')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82024', N'1889')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82024', N'1889')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82025', N'1889')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82025', N'1889')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82025', N'1890')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82025', N'1890')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82027', N'1891')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82027', N'1891')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82027', N'1892')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82027', N'1892')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82027', N'1893')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82027', N'1893')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82027', N'1894')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82027', N'1894')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82027', N'1895')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82027', N'1895')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82027', N'1896')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82027', N'1896')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82028', N'1897')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82028', N'1897')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82028', N'1898')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82028', N'1898')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82029', N'1899')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82029', N'1899')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82029', N'1900')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82029', N'1900')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82030', N'1901')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82030', N'1901')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82030', N'1902')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82030', N'1902')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82030', N'1903')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82030', N'1903')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82030', N'1904')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82030', N'1904')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82031', N'1905')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82031', N'1905')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82031', N'1906')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82031', N'1906')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82031', N'1907')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82031', N'1907')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82032', N'1908')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82032', N'1908')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82032', N'1909')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82032', N'1909')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82032', N'1910')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82032', N'1910')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82032', N'1911')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82032', N'1911')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82032', N'1912')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82032', N'1912')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82032', N'1913')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82032', N'1913')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82033', N'1763')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82033', N'1763')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82033', N'1765')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82033', N'1765')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82033', N'1820')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82033', N'1820')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82033', N'1821')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82033', N'1821')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82034', N'1763')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82034', N'1763')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82034', N'1765')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82034', N'1765')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82034', N'1822')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82034', N'1822')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82035', N'1836')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82035', N'1836')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82035', N'1837')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82035', N'1837')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82035', N'1914')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82035', N'1914')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82036', N'1732')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82036', N'1732')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82036', N'1836')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82036', N'1836')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82036', N'1837')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82036', N'1837')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82037', N'1731')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82037', N'1731')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82037', N'1738')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82037', N'1738')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82037', N'1739')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82037', N'1739')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82037', N'1740')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82037', N'1740')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82037', N'1742')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82037', N'1742')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82037', N'1834')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82037', N'1834')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82040', N'521')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82040', N'521')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82042', N'1183')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82042', N'1184')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82042', N'1528')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82042', N'1529')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82042', N'1530')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82042', N'1531')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82057', N'137')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82057', N'854')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82057', N'1533')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82057', N'1534')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82057', N'1535')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82057', N'1536')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82058', N'1348')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82058', N'1349')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82058', N'1350')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82058', N'1352')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82058', N'1353')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82058', N'1548')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82059', N'1549')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82059', N'1550')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82059', N'1551')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82059', N'1552')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82060', N'1553')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82060', N'1554')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82060', N'1555')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82060', N'1556')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82060', N'1557')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82060', N'1558')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82060', N'1559')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82060', N'1560')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82061', N'137')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82061', N'1310')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82061', N'1396')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82061', N'1537')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82061', N'1538')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82061', N'1539')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82061', N'1540')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82061', N'1541')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82061', N'1542')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82062', N'137')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82062', N'1310')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82062', N'1396')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82062', N'1398')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82062', N'1541')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82062', N'1542')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82062', N'1543')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82062', N'1544')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82062', N'1545')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82063', N'1322')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82063', N'1323')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82063', N'1325')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82063', N'1328')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82063', N'1329')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82063', N'1330')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82063', N'1331')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82063', N'1332')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82063', N'1333')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82063', N'1567')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82085', N'99')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82085', N'104')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82085', N'105')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82085', N'193')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82085', N'346')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82085', N'423')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82085', N'1526')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82085', N'1527')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82085', N'1570')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82085', N'1571')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82086', N'1102')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82086', N'1103')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82086', N'1573')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82086', N'1574')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82086', N'1575')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82087', N'717')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82087', N'1269')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82087', N'1270')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82087', N'1573')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82087', N'1575')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82088', N'774')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82088', N'776')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82088', N'1370')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82088', N'1584')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82088', N'1585')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82089', N'774')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82089', N'776')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82089', N'1370')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82089', N'1584')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82089', N'1586')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82090', N'776')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82090', N'1370')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82090', N'1584')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82090', N'1585')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82090', N'1587')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82091', N'776')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82091', N'1370')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82091', N'1584')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82091', N'1586')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82091', N'1587')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82092', N'1270')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82092', N'1588')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82092', N'1589')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82092', N'1590')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82096', N'450')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82096', N'451')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82096', N'840')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82096', N'843')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82099', N'360')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82099', N'364')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82099', N'1516')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82099', N'1517')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82099', N'1593')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82099', N'1594')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82101', N'905')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82101', N'906')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82102', N'905')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82102', N'906')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82103', N'1060')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82103', N'1060')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82103', N'1101')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82103', N'1101')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82103', N'1405')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82103', N'1405')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82103', N'1606')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82103', N'1606')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82103', N'1607')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82103', N'1607')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82103', N'1608')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82103', N'1608')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82104', N'1060')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82104', N'1060')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82104', N'1101')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82104', N'1101')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82104', N'1405')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82104', N'1405')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82104', N'1606')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82104', N'1606')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82104', N'1607')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82104', N'1607')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82104', N'1608')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82104', N'1608')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82105', N'93')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82105', N'94')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82105', N'95')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82105', N'418')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82105', N'1060')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82105', N'1061')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82105', N'1101')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82105', N'1479')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82105', N'1609')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82106', N'825')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82106', N'828')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82106', N'1610')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82106', N'1611')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82106', N'1612')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82106', N'1613')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82110', N'95')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82110', N'1255')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82110', N'1615')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82110', N'1616')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82110', N'1617')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82110', N'1618')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82111', N'95')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82111', N'1255')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82111', N'1615')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82111', N'1616')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82111', N'1617')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82111', N'1618')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82112', N'137')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82112', N'1018')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82112', N'1026')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82112', N'1084')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82112', N'1085')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82112', N'1086')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82112', N'1087')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82112', N'1088')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82113', N'450')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82113', N'451')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82113', N'840')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82113', N'841')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82113', N'842')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82113', N'1160')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82114', N'1176')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82114', N'1177')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82114', N'1179')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82114', N'1619')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82114', N'1620')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82114', N'1621')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82118', N'448')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82118', N'450')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82118', N'451')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82118', N'670')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82118', N'837')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82118', N'971')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82119', N'450')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82119', N'451')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82119', N'837')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82119', N'839')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82119', N'970')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82119', N'971')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82120', N'445')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82120', N'971')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82120', N'1167')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82120', N'1168')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82120', N'1169')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82120', N'1170')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82120', N'1171')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82121', N'1176')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82121', N'1178')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82121', N'1619')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82121', N'1632')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82121', N'1633')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82121', N'1634')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82122', N'1176')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82122', N'1178')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82122', N'1619')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82122', N'1632')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82122', N'1633')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82122', N'1634')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82129', N'1622')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82129', N'1623')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82129', N'1624')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82129', N'1625')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82129', N'1627')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82129', N'1636')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82129', N'1637')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82131', N'355')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82131', N'1062')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82131', N'1063')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82131', N'1638')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82131', N'1639')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82131', N'1641')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82132', N'1642')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82132', N'1643')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82132', N'1644')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82132', N'1645')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82132', N'1646')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82132', N'1647')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82133', N'1363')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82133', N'1364')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82133', N'1621')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82133', N'1648')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82133', N'1649')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82134', N'1364')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82134', N'1621')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82134', N'1649')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82134', N'1650')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82134', N'1651')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82134', N'1652')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82137', N'1664')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82137', N'1665')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82137', N'1666')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82137', N'1668')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82138', N'1664')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82138', N'1665')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82138', N'1666')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82138', N'1668')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82139', N'1128')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82139', N'1130')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82139', N'1669')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82139', N'1670')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82139', N'1672')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82139', N'1673')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82139', N'1674')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82139', N'1675')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82139', N'1676')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82139', N'1677')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82139', N'1678')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82139', N'1679')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82139', N'1688')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82140', N'1680')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82140', N'1681')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82140', N'1682')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82140', N'1683')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82140', N'1684')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82140', N'1685')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82140', N'1686')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82143', N'1642')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82143', N'1643')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82143', N'1644')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82143', N'1645')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82143', N'1646')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82143', N'1687')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82162', N'1622')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82162', N'1623')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82162', N'1624')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82162', N'1625')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82162', N'1636')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82162', N'1637')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82163', N'1436')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82163', N'1437')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82163', N'1680')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82163', N'1690')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82163', N'1691')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82163', N'1692')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82164', N'199')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82164', N'878')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82164', N'1016')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82164', N'1019')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82164', N'1021')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82164', N'1022')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82164', N'1023')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82164', N'1026')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82164', N'1028')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82164', N'1080')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82164', N'1089')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82164', N'1198')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82165', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82165', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82165', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82165', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82165', N'723')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82165', N'723')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82165', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82165', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82165', N'1698')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82165', N'1698')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82169', N'1128')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82169', N'1130')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82169', N'1669')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82169', N'1670')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82169', N'1672')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82169', N'1673')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82169', N'1674')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82169', N'1675')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82169', N'1676')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82169', N'1677')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82169', N'1678')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82169', N'1679')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82169', N'1688')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82170', N'1701')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82170', N'1702')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82170', N'1703')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82170', N'1704')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82170', N'1705')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82170', N'1706')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82171', N'1707')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82171', N'1708')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82171', N'1709')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82171', N'1710')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82172', N'137')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82172', N'887')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82172', N'1201')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82172', N'1203')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82172', N'1204')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82172', N'1205')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82172', N'1206')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82172', N'1207')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82172', N'1208')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82172', N'1712')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82172', N'1713')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82172', N'1714')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82173', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82173', N'522')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82173', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82173', N'631')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82173', N'723')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82173', N'723')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82173', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82173', N'734')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82468', N'1720')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82468', N'1721')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82468', N'1722')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82468', N'1723')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82468', N'1724')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82468', N'1725')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82470', N'1891')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82470', N'1892')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82470', N'1893')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82470', N'1894')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82470', N'1895')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82470', N'1896')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82472', N'1027')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82472', N'1450')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82472', N'1484')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82472', N'1921')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82472', N'1922')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82472', N'1923')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82472', N'1924')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82472', N'1925')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82472', N'1926')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82472', N'1927')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82482', N'1027')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82482', N'1450')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82482', N'1484')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82482', N'1921')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82482', N'1922')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82482', N'1925')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82482', N'1926')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82482', N'1927')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82482', N'1928')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82482', N'1929')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82482', N'1930')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82483', N'1709')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82483', N'1710')
GO

INSERT INTO [sync].[BuyKitchenProductFeatures] ([product_id], [product_feature_id]) VALUES (N'82483', N'1711')
GO

