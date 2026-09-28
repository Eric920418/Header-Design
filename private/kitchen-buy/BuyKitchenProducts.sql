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

 Date: 19/03/2026 13:04:08
*/


-- ----------------------------
-- Table structure for BuyKitchenProducts
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[sync].[BuyKitchenProducts]') AND type IN ('U'))
	DROP TABLE [sync].[BuyKitchenProducts]
GO

CREATE TABLE [sync].[BuyKitchenProducts] (
  [id] int  NOT NULL,
  [channel] varchar(10) COLLATE Chinese_Taiwan_Stroke_CI_AS  NULL,
  [product_class_id_group] varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS  NULL,
  [product_class_name_group] varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS  NULL,
  [Brand] nvarchar(255) COLLATE Chinese_Taiwan_Stroke_CI_AS  NOT NULL,
  [model] nvarchar(255) COLLATE Chinese_Taiwan_Stroke_CI_AS  NOT NULL,
  [name] nvarchar(255) COLLATE Chinese_Taiwan_Stroke_CI_AS  NOT NULL,
  [erp_model] nvarchar(255) COLLATE Chinese_Taiwan_Stroke_CI_AS  NOT NULL
)
GO

ALTER TABLE [sync].[BuyKitchenProducts] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of BuyKitchenProducts
-- ----------------------------
INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'8', N'展板', N'83301,6,33', N'廚房電器,除油煙機,輕巧系列', N'櫻花', N'R3012', N'單層式除油煙機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'11', N'展板', N'83301,7,35,53', N'廚房電器,瓦斯爐,台爐 ,雙內焰系列', N'櫻花', N'G5700K', N'雙內焰安全爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'17', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0088', N'5微米PP濾心(10吋)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'34', N'展板', N'83300,5,13,175', N'熱水器,瓦斯熱水器,恆溫熱水器,環保減排系列', N'櫻花', N'SH1691', N'16L智能恆溫熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'48', N'展板', N'83300,5,13,23', N'熱水器,瓦斯熱水器,恆溫熱水器,其他配備', N'櫻花', N'浴室用', N'有線溫控器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'49', N'展板', N'83300,5,13,23', N'熱水器,瓦斯熱水器,恆溫熱水器,其他配備', N'櫻花', N'廚房用', N'有線溫控器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'83', N'展板', N'83301,6,34', N'廚房電器,除油煙機,配備', N'櫻花', N'RA-004', N'櫻花配件包-PP', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'84', N'展板', N'83301,6,34', N'廚房電器,除油煙機,配備', N'櫻花', N'RA-003', N'櫻花鋼網組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'85', N'展板', N'83301,6,34', N'廚房電器,除油煙機,配備', N'櫻花', N'RA-009', N'櫻花濾油網組-鋁', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'86', N'展板', N'83301,6,34', N'廚房電器,除油煙機,配備', N'櫻花', N'RA-001', N'櫻花集油杯組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'94', N'展板', N'9,45,83236', N'淨水設備,濾心,RO系列', N'櫻花', N'C65-0118', N'5微米PP濾心(12吋)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'95', N'展板', N'9,45,83236', N'淨水設備,濾心,RO系列', N'櫻花', N'C65-0122', N'1微米PP濾心(12吋)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'96', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0089', N'1微米PP濾心(10吋)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'97', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0123', N'高級纖維棉濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'98', N'展板', N'9,45,83236', N'淨水設備,濾心,RO系列', N'櫻花', N'C65-0119', N'椰殼活性碳濾心(12吋)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'99', N'展板', N'9,45,83238', N'淨水設備,濾心,過濾系列', N'櫻花', N'C65-0146', N'銀添活性碳棒濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'100', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0090', N'椰殼活性碳(10吋)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'101', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0170', N'KDF雙效濾心(9吋)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'102', N'展板', N'9,45,83237', N'淨水設備,濾心,SQC系列', N'櫻花', N'C65-0304', N'快捷高效濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'103', N'展板', N'9,45,83237', N'淨水設備,濾心,SQC系列', N'櫻花', N'C65-0305', N'快捷高效潔淨濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'104', N'展板', N'9,45,83238', N'淨水設備,濾心,過濾系列', N'櫻花', N'C65-0121', N'樹脂濾心(12吋)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'105', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0098', N'樹脂濾心(10吋)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'106', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0137', N'樹脂濾心(9吋)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'107', N'展板', N'9,45,83238', N'淨水設備,濾心,過濾系列', N'櫻花', N'C65-0130', N'丹頓陶瓷濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'108', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0125', N'多層膜濾布濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'109', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0153', N'活性竹碳濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'110', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0154-1', N'負電位能量石濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'111', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0126', N'遠紅外線能量石濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'112', N'展板', N'9,45,83236', N'淨水設備,濾心,RO系列', N'櫻花', N'C65-0128', N'後置椰殼活性碳濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'113', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0133', N'後置椰殼活性碳+養生礦石濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'114', N'展板', N'9,45,83236', N'淨水設備,濾心,RO系列', N'櫻花', N'C95-A050', N'RO膜 (CSM)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'118', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0176', N'複合型活化濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'119', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0139', N'複合型樹脂濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'120', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0165', N'快捷高效濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'121', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0166', N'快捷高效潔淨濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'122', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0157', N'快捷5微米折疊PP濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'123', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0160', N'快捷CTO活性碳棒濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'124', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0159', N'快捷銀添椰殼活性碳+KDF', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'125', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0158', N'快捷樹脂濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'126', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0134', N'碳纖維濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'127', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0135', N'卡式椰殼活性碳', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'128', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'C65-0115', N'銀添活性碳亞硫酸鈣濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'137', N'展板', N'83301,7,35,54', N'廚房電器,瓦斯爐,台爐 ,標準系列', N'櫻花', N'G632KS', N'全白鐵安全爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'147', N'展板', N'83301,7,37,57', N'廚房電器,瓦斯爐,檯面爐,防乾燒系列', N'櫻花', N'G2830KG', N'三口防乾燒節能檯面爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'148', N'展板', N'83301,7,37,57', N'廚房電器,瓦斯爐,檯面爐,防乾燒系列', N'櫻花', N'G2830K', N'三口防乾燒節能檯面爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'149', N'展板', N'83301,7,37,57', N'廚房電器,瓦斯爐,檯面爐,防乾燒系列', N'櫻花', N'G2820G', N'二口防乾燒節能檯面爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'158', N'展板', N'83301,7,37,60', N'廚房電器,瓦斯爐,檯面爐,標準系列', N'櫻花', N'G252K', N'二口爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'159', N'展板', N'83301,7,37,60', N'廚房電器,瓦斯爐,檯面爐,標準系列', N'櫻花', N'G251K', N'單口爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'164', N'展板', N'83301,7,74,75', N'廚房電器,瓦斯爐,嵌入爐,雙內焰系列', N'櫻花', N'G-6700K', N'雙內焰安全爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'892', N'展板', N'83301,7,74,76', N'廚房電器,瓦斯爐,嵌入爐,標準系列', N'櫻花', N'G6320K', N'全白鐵嵌入爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'893', N'展板', N'83301,6,30', N'廚房電器,除油煙機,斜背系列', N'櫻花', N'R3250', N'斜背式除油煙機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'912', N'展板', N'83301,8,39', N'廚房電器,殺菌烘碗機,吊掛系列', N'櫻花', N'Q7565BW', N'殺菌烘碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'913', N'展板', N'83301,8,39', N'廚房電器,殺菌烘碗機,吊掛系列', N'櫻花', N'Q7583', N'殺菌烘碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'920', N'展板', N'83300,5,13,147', N'熱水器,瓦斯熱水器,恆溫熱水器,供排平衡系列', N'櫻花', N'SH1680', N'16L 供排平衡智能恆溫熱水器(浴室、櫥櫃專用)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'921', N'展板', N'83301,6,31', N'廚房電器,除油煙機,隱藏系列', N'櫻花', N'DR3590A', N'全隱藏型除油煙機 - 渦輪變頻系列', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'924', N'展板', N'83301,7,74,76', N'廚房電器,瓦斯爐,嵌入爐,標準系列', N'櫻花', N'G-6500KG', N'兩口玻璃面板嵌入爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'926', N'展板', N'83300,83227,26,83235', N'熱水器,電能熱水器,瞬熱式,分段調溫系列', N'櫻花', N'SH-186', N'五段調溫電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'929', N'展板', N'83300,5,13,20', N'熱水器,瓦斯熱水器,恆溫熱水器,數位恆溫系列', N'櫻花', N'SH1335', N'13L 數位恆溫熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'930', N'展板', N'83300,5,13,175', N'熱水器,瓦斯熱水器,恆溫熱水器,環保減排系列', N'櫻花', N'SH2470A', N'24L 環保減排智能恆溫熱水器', N'H2470')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'932', N'展板', N'83300,5,13,176', N'熱水器,瓦斯熱水器,恆溫熱水器,冷凝高效系列', N'櫻花', N'SH2690', N'26L 冷凝高效智能恆溫熱水器', N'H2690')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'939', N'展板', N'83301,6,31', N'廚房電器,除油煙機,隱藏系列', N'櫻花', N'DR3592A', N'觸控隱藏型除油煙機 - 渦輪變頻系列', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'940', N'展板', N'83301,7,35,53', N'廚房電器,瓦斯爐,台爐 ,雙內焰系列', N'櫻花', N'G5703', N'內燄防乾燒安全爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'941', N'展板', N'83301,7,74,75', N'廚房電器,瓦斯爐,嵌入爐,雙內焰系列', N'櫻花', N'G6703', N'內燄防乾燒嵌入爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'942', N'展板', N'83301,8,39', N'廚房電器,殺菌烘碗機,吊掛系列', N'櫻花', N'Q600C', N'殺菌烘碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'944', N'展板', N'83301,7,37,153', N'廚房電器,瓦斯爐,檯面爐,高效系列', N'櫻花', N'G2112G', N'單口併爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'946', N'展板', N'83301,6,31', N'廚房電器,除油煙機,隱藏系列', N'櫻花', N'R605', N'輕巧型除油煙機(半/全隱藏式) - 小宅系列', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'952', N'展板', N'83301,7,35,163', N'廚房電器,瓦斯爐,台爐 ,雙炫火系列', N'櫻花', N'G5900', N'二口雙炫火台爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'953', N'展板', N'83301,7,74,165', N'廚房電器,瓦斯爐,嵌入爐,雙炫火系列', N'櫻花', N'G6900', N'二口雙炫火嵌入爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'954', N'展板', N'83300,83227,26,83234', N'熱水器,電能熱水器,瞬熱式,數位恆溫系列', N'櫻花', N'SH-125', N'數位恆溫電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'955', N'展板', N'83300,83227,26,83235', N'熱水器,電能熱水器,瞬熱式,分段調溫系列', N'櫻花', N'SH-123', N'九段調溫電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'958', N'展板', N'83300,5,13,23', N'熱水器,瓦斯熱水器,恆溫熱水器,其他配備', N'櫻花', N'DH1628/SH1625/SH1626專用', N'無線溫控器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'963', N'展板', N'83300,5,13,83161', N'熱水器,瓦斯熱水器,恆溫熱水器,日本進口系列', N'櫻花', N'SH2480', N'24L 日本進口智能恆溫熱水器', N'H2480')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'973', N'展板', N'83300,5,83231,83230', N'熱水器,瓦斯熱水器,傳統熱水器,加強抗風系列', N'櫻花', N'GH1021', N'10L 抗風型屋外傳統熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'974', N'展板', N'83300,5,83231,83230', N'熱水器,瓦斯熱水器,傳統熱水器,加強抗風系列', N'櫻花', N'GH1221', N'12L 抗風型屋外傳統熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'975', N'展板', N'83300,5,83231,83229', N'熱水器,瓦斯熱水器,傳統熱水器,標準系列', N'櫻花', N'GH1035', N'10L 屋外傳統熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'976', N'展板', N'83300,5,83231,83229', N'熱水器,瓦斯熱水器,傳統熱水器,標準系列', N'櫻花', N'GH1235', N'12L 屋外傳統熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'978', N'展板', N'83301,7,37,157', N'廚房電器,瓦斯爐,檯面爐,易清系列', N'櫻花', N'G2633G', N'三口大面板易清檯面爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'979', N'展板', N'83301,7,37,157', N'廚房電器,瓦斯爐,檯面爐,易清系列', N'櫻花', N'G2633S', N'三口大面板易清檯面爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'981', N'展板', N'83301,7,37,157', N'廚房電器,瓦斯爐,檯面爐,易清系列', N'櫻花', N'G2623S', N'二口大面板易清檯面爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'982', N'展板', N'83301,7,37,157', N'廚房電器,瓦斯爐,檯面爐,易清系列', N'櫻花', N'G2522S', N'二口小面板易清檯面爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'993', N'展板', N'83300,5,13,171', N'熱水器,瓦斯熱水器,恆溫熱水器,循環預熱系列', N'櫻花', N'SH2291', N'22L 循環預熱智能恆溫熱水器', N'H2291')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'997', N'展板', N'83300,5,13,20', N'熱水器,瓦斯熱水器,恆溫熱水器,數位恆溫系列', N'櫻花', N'SH1338', N'13L 數位恆溫熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'998', N'展板', N'83300,5,83231,83229', N'熱水器,瓦斯熱水器,傳統熱水器,標準系列', N'櫻花', N'GH1239', N'12L屋外型熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'999', N'展板', N'83300,5,83231,83229', N'熱水器,瓦斯熱水器,傳統熱水器,標準系列', N'櫻花', N'GH1039', N'10L 屋外型熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'1003', N'展板', N'83301,6,30', N'廚房電器,除油煙機,斜背系列', N'櫻花', N'R-3268', N'斜背式除油煙機(雙效除油)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'1004', N'展板', N'83301,48', N'廚房電器,洗碗機', N'櫻花', N'E7782', N'全嵌式洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'1005', N'展板', N'83301,48', N'廚房電器,洗碗機', N'櫻花', N'E7682', N'半嵌式洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'1006', N'展板', N'83301,8,83114', N'廚房電器,殺菌烘碗機,嵌門板系列', N'櫻花', N'Q7596A', N'殺菌烘碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'1007', N'展板', N'172,173', N'整體廚房(old),SHINELUX(old)', N'櫻花', N'SHINELUX', N'鋁質結合式把手', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'1010', N'展板', N'83301,8,40', N'廚房電器,殺菌烘碗機,落地系列', N'櫻花', N'Q7595ML', N'殺菌烘碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'1012', N'展板', N'83301,6,31', N'廚房電器,除油煙機,隱藏系列', N'櫻花', N'R3500D', N'隱藏式除油煙機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'1013', N'展板', N'83301,6,31', N'廚房電器,除油煙機,隱藏系列', N'櫻花', N'R3506C', N'全隱藏式除油煙機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'1014', N'展板', N'83301,7,37,164', N'廚房電器,瓦斯爐,檯面爐,雙炫火系列', N'櫻花', N'G2928G', N'智能雙炫火二口玻璃檯面爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'1015', N'展板', N'83301,83307,83303', N'廚房電器,烤箱與電器收納櫃,嵌入式電烤箱', N'櫻花', N'E6672', N'嵌入式電烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'1018', N'展板', N'83301,8,40', N'廚房電器,殺菌烘碗機,落地系列', N'櫻花', N'Q7690', N'全平面玻璃觸控落地式烘碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'1019', N'展板', N'83301,8,40', N'廚房電器,殺菌烘碗機,落地系列', N'櫻花', N'Q7693', N'全平面玻璃觸控落地式烘碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'1022', N'展板', N'83300,5,13,166', N'熱水器,瓦斯熱水器,恆溫熱水器,無線溫控系列', N'櫻花', N'DH1628', N'16L 無線溫控智能恆溫熱水器', N'DH1628')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'1023', N'展板', N'83300,5,13,166', N'熱水器,瓦斯熱水器,恆溫熱水器,無線溫控系列', N'櫻花', N'DH2460', N'24L 無線溫控智能恆溫熱水器', N'DH2460')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'1025', N'展板', N'83301,162', N'廚房電器,IH感應爐', N'櫻花', N'EG2330GB', N'雙口IH爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'1027', N'展板', N'83301,7,37,164', N'廚房電器,瓦斯爐,檯面爐,雙炫火系列', N'櫻花', N'G2932AG', N'三口雙炫火玻璃檯面爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'1028', N'展板', N'83301,7,37,164', N'廚房電器,瓦斯爐,檯面爐,雙炫火系列', N'櫻花', N'G2922AG', N'二口雙炫火玻璃檯面爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'1033', N'展板', N'83300,5,13,23', N'熱水器,瓦斯熱水器,恆溫熱水器,其他配備', N'櫻花', N'DH1693溫控器', N'專用無線溫控器模組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'70015', N'展板', N'71001,72006,73007', N'Electrolux,爐具,--- 感應爐', N'Electrolux', N'EHH3320NVK(除役)', N'雙口感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'70027', N'展板', N'71001,72001,73003', N'Electrolux,蒸烤設備,--- 蒸烤箱', N'Electrolux', N'EVY9747AAX', N'45cm 蒸烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'70030', N'展板', N'71001,72001,73002', N'Electrolux,蒸烤設備,--- 烤箱', N'Electrolux', N'EOB3400AAX(除役)', N'60cm 電烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'70031', N'展板', N'71001,72001,73004', N'Electrolux,蒸烤設備,--- 蒸爐', N'Electrolux', N'EVY8740BAX', N'45cm 蒸爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'70039', N'展板', N'71001,73011', N'Electrolux,冰箱、紅酒櫃', N'Electrolux', N'ENC2858AOW', N'70/30冰箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'70046', N'展板', N'71001,73034', N'Electrolux,其他', N'Electrolux', N'Plancha Grill', N'感應爐專用鐵板烤架配件', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'70047', N'展板', N'71001,73034', N'Electrolux,其他', N'Electrolux', N'Infinite Wok Set (E: Motion)', N'感應爐專用炒鍋爐架配件', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'70123', N'展板', N'71001,73034', N'Electrolux,其他', N'Electrolux', N'E9KLCS01A', N'Chinois Colander<br>深煎鍋用篩網', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'70124', N'展板', N'71001,73034', N'Electrolux,其他', N'Electrolux', N'E9KLPS01', N'Pasta Insert <br>義大利麵專用內鍋', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'70125', N'展板', N'71001,73034', N'Electrolux,其他', N'Electrolux', N'E9KLCS01', N'Conical Pan 深煎鍋', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'70127', N'展板', N'71001,73034', N'Electrolux,其他', N'Electrolux', N'E9KLSP01', N'Stock Pot 不鏽鋼湯鍋', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80080', N'展板', N'81002,82001,83002', N'SVAGO,烤箱/蒸烤設備,--- 烤箱', N'SVAGO', N'FDT4007', N'嵌入式烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80083', N'展板', N'81002,82001,83003', N'SVAGO,烤箱/蒸烤設備,--- 蒸烤箱', N'SVAGO', N'SK1664S', N'嵌入式蒸烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80092', N'展板', N'81002,83010', N'SVAGO,排油煙機', N'SVAGO', N'PLANA SV 90', N'壁掛式排油煙機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80100', N'展板', N'83100,83364', N'水槽,不鏽鋼水槽', N'櫻花', N'PDS880', N'大單槽', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80100', N'官網', N'83100,83364', N'水槽,不鏽鋼水槽', N'櫻花', N'PDS880', N'大單槽', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80101', N'展板', N'83100,83364', N'水槽,不鏽鋼水槽', N'櫻花', N'PDS840', N'大單槽', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80101', N'官網', N'83100,83364', N'水槽,不鏽鋼水槽', N'櫻花', N'PDS840', N'大單槽', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80102', N'展板', N'83100,83364', N'水槽,不鏽鋼水槽', N'櫻花', N'PDS850W', N'大單槽', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80102', N'官網', N'83100,83364', N'水槽,不鏽鋼水槽', N'櫻花', N'PDS850W', N'大單槽', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80103', N'展板', N'83100,83364', N'水槽,不鏽鋼水槽', N'櫻花', N'PRS840T', N'大單槽', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80103', N'官網', N'83100,83364', N'水槽,不鏽鋼水槽', N'櫻花', N'PRS840T', N'大單槽', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80104', N'展板', N'83100,83364', N'水槽,不鏽鋼水槽', N'櫻花', N'DS740T', N'大單槽', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80104', N'官網', N'83100,83364', N'水槽,不鏽鋼水槽', N'櫻花', N'DS740T', N'大單槽', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80134', N'展板', N'81002,83243', N'SVAGO,紅酒櫃', N'SVAGO', N'JG110B', N'紅酒櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80141', N'展板', N'81002,83013', N'SVAGO,洗碗機', N'SVAGO', N'MW7711', N'全嵌式洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80142', N'展板', N'81002,83013', N'SVAGO,洗碗機', N'SVAGO', N'MW7709', N'半嵌式洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80146', N'展板', N'81002,82001,83002', N'SVAGO,烤箱/蒸烤設備,--- 烤箱', N'SVAGO', N'FDT 1007A', N'嵌入式烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80304', N'展板', N'83301,83307,49', N'廚房電器,烤箱與電器收納櫃,電器收納櫃', N'櫻花', N'E3621', N'電器收納櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80339', N'展板', N'83301,7,37,164', N'廚房電器,瓦斯爐,檯面爐,雙炫火系列', N'櫻花', N'G2926G', N'智能雙炫火二口玻璃檯面爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80351', N'展板', N'83301,8,40', N'廚房電器,殺菌烘碗機,落地系列', N'櫻花', N'Q7592BL', N'殺菌烘碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80365', N'展板', N'83300,5,83231,83229', N'熱水器,瓦斯熱水器,傳統熱水器,標準系列', N'櫻花', N'GH1005', N'10L 屋外型熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80377', N'展板', N'83096,83103', N'整體廚房,SHINE', N'櫻花', N'SHINE-02', N' L型 廚房', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80378', N'展板', N'83096,83103', N'整體廚房,SHINE', N'櫻花', N'SHINE-05', N' L型+中島 廚房', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80379', N'展板', N'83096,83103', N'整體廚房,SHINE', N'櫻花', N'SHINE-04', N'ㄇ型 廚房', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80380', N'展板', N'83096,83103', N'整體廚房,SHINE', N'櫻花', N'SHINE-01', N' 一字型 廚房', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80381', N'展板', N'83096,83103', N'整體廚房,SHINE', N'櫻花', N'SHINE-03', N'雙一字型 廚房', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80393', N'展板', N'83096,83115', N'整體廚房,Loft', N'櫻花', N'LOFT-03', N'L型廚房', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80394', N'展板', N'83096,83115', N'整體廚房,Loft', N'櫻花', N'LOFT-04', N'一字型+中島 廚房', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80395', N'展板', N'83096,83115', N'整體廚房,Loft', N'櫻花', N'LOFT-02', N'一字型+電器櫃 廚房', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80396', N'展板', N'83096,83115', N'整體廚房,Loft', N'櫻花', N'LOFT-01', N'一字型 廚房', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80401', N'展板', N'83100,83198', N'水槽,不鏽鋼單槽水槽組', N'櫻花', N'SPDL-860', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80401', N'官網', N'83100,83198', N'水槽,不鏽鋼單槽水槽組', N'櫻花', N'SPDL-860', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80402', N'展板', N'83100,83356', N'水槽,不鏽鋼壓花水槽', N'櫻花', N'SKL668NW', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80402', N'官網', N'83100,83356', N'水槽,不鏽鋼壓花水槽', N'櫻花', N'SKL668NW', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80434', N'展板', N'83301,6,34', N'廚房電器,除油煙機,配備', N'櫻花', N'RA-005', N'櫻花平濾油網組-PE', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80623', N'展板', N'83301,6,30', N'廚房電器,除油煙機,斜背系列', N'櫻花', N'R3262', N'斜背式除油煙機-高速雙渦輪+雙效除油', N'R3262')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80625', N'展板', N'83301,7,35,53', N'廚房電器,瓦斯爐,台爐 ,雙內焰系列', N'櫻花', N'G5513', N'雙內焰安全爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80627', N'展板', N'83301,7,74,75', N'廚房電器,瓦斯爐,嵌入爐,雙內焰系列', N'櫻花', N'G6513', N'雙內焰安全爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80628', N'展板', N'83301,6,30', N'廚房電器,除油煙機,斜背系列', N'櫻花', N'R3261', N'斜背式除油煙機-高速雙渦輪', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80630', N'展板', N'83096,83189', N'整體廚房,PURE', N'櫻花', N'PURE', N'型錄模組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80640', N'展板', N'83096,83190', N'整體廚房,Classic', N'櫻花', N'Classic', N'型錄模組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80659', N'展板', N'83100,83358', N'水槽,CARYSIL花崗岩水槽', N'櫻花', N'C01-1001/5001/6001/7001', N'德國CARYSIL珂瑞 花崗岩單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80659', N'官網', N'83100,83358', N'水槽,CARYSIL花崗岩水槽', N'櫻花', N'C01-1001/5001/6001/7001', N'德國CARYSIL珂瑞 花崗岩單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80660', N'展板', N'83100,83201', N'水槽,SAKURA嚴選人造石水槽', N'櫻花', N'JB450W/B/Y/P/G', N'人造石水槽(白/藍/黃/粉/綠)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80660', N'官網', N'83100,83201', N'水槽,SAKURA嚴選人造石水槽', N'櫻花', N'JB450W/B/Y/P/G', N'人造石水槽(白/藍/黃/粉/綠)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80661', N'展板', N'83100,83358', N'水槽,CARYSIL花崗岩水槽', N'櫻花', N'C10-1001/5001/6001/7001', N'德國CARYSIL珂瑞 花崗岩單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80661', N'官網', N'83100,83358', N'水槽,CARYSIL花崗岩水槽', N'櫻花', N'C10-1001/5001/6001/7001', N'德國CARYSIL珂瑞 花崗岩單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80662', N'展板', N'83100,83201', N'水槽,SAKURA嚴選人造石水槽', N'櫻花', N'JB780W/B/Y/P/G', N'人造石水槽(白/藍/黃/粉/綠)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80662', N'官網', N'83100,83201', N'水槽,SAKURA嚴選人造石水槽', N'櫻花', N'JB780W/B/Y/P/G', N'人造石水槽(白/藍/黃/粉/綠)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80663', N'展板', N'83100,83201', N'水槽,SAKURA嚴選人造石水槽', N'櫻花', N'JB880W/B/Y/P/G', N'人造石水槽(白/藍/黃/粉/綠)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80663', N'官網', N'83100,83201', N'水槽,SAKURA嚴選人造石水槽', N'櫻花', N'JB880W/B/Y/P/G', N'人造石水槽(白/藍/黃/粉/綠)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80667', N'展板', N'83096,83115', N'整體廚房,Loft', N'櫻花', N'LOFT-05', N'型錄模組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80794', N'展板', N'83301,6,83205', N'廚房電器,除油煙機,近吸系列', N'櫻花', N'R7600', N'近吸除油煙機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80795', N'展板', N'83301,8,40', N'廚房電器,殺菌烘碗機,落地系列', N'櫻花', N'Q7692', N'全平面落地式烘碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80800', N'展板', N'83301,7,35,54', N'廚房電器,瓦斯爐,台爐 ,標準系列', N'櫻花', N'G615A', N'二口安全爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80801', N'展板', N'83301,7,74,76', N'廚房電器,瓦斯爐,嵌入爐,標準系列', N'櫻花', N'G6150A', N'二口安全爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80819', N'展板', N'83096,83206', N'整體廚房,Elegant', N'櫻花', N'Elegant-01', N'一字型 廚房', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80820', N'展板', N'83096,83206', N'整體廚房,Elegant', N'櫻花', N'Elegant-04', N'型錄模組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80821', N'展板', N'83096,83206', N'整體廚房,Elegant', N'櫻花', N'Elegant-02', N'ㄈ型 廚房', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80822', N'展板', N'83096,83206', N'整體廚房,Elegant', N'櫻花', N'Elegant-03', N'L型廚房', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80823', N'展板', N'83301,83307,160', N'廚房電器,烤箱與電器收納櫃,蒸烤箱(嵌入式)', N'櫻花', N'E8692', N'嵌入式蒸烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80833', N'展板', N'83098,83359', N'龍頭,廚房無鉛立式龍頭', N'櫻花', N'LF3036', N'廚房無鉛立式龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80833', N'官網', N'83098,83359', N'龍頭,廚房無鉛立式龍頭', N'櫻花', N'LF3036', N'廚房無鉛立式龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80839', N'展板', N'83098,83359', N'龍頭,廚房無鉛立式龍頭', N'櫻花', N'LFD_3033', N'廚房無鉛立式龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80839', N'官網', N'83098,83359', N'龍頭,廚房無鉛立式龍頭', N'櫻花', N'LFD_3033', N'廚房無鉛立式龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80844', N'展板', N'83301,83307,46', N'廚房電器,烤箱與電器收納櫃,嵌入式微波蒸烤箱', N'櫻花', N'E8890', N'嵌入式微波蒸烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80855', N'展板', N'9,155', N'淨水設備,熱飲機系列', N'櫻花', N'P0553A', N'廚下熱飲機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80893', N'展板', N'83098,83359', N'龍頭,廚房無鉛立式龍頭', N'櫻花', N'LFD_6033', N'廚房無鉛立式龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80893', N'官網', N'83098,83359', N'龍頭,廚房無鉛立式龍頭', N'櫻花', N'LFD_6033', N'廚房無鉛立式龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80894', N'展板', N'83098,83362', N'龍頭,廚房無鉛伸縮龍頭', N'櫻花', N'LF5090', N'廚房無鉛伸縮龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80894', N'官網', N'83098,83362', N'龍頭,廚房無鉛伸縮龍頭', N'櫻花', N'LF5090', N'廚房無鉛伸縮龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80896', N'展板', N'83098,83197', N'龍頭,廚房無鉛三用龍頭', N'櫻花', N'LFD-0233_2', N'廚房無鉛三用龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80896', N'官網', N'83098,83197', N'龍頭,廚房無鉛三用龍頭', N'櫻花', N'LFD-0233_2', N'廚房無鉛三用龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80897', N'展板', N'83098,83197', N'龍頭,廚房無鉛三用龍頭', N'櫻花', N'LFD_2022', N'廚房無鉛三用龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80897', N'官網', N'83098,83197', N'龍頭,廚房無鉛三用龍頭', N'櫻花', N'LFD_2022', N'廚房無鉛三用龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80898', N'展板', N'83098,83197', N'龍頭,廚房無鉛三用龍頭', N'櫻花', N'LFD_3022', N'廚房無鉛三用龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80898', N'官網', N'83098,83197', N'龍頭,廚房無鉛三用龍頭', N'櫻花', N'LFD_3022', N'廚房無鉛三用龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80899', N'展板', N'83098,83197', N'龍頭,廚房無鉛三用龍頭', N'櫻花', N'LFD_6022', N'廚房無鉛三用龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80899', N'官網', N'83098,83197', N'龍頭,廚房無鉛三用龍頭', N'櫻花', N'LFD_6022', N'廚房無鉛三用龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80905', N'展板', N'83098,83359', N'龍頭,廚房無鉛立式龍頭', N'櫻花', N'LFD-0222_2', N'廚房無鉛立式龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80905', N'官網', N'83098,83359', N'龍頭,廚房無鉛立式龍頭', N'櫻花', N'LFD-0222_2', N'廚房無鉛立式龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80906', N'展板', N'83098,83362', N'龍頭,廚房無鉛伸縮龍頭', N'櫻花', N'LFD-0211_2', N'廚房無鉛伸縮龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80906', N'官網', N'83098,83362', N'龍頭,廚房無鉛伸縮龍頭', N'櫻花', N'LFD-0211_2', N'廚房無鉛伸縮龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80909', N'展板', N'83300,83227,14,83204', N'熱水器,電能熱水器,儲熱式,倍容定溫系列', N'櫻花', N'EH1251S6', N'倍容定溫熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80912', N'展板', N'83300,83227,14,83204', N'熱水器,電能熱水器,儲熱式,倍容定溫系列', N'櫻花', N'EH2651S6', N'倍容定溫熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80914', N'展板', N'83300,83227,14,83204', N'熱水器,電能熱水器,儲熱式,倍容定溫系列', N'櫻花', N'EH1251LS6', N'倍容定溫熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80917', N'展板', N'83300,83227,14,83204', N'熱水器,電能熱水器,儲熱式,倍容定溫系列', N'櫻花', N'EH0651LS6', N'倍容定溫熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80924', N'展板', N'83300,83227,14,83204', N'熱水器,電能熱水器,儲熱式,倍容定溫系列', N'櫻花', N'EH1851S6', N'倍容定溫熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80928', N'展板', N'71001,72006,73007', N'Electrolux,爐具,--- 感應爐', N'Electrolux', N'EHI7260BA', N'橫式雙口感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80943', N'展板', N'83301,7,37,154', N'廚房電器,瓦斯爐,檯面爐,雙內焰系列', N'櫻花', N'G2721G', N'雙內焰二口檯面爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80945', N'展板', N'81002,83006', N'SVAGO,IH感應爐具 ', N'SVAGO', N'TID7040', N'四口感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80946', N'展板', N'81002,83006', N'SVAGO,IH感應爐具 ', N'SVAGO', N'TID3580', N'橫式雙口感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80974', N'展板', N'83301,6,29', N'廚房電器,除油煙機,歐化系列 ', N'櫻花', N'R7765S', N'歐化除油煙機-環吸系列', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80988', N'展板', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'下拉籃吊櫃', N'下拉籃吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80989', N'展板', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'左右摺門吊櫃', N'左右摺門吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80989', N'官網', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'左右摺門吊櫃', N'左右摺門吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80990', N'展板', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'電動上下摺門吊櫃', N'電動上下摺門吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80990', N'官網', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'電動上下摺門吊櫃', N'電動上下摺門吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80991', N'展板', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'玻璃門板吊櫃', N'玻璃門板吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80991', N'官網', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'玻璃門板吊櫃', N'玻璃門板吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80992', N'展板', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'電動升降吊櫃(A款)(進口)', N'電動升降吊櫃(A款)(進口)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80992', N'官網', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'電動升降吊櫃(A款)(進口)', N'電動升降吊櫃(A款)(進口)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80993', N'展板', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'電動升降吊櫃(B款)(進口)', N'電動升降吊櫃(B款)(進口)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80993', N'官網', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'電動升降吊櫃(B款)(進口)', N'電動升降吊櫃(B款)(進口)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80994', N'展板', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'電動上掀吊櫃', N'電動上掀吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80994', N'官網', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'電動上掀吊櫃', N'電動上掀吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80996', N'展板', N'83097,83218', N'收納五金,轉角地櫃收納', N'櫻花', N'轉角全展式盤籃地櫃(進口五金)', N'轉角全展式盤籃地櫃(進口五金)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80996', N'官網', N'83097,83218', N'收納五金,轉角地櫃收納', N'櫻花', N'轉角全展式盤籃地櫃(進口五金)', N'轉角全展式盤籃地櫃(進口五金)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80997', N'展板', N'83097,83218', N'收納五金,轉角地櫃收納', N'櫻花', N'轉角蝴蝶轉盤地櫃(進口五金)', N'轉角蝴蝶轉盤地櫃(進口五金)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80997', N'官網', N'83097,83218', N'收納五金,轉角地櫃收納', N'櫻花', N'轉角蝴蝶轉盤地櫃(進口五金)', N'轉角蝴蝶轉盤地櫃(進口五金)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80998', N'展板', N'83097,83218', N'收納五金,轉角地櫃收納', N'櫻花', N'轉角連桿功能地櫃', N'轉角連桿功能地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80998', N'官網', N'83097,83218', N'收納五金,轉角地櫃收納', N'櫻花', N'轉角連桿功能地櫃', N'轉角連桿功能地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80999', N'展板', N'83097,83219', N'收納五金,抽屜地櫃收納', N'櫻花', N'SAKURA靜音緩衝抽屜地櫃', N'SAKURA靜音緩衝抽屜地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'80999', N'官網', N'83097,83219', N'收納五金,抽屜地櫃收納', N'櫻花', N'SAKURA靜音緩衝抽屜地櫃', N'SAKURA靜音緩衝抽屜地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81003', N'展板', N'83097,83219', N'收納五金,抽屜地櫃收納', N'櫻花', N'BLUM電動抽屜地櫃', N'BLUM電動抽屜地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81003', N'官網', N'83097,83219', N'收納五金,抽屜地櫃收納', N'櫻花', N'BLUM電動抽屜地櫃', N'BLUM電動抽屜地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81007', N'展板', N'83097,83220', N'收納五金,籃類地櫃收納', N'櫻花', N'座式緩衝塗裝側拉籃地櫃(20/30cm)', N'座式緩衝塗裝側拉籃地櫃(20/30cm)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81007', N'官網', N'83097,83220', N'收納五金,籃類地櫃收納', N'櫻花', N'座式緩衝塗裝側拉籃地櫃(20/30cm)', N'座式緩衝塗裝側拉籃地櫃(20/30cm)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81008', N'展板', N'83097,83220', N'收納五金,籃類地櫃收納', N'櫻花', N'清潔圍籃地櫃', N'清潔圍籃地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81008', N'官網', N'83097,83220', N'收納五金,籃類地櫃收納', N'櫻花', N'清潔圍籃地櫃', N'清潔圍籃地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81009', N'展板', N'83097,83221', N'收納五金,黃金地段收納', N'櫻花', N'犀利鉤黃金地段掛件組', N'犀利鉤黃金地段掛件組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81009', N'官網', N'83097,83221', N'收納五金,黃金地段收納', N'櫻花', N'犀利鉤黃金地段掛件組', N'犀利鉤黃金地段掛件組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81010', N'展板', N'83097,83221', N'收納五金,黃金地段收納', N'櫻花', N'KESSEBOHMER黃金地段掛件組', N'KESSEBOHMER黃金地段掛件組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81010', N'官網', N'83097,83221', N'收納五金,黃金地段收納', N'櫻花', N'KESSEBOHMER黃金地段掛件組', N'KESSEBOHMER黃金地段掛件組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81011', N'展板', N'83097,83221', N'收納五金,黃金地段收納', N'櫻花', N'橫桿掛架黃金地段掛件組', N'橫桿掛架黃金地段掛件組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81011', N'官網', N'83097,83221', N'收納五金,黃金地段收納', N'櫻花', N'橫桿掛架黃金地段掛件組', N'橫桿掛架黃金地段掛件組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81013', N'展板', N'83097,83355', N'收納五金,其他地櫃收納', N'櫻花', N'多功能連動收納盤籃地櫃(進口五金)', N'多功能連動收納盤籃地櫃(進口五金)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81013', N'官網', N'83097,83355', N'收納五金,其他地櫃收納', N'櫻花', N'多功能連動收納盤籃地櫃(進口五金)', N'多功能連動收納盤籃地櫃(進口五金)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81014', N'展板', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'抽中抽地櫃', N'抽中抽地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81014', N'官網', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'抽中抽地櫃', N'抽中抽地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81015', N'展板', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'隱藏式二摺桌', N'隱藏式二摺桌', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81015', N'官網', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'隱藏式二摺桌', N'隱藏式二摺桌', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81017', N'展板', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'摺疊矮梯', N'摺疊矮梯', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81017', N'官網', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'摺疊矮梯', N'摺疊矮梯', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81018', N'展板', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'置物層架', N'置物層架', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81018', N'官網', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'置物層架', N'置物層架', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81024', N'展板', N'9,41', N'淨水設備,RO系列', N'櫻花', N'P0231', N'RO淨水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81029', N'展板', N'9,45,83236', N'淨水設備,濾心,RO系列', N'櫻花', N'F0161', N'複合式濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81030', N'展板', N'9,45,83236', N'淨水設備,濾心,RO系列', N'櫻花', N'F0181', N'RO膜濾心(400G)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81031', N'展板', N'9,45,83236', N'淨水設備,濾心,RO系列', N'櫻花', N'F0182', N'RO膜濾心(600G)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81032', N'展板', N'9,45,83236', N'淨水設備,濾心,RO系列', N'櫻花', N'F0151', N'後置活性碳濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81033', N'展板', N'9,45,83237', N'淨水設備,濾心,SQC系列', N'櫻花', N'F0231', N'活性碳纖維濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81034', N'展板', N'9,45,83237', N'淨水設備,濾心,SQC系列', N'櫻花', N'F0211', N'PP濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81035', N'展板', N'9,45,83237', N'淨水設備,濾心,SQC系列', N'櫻花', N'F0221', N'前置樹脂濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81036', N'展板', N'83300,83302,16,83240', N'熱水器,太陽能熱泵(綠能熱水器),熱泵,一體式', N'櫻花', N'SE8102', N'熱泵熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81063', N'展板', N'83300,83227,14,83204', N'熱水器,電能熱水器,儲熱式,倍容定溫系列', N'櫻花', N'EH0651S6', N'倍容定溫熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81078', N'展板', N'83301,83307,49', N'廚房電器,烤箱與電器收納櫃,電器收納櫃', N'櫻花', N'E3625', N'嵌入式電器收納櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81083', N'展板', N'81002,83006', N'SVAGO,IH感應爐具 ', N'SVAGO', N'TID6516', N'三口感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81086', N'展板', N'81002,83006', N'SVAGO,IH感應爐具 ', N'SVAGO', N'TID3510', N'雙口感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81088', N'展板', N'81002,83006', N'SVAGO,IH感應爐具 ', N'SVAGO', N'TID2310 110V', N'單口感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81089', N'展板', N'81002,83006', N'SVAGO,IH感應爐具 ', N'SVAGO', N'TID2310 220V', N'單口感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81095', N'展板', N'9,45,83244', N'淨水設備,濾心,濾心組合系列', N'櫻花', N'F0191', N'RO淨水器專用濾心3支入(一年份)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81096', N'展板', N'9,45,83244', N'淨水設備,濾心,濾心組合系列', N'櫻花', N'F0192', N'RO淨水器專用濾心4支入(一年份)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81097', N'展板', N'9,45,83244', N'淨水設備,濾心,濾心組合系列', N'櫻花', N'F0193', N'RO淨水器專用濾心7支入(400G二年份)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81098', N'展板', N'9,45,83244', N'淨水設備,濾心,濾心組合系列', N'櫻花', N'F0194', N'RO淨水器專用濾心7支入(600G二年份)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81099', N'展板', N'9,45,83244', N'淨水設備,濾心,濾心組合系列', N'櫻花', N'F0195', N'RO淨水器專用濾心9支入(400G二年份)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81100', N'展板', N'9,45,83244', N'淨水設備,濾心,濾心組合系列', N'櫻花', N'F0196', N'RO淨水器專用濾心9支入(600G二年份)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81116', N'官網', NULL, NULL, N'櫻花', N'細鋁框玻璃門', N'細鋁框玻璃門', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81117', N'展板', NULL, NULL, N'櫻花', N'上掀桌板', N'上掀桌板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81117', N'官網', NULL, NULL, N'櫻花', N'上掀桌板', N'上掀桌板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81118', N'展板', NULL, NULL, N'櫻花', N'SAKURA靜音緩衝抽屜', N'SAKURA靜音緩衝抽屜', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81118', N'官網', NULL, NULL, N'櫻花', N'SAKURA靜音緩衝抽屜', N'SAKURA靜音緩衝抽屜', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81119', N'官網', N'83250,83246', N'邊櫃系列,備料延伸櫃', N'櫻花', N'細鋁框玻璃門', N'細鋁框玻璃門', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81120', N'官網', N'83250,83246', N'邊櫃系列,備料延伸櫃', N'櫻花', N'延伸桌板', N'延伸桌板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81121', N'官網', N'83250,83246', N'邊櫃系列,備料延伸櫃', N'櫻花', N'鍋具吊掛架', N'鍋具吊掛架', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81125', N'展板', N'71001,72001,73003', N'Electrolux,蒸烤設備,--- 蒸烤箱', N'Electrolux', N'EOB8857AAX', N'60cm蒸烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81128', N'展板', N'71001,73014', N'Electrolux,洗、脫、烘衣機', N'Electrolux', N'EWW1141AEWA', N'Wi-Fi智能洗脫烘衣機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81129', N'展板', N'83250,83254', N'邊櫃系列,茶水點心吧', N'櫻花', N'TTTTT-1010', N'細鋁框玻璃門', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81129', N'官網', N'83250,83254', N'邊櫃系列,茶水點心吧', N'櫻花', N'TTTTT-1010', N'細鋁框玻璃門', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81130', N'展板', N'83250,83254', N'邊櫃系列,茶水點心吧', N'櫻花', N'上掀桌板', N'上掀桌板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81130', N'官網', N'83250,83254', N'邊櫃系列,茶水點心吧', N'櫻花', N'上掀桌板', N'上掀桌板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81139', N'展板', N'83250,83254', N'邊櫃系列,茶水點心吧', N'櫻花', N'SAKURA靜音緩衝抽屜', N'SAKURA靜音緩衝抽屜', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81139', N'官網', N'83250,83254', N'邊櫃系列,茶水點心吧', N'櫻花', N'SAKURA靜音緩衝抽屜', N'SAKURA靜音緩衝抽屜', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81140', N'展板', N'83250,83247', N'邊櫃系列,小家電收納吧(90cm)', N'櫻花', N'造型開放櫃', N'犀利鉤掛件', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81140', N'官網', N'83250,83247', N'邊櫃系列,小家電收納吧(90cm)', N'櫻花', N'造型開放櫃', N'犀利鉤掛件', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81141', N'展板', N'83250,83247', N'邊櫃系列,小家電收納吧(90cm)', N'櫻花', N'開放式電器櫃 ', N'SAKURA靜音緩衝抽屜', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81141', N'官網', N'83250,83247', N'邊櫃系列,小家電收納吧(90cm)', N'櫻花', N'開放式電器櫃 ', N'SAKURA靜音緩衝抽屜', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81142', N'展板', N'9,42', N'淨水設備,SQC系列', N'櫻花', N'P0780', N'快捷高效淨水器(雙管除菌型)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81144', N'展板', N'83250,83247', N'邊櫃系列,小家電收納吧(90cm)', N'櫻花', N'平板抽', N'選配IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81144', N'官網', N'83250,83247', N'邊櫃系列,小家電收納吧(90cm)', N'櫻花', N'平板抽', N'選配IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81145', N'展板', N'83250,83248', N'邊櫃系列,小家電收納吧(120cm)', N'櫻花', N'造型開放櫃', N'犀利鉤掛件', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81145', N'官網', N'83250,83248', N'邊櫃系列,小家電收納吧(120cm)', N'櫻花', N'造型開放櫃', N'犀利鉤掛件', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81146', N'展板', N'83250,83248', N'邊櫃系列,小家電收納吧(120cm)', N'櫻花', N'平板抽/上掀桌板 開放式電器櫃', N'SAKURA靜音緩衝抽屜', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81146', N'官網', N'83250,83248', N'邊櫃系列,小家電收納吧(120cm)', N'櫻花', N'平板抽/上掀桌板 開放式電器櫃', N'SAKURA靜音緩衝抽屜', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81147', N'展板', N'83250,83248', N'邊櫃系列,小家電收納吧(120cm)', N'櫻花', N'行動餐車', N'行動餐車', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81147', N'官網', N'83250,83248', N'邊櫃系列,小家電收納吧(120cm)', N'櫻花', N'行動餐車', N'行動餐車', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81148', N'展板', N'83250,83246', N'邊櫃系列,備料延伸櫃', N'櫻花', N'細鋁框玻璃門', N'細鋁框玻璃門', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81148', N'官網', N'83250,83246', N'邊櫃系列,備料延伸櫃', N'櫻花', N'細鋁框玻璃門', N'細鋁框玻璃門', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81149', N'展板', N'83250,83246', N'邊櫃系列,備料延伸櫃', N'櫻花', N'延伸桌板', N'延伸桌板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81149', N'官網', N'83250,83246', N'邊櫃系列,備料延伸櫃', N'櫻花', N'延伸桌板', N'延伸桌板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81150', N'展板', N'83250,83246', N'邊櫃系列,備料延伸櫃', N'櫻花', N'鍋具吊掛架', N'鍋具吊掛架', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81150', N'官網', N'83250,83246', N'邊櫃系列,備料延伸櫃', N'櫻花', N'鍋具吊掛架', N'鍋具吊掛架', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81161', N'展板', N'71001,72006,73007', N'Electrolux,爐具,--- 感應爐', N'Electrolux', N'EIT913', N'三口感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81164', N'展板', N'71001,72006,73009', N'Electrolux,爐具,--- 瓦斯爐', N'Electrolux', N'EGT9239CK', N'玻璃三口瓦斯爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81165', N'展板', N'71001,72006,73009', N'Electrolux,爐具,--- 瓦斯爐', N'Electrolux', N'EGT7828CK', N'玻璃雙口瓦斯爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81167', N'展板', N'83100,83198', N'水槽,不鏽鋼單槽水槽組', N'櫻花', N'SKL006B', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81167', N'官網', N'83100,83198', N'水槽,不鏽鋼單槽水槽組', N'櫻花', N'SKL006B', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81168', N'展板', N'83100,83198', N'水槽,不鏽鋼單槽水槽組', N'櫻花', N'SKL303', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81168', N'官網', N'83100,83198', N'水槽,不鏽鋼單槽水槽組', N'櫻花', N'SKL303', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81169', N'展板', N'83100,83198', N'水槽,不鏽鋼單槽水槽組', N'櫻花', N'SKL104F', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81169', N'官網', N'83100,83198', N'水槽,不鏽鋼單槽水槽組', N'櫻花', N'SKL104F', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81175', N'展板', N'83100,83198', N'水槽,不鏽鋼單槽水槽組', N'櫻花', N'SKL166/SKL166L', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81175', N'官網', N'83100,83198', N'水槽,不鏽鋼單槽水槽組', N'櫻花', N'SKL166/SKL166L', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81176', N'展板', N'83100,83198', N'水槽,不鏽鋼單槽水槽組', N'櫻花', N'SKL101BA', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81176', N'官網', N'83100,83198', N'水槽,不鏽鋼單槽水槽組', N'櫻花', N'SKL101BA', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81177', N'展板', N'83100,83198', N'水槽,不鏽鋼單槽水槽組', N'櫻花', N'SKL105FL/R', N'不鏽鋼海灣單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81177', N'官網', N'83100,83198', N'水槽,不鏽鋼單槽水槽組', N'櫻花', N'SKL105FL/R', N'不鏽鋼海灣單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81180', N'展板', N'83100,83198', N'水槽,不鏽鋼單槽水槽組', N'櫻花', N'SKL505AF', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81180', N'官網', N'83100,83198', N'水槽,不鏽鋼單槽水槽組', N'櫻花', N'SKL505AF', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81181', N'展板', N'83100,83198', N'水槽,不鏽鋼單槽水槽組', N'櫻花', N'SKL301F', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81181', N'官網', N'83100,83198', N'水槽,不鏽鋼單槽水槽組', N'櫻花', N'SKL301F', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81183', N'展板', N'83100,83356', N'水槽,不鏽鋼壓花水槽', N'櫻花', N'SKL602', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81183', N'官網', N'83100,83356', N'水槽,不鏽鋼壓花水槽', N'櫻花', N'SKL602', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81184', N'展板', N'83100,83356', N'水槽,不鏽鋼壓花水槽', N'櫻花', N'SKL605L/R', N'不鏽鋼海灣單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81184', N'官網', N'83100,83356', N'水槽,不鏽鋼壓花水槽', N'櫻花', N'SKL605L/R', N'不鏽鋼海灣單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81186', N'展板', N'83100,83358', N'水槽,CARYSIL花崗岩水槽', N'櫻花', N'C07-1001/5001/7001', N'德國CARYSIL珂瑞 花崗岩單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81186', N'官網', N'83100,83358', N'水槽,CARYSIL花崗岩水槽', N'櫻花', N'C07-1001/5001/7001', N'德國CARYSIL珂瑞 花崗岩單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81188', N'展板', N'83301,6,32', N'廚房電器,除油煙機,深罩系列', N'櫻花', N'R3680', N'健康取向除油煙機-雙效除油', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81191', N'展板', N'83097,83219', N'收納五金,抽屜地櫃收納', N'櫻花', N'GRASS SCALA靜音緩衝抽屜地櫃', N'GRASS SCALA靜音緩衝抽屜地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81191', N'官網', N'83097,83219', N'收納五金,抽屜地櫃收納', N'櫻花', N'GRASS SCALA靜音緩衝抽屜地櫃', N'GRASS SCALA靜音緩衝抽屜地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81196', N'展板', N'83301,8,40', N'廚房電器,殺菌烘碗機,落地系列', N'櫻花', N'Q7697L', N'全平面雙熱風循環落地式烘碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81199', N'展板', N'81002,82001,83003', N'SVAGO,烤箱/蒸烤設備,--- 蒸烤箱', N'SVAGO', N'SN1282', N'嵌入式蒸烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81207', N'展板', N'83300,83302,16,83271', N'熱水器,太陽能熱泵(綠能熱水器),熱泵,直熱式', N'櫻花', N'SE0505', N'直熱分離式', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81208', N'展板', N'83300,83302,16,83271', N'熱水器,太陽能熱泵(綠能熱水器),熱泵,直熱式', N'櫻花', N'SE0305', N'直熱分離式', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81281', N'展板', N'81002,83010', N'SVAGO,排油煙機', N'SVAGO', N'VR7150SXL', N'壁掛式排油煙機90', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81282', N'展板', N'81002,83010', N'SVAGO,排油煙機', N'SVAGO', N'VR7150SXXL', N'壁掛式排油煙機120', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81283', N'展板', N'81002,83242', N'SVAGO,洗脫烘洗衣機', N'SVAGO', N'SWD596A', N'洗脫烘三體一機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81284', N'展板', N'83301,6,29', N'廚房電器,除油煙機,歐化系列 ', N'櫻花', N'DR7796SXL', N'歐化除油煙機-渦輪變頻 AI風控系列', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81287', N'展板', N'9,45,83244', N'淨水設備,濾心,濾心組合系列', N'櫻花', N'F0190', N'RO淨水器超值濾心組(一年份8支入)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81288', N'展板', N'83300,83227,14,83282', N'熱水器,電能熱水器,儲熱式,倍容系列', N'櫻花', N'EH2630S6', N'倍容儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81302', N'展板', N'83300,83227,14,24', N'熱水器,電能熱水器,儲熱式,標準系列', N'櫻花', N'EH3010S4/6', N'30加侖儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81303', N'展板', N'83300,83227,14,24', N'熱水器,電能熱水器,儲熱式,標準系列', N'櫻花', N'EH2010S4', N'20加侖儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81304', N'展板', N'83300,83227,14,24', N'熱水器,電能熱水器,儲熱式,標準系列', N'櫻花', N'EH5010S6', N'50加侖儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81305', N'展板', N'83300,83227,14,24', N'熱水器,電能熱水器,儲熱式,標準系列', N'櫻花', N'EH1210S4/6', N'12加侖儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81306', N'展板', N'83300,83227,14,24', N'熱水器,電能熱水器,儲熱式,標準系列', N'櫻花', N'EH1210LS4', N'12加侖儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81307', N'展板', N'83300,83227,14,24', N'熱水器,電能熱水器,儲熱式,標準系列', N'櫻花', N'EH0810S6', N'8加侖儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81308', N'展板', N'83300,83227,14,24', N'熱水器,電能熱水器,儲熱式,標準系列', N'櫻花', N'EH0810LS6', N'8加侖儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81309', N'展板', N'83301,6,29', N'廚房電器,除油煙機,歐化系列 ', N'櫻花', N'R3750B', N'環吸系列', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81310', N'展板', N'9,42', N'淨水設備,SQC系列', N'櫻花', N'P0672C', N'前置軟水過濾器(單管過濾型)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81361', N'展板', N'83301,162', N'廚房電器,IH感應爐', N'櫻花', N'EG2231G', N'單口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81362', N'展板', N'83301,162', N'廚房電器,IH感應爐', N'櫻花', N'EG2331G', N'雙口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81373', N'展板', N'9,42', N'淨水設備,SQC系列', N'櫻花', N'P0782', N'快捷高效淨水器(除鉛生飲型)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81374', N'展板', N'71001,73013', N'Electrolux,洗碗機', N'Electrolux', N'KECA7300L', N'上拉式全嵌式洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81375', N'展板', N'71001,73013', N'Electrolux,洗碗機', N'Electrolux', N'KEZB9300L', N'全嵌式洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81376', N'展板', N'71001,73013', N'Electrolux,洗碗機', N'Electrolux', N'KESB7200L', N'全嵌式洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81377', N'展板', N'71001,73013', N'Electrolux,洗碗機', N'Electrolux', N'EEM48300IX', N'半嵌式洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81379', N'展板', N'71001,73014', N'Electrolux,洗、脫、烘衣機', N'Electrolux', N'EWW1142ADWA', N'極淨呵護系列-洗脫烘衣機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81384', N'展板', N'81002,82001,83002', N'SVAGO,烤箱/蒸烤設備,--- 烤箱', N'SVAGO', N'VE6860', N'高溫自清烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81385', N'展板', N'81002,82001,83002', N'SVAGO,烤箱/蒸烤設備,--- 烤箱', N'SVAGO', N'VE6660', N'食物探針烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81387', N'展板', N'9,41', N'淨水設備,RO系列', N'櫻花', N'P0121', N'標準型RO淨水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81421', N'展板', N'83301,6,29', N'廚房電器,除油煙機,歐化系列 ', N'櫻花', N'R7722B', N'歐化除油煙機-環吸系列', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81422', N'展板', N'83301,6,29', N'廚房電器,除油煙機,歐化系列 ', N'櫻花', N'DR7786B', N'歐化除油煙機-渦輪變頻 環吸系列', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81427', N'展板', N'9,45,83236', N'淨水設備,濾心,RO系列', N'櫻花', N'F0162', N'雙效複合式濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81428', N'展板', N'9,45,83236', N'淨水設備,濾心,RO系列', N'櫻花', N'F0185', N'RO膜濾心(400G)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81429', N'展板', N'9,45,83236', N'淨水設備,濾心,RO系列', N'櫻花', N'F0186', N'RO膜濾心(600G)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81430', N'展板', N'9,45,83236', N'淨水設備,濾心,RO系列', N'櫻花', N'F0110', N'PP濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81431', N'展板', N'9,45,83236', N'淨水設備,濾心,RO系列', N'櫻花', N'F0130', N'CB濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81432', N'展板', N'9,45,83236', N'淨水設備,濾心,RO系列', N'櫻花', N'F0180', N'RO膜濾心(50G)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81445', N'展板', N'9,45,83236', N'淨水設備,濾心,RO系列', N'櫻花', N'F0150', N'GAC濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81481', N'展板', N'9,45,83237', N'淨水設備,濾心,SQC系列', N'櫻花', N'F0232', N'除鉛活性碳纖維濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81491', N'展板', N'81002,82001,83005', N'SVAGO,烤箱/蒸烤設備,--- 微波烤箱', N'SVAGO', N'VE8966', N'蒸烘烤變頻微波爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81497', N'展板', N'83301,7,37,157', N'廚房電器,瓦斯爐,檯面爐,易清系列', N'櫻花', N'G2623AG', N'二口大面板易清檯面爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81500', N'展板', N'81002,83013', N'SVAGO,洗碗機', N'SVAGO', N'VE7750', N'全嵌式自動開門洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81544', N'展板', N'81002,83013', N'SVAGO,洗碗機', N'SVAGO', N'VE7650', N'半嵌式自動開門洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81545', N'展板', N'83301,162', N'廚房電器,IH感應爐', N'櫻花', N'EG2250G', N'單口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81546', N'展板', N'83301,162', N'廚房電器,IH感應爐', N'櫻花', N'EG2350G', N'雙口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81547', N'展板', N'83301,8,40', N'廚房電器,殺菌烘碗機,落地系列', N'櫻花', N'Q7650L', N'全平面落地式烘碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81548', N'展板', N'81002,82001,83003', N'SVAGO,烤箱/蒸烤設備,--- 蒸烤箱', N'SVAGO', N'VE8960', N'嵌入式蒸烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81549', N'展板', N'83100,83357', N'水槽,手工方型槽', N'櫻花', N'SF-750A-01/02', N'不鏽鋼單槽手工方型水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81549', N'官網', N'83100,83357', N'水槽,手工方型槽', N'櫻花', N'SF-750A-01/02', N'不鏽鋼單槽手工方型水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81550', N'展板', N'83100,83357', N'水槽,手工方型槽', N'櫻花', N'SF-850A-01/02', N'不鏽鋼單槽手工方型水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81550', N'官網', N'83100,83357', N'水槽,手工方型槽', N'櫻花', N'SF-850A-01/02', N'不鏽鋼單槽手工方型水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81551', N'展板', N'83100,83357', N'水槽,手工方型槽', N'櫻花', N'SF-550A', N'不鏽鋼單槽手工方型水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81551', N'官網', N'83100,83357', N'水槽,手工方型槽', N'櫻花', N'SF-550A', N'不鏽鋼單槽手工方型水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81554', N'展板', N'81002,83010', N'SVAGO,排油煙機', N'SVAGO', N'VR7151SXL', N'壁掛式排油煙機90', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81582', N'展板', N'83300,83227,14,25', N'熱水器,電能熱水器,儲熱式,e省電系列', N'櫻花', N'EH1210TS6/S4', N'儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81584', N'展板', N'83300,83227,14,25', N'熱水器,電能熱水器,儲熱式,e省電系列', N'櫻花', N'EH1210LTS4', N'儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81586', N'展板', N'83301,6,156', N'廚房電器,除油煙機,流線系列', N'櫻花', N'DR3882B', N'流線型雙效除油除油煙機 -渦輪變頻系列', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81587', N'展板', N'83301,6,156', N'廚房電器,除油煙機,流線系列', N'櫻花', N'DR3880B', N'流線型除油煙機 -渦輪變頻系列', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81588', N'展板', N'83301,6,29', N'廚房電器,除油煙機,歐化系列 ', N'櫻花', N'DR7790B', N'歐化除油煙機-渦輪變頻 環吸系列', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81591', N'展板', N'71001,72001,73003', N'Electrolux,蒸烤設備,--- 蒸烤箱', N'Electrolux', N'KOAAS31X', N'極致美味 900 Steam Pro 專業舒肥蒸烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81596', N'展板', N'83301,162', N'廚房電器,IH感應爐', N'櫻花', N'EG2120GB', N'單口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81606', N'展板', N'9,45,83244', N'淨水設備,濾心,濾心組合系列', N'櫻花', N'F2192', N'雙效RO淨水器專用濾心2支入(一年份)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81607', N'展板', N'9,45,83244', N'淨水設備,濾心,濾心組合系列', N'櫻花', N'F2193', N'雙效RO淨水器專用濾心3支入(400G二年份)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81608', N'展板', N'9,45,83244', N'淨水設備,濾心,濾心組合系列', N'櫻花', N'F2194', N'雙效RO淨水器專用濾心3支入(600G二年份)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81609', N'展板', N'9,45,83244', N'淨水設備,濾心,濾心組合系列', N'櫻花', N'F2195', N'雙效RO淨水器專用濾心5支入(400G二年份)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81610', N'展板', N'9,45,83244', N'淨水設備,濾心,濾心組合系列', N'櫻花', N'F2196', N'雙效RO淨水器專用濾心5支入(600G二年份)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81611', N'展板', N'9,45,83244', N'淨水設備,濾心,濾心組合系列', N'櫻花', N'F1191', N'標準型RO淨水器專用濾心4支入(一年份)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81612', N'展板', N'9,45,83244', N'淨水設備,濾心,濾心組合系列', N'櫻花', N'F1192', N'標準型RO淨水器專用濾心7支入(一年份)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81615', N'展板', N'71001,72001,73002', N'Electrolux,蒸烤設備,--- 烤箱', N'Electrolux', N'KODDP71XA', N'極致美味 500 Steam Bake 蒸氣旋風烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81616', N'展板', N'71001,72001,73002', N'Electrolux,蒸烤設備,--- 烤箱', N'Electrolux', N'KOMGH60TXA', N'極致美味500 Air Fry氣炸烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81618', N'展板', N'83300,83227,14,25', N'熱水器,電能熱水器,儲熱式,e省電系列', N'櫻花', N'EH3010TS6/S4', N'儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81619', N'展板', N'83300,83227,14,25', N'熱水器,電能熱水器,儲熱式,e省電系列', N'櫻花', N'EH2010TS4', N'儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81620', N'展板', N'81002,83243', N'SVAGO,紅酒櫃', N'SVAGO', N'JG45B', N'紅酒櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81622', N'展板', N'71001,73013', N'Electrolux,洗碗機', N'Electrolux', N'EEZB9410L', N'800 Series 全嵌式洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81623', N'展板', N'71001,73013', N'Electrolux,洗碗機', N'Electrolux', N'EESB7310L', N'600 Series 全嵌式洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81624', N'展板', N'71001,72001,73003', N'Electrolux,蒸烤設備,--- 蒸烤箱', N'Electrolux', N'KVBAS21WX', N'極致美味 900 Steam Boost 多功能蒸烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81629', N'展板', N'71001,72006,73007', N'Electrolux,爐具,--- 感應爐', N'Electrolux', N'EHI977BE', N'Sense Fry 煎炒控溫七口IH感應爐 ', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81630', N'展板', N'71001,72006,73007', N'Electrolux,爐具,--- 感應爐', N'Electrolux', N'EHI945BE', N'Sense Boil 沸騰偵測四口IH感應爐  ', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81632', N'展板', N'71001,72006,73007', N'Electrolux,爐具,--- 感應爐', N'Electrolux', N'EHI3251BE', N'橋接功能 直式雙口IH感應爐 ', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81633', N'展板', N'83301,7,37,164', N'廚房電器,瓦斯爐,檯面爐,雙炫火系列', N'櫻花', N'G2921G', N'二口雙炫火玻璃檯面爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81640', N'展板', N'81002,83013', N'SVAGO,洗碗機', N'SVAGO', N'VE7850', N'獨立式自動開門洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81643', N'展板', N'83301,6,83205', N'廚房電器,除油煙機,近吸系列', N'櫻花', N'R7653', N'近吸除油煙機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81679', N'展板', N'81002,83013', N'SVAGO,洗碗機', N'SVAGO', N'VE7545', N'半嵌式45cm自動開門洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81684', N'展板', N'83301,7,35,54', N'廚房電器,瓦斯爐,台爐 ,標準系列', N'櫻花', N'G5611', N'三環銅爐頭安全爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81685', N'展板', N'83301,7,74,76', N'廚房電器,瓦斯爐,嵌入爐,標準系列', N'櫻花', N'G6611', N'三環銅爐頭安全爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81687', N'展板', N'9,42', N'淨水設備,SQC系列', N'櫻花', N'P0771', N'生飲淨水器(適用水區:北北基、桃園、宜蘭)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81688', N'展板', N'9,42', N'淨水設備,SQC系列', N'櫻花', N'P0772', N'生飲淨水器(適用水區:新竹、苗栗、台中、南投、雲林、嘉義、台南、花蓮)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81689', N'展板', N'9,42', N'淨水設備,SQC系列', N'櫻花', N'P0773', N'生飲淨水器(適用水區:彰化、高雄、屏東、台東)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81690', N'展板', N'9,45,83237', N'淨水設備,濾心,SQC系列', N'櫻花', N'F0261', N'除菌軟水雙效濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81691', N'展板', N'9,45,83237', N'淨水設備,濾心,SQC系列', N'櫻花', N'F0262', N'除菌軟水雙效濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81692', N'展板', N'9,45,83237', N'淨水設備,濾心,SQC系列', N'櫻花', N'F0263', N'除菌軟水雙效濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81693', N'展板', N'83301,7,37,153', N'廚房電器,瓦斯爐,檯面爐,高效系列', N'櫻花', N'G2826G', N'二口高效玻璃檯面爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81694', N'展板', N'83100,83198', N'水槽,不鏽鋼單槽水槽組', N'櫻花', N'SKL506A-03', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81694', N'官網', N'83100,83198', N'水槽,不鏽鋼單槽水槽組', N'櫻花', N'SKL506A-03', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81696', N'展板', N'83100,83198', N'水槽,不鏽鋼單槽水槽組', N'櫻花', N'SPDL-V08', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81696', N'官網', N'83100,83198', N'水槽,不鏽鋼單槽水槽組', N'櫻花', N'SPDL-V08', N'不鏽鋼單槽水槽組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81698', N'展板', N'83100,83201', N'水槽,SAKURA嚴選人造石水槽', N'櫻花', N'JB650W/B/Y/P/G', N'人造石水槽(白/藍/黃/粉/綠)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81698', N'官網', N'83100,83201', N'水槽,SAKURA嚴選人造石水槽', N'櫻花', N'JB650W/B/Y/P/G', N'人造石水槽(白/藍/黃/粉/綠)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81699', N'展板', N'83100,83201', N'水槽,SAKURA嚴選人造石水槽', N'櫻花', N'JB760W/B/Y/P/G', N'人造石水槽(白/藍/黃/粉/綠)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81699', N'官網', N'83100,83201', N'水槽,SAKURA嚴選人造石水槽', N'櫻花', N'JB760W/B/Y/P/G', N'人造石水槽(白/藍/黃/粉/綠)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81702', N'展板', N'81002,83006', N'SVAGO,IH感應爐具 ', N'SVAGO', N'VEG2380', N'橫式雙口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81709', N'展板', N'81002,83006', N'SVAGO,IH感應爐具 ', N'SVAGO', N'VEG2670', N'橫式多口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81711', N'展板', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'活動摺疊桌地櫃', N'活動摺疊桌地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81711', N'官網', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'活動摺疊桌地櫃', N'活動摺疊桌地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81716', N'展板', N'83300,5,13,177', N'熱水器,瓦斯熱水器,恆溫熱水器,渦輪增壓系列', N'櫻花', N'DH1695F', N'16L 四季溫渦輪增壓 熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81717', N'展板', N'83300,5,13,177', N'熱水器,瓦斯熱水器,恆溫熱水器,渦輪增壓系列', N'櫻花', N'DH1693F', N'16L 四季溫渦輪增壓 熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81718', N'展板', N'83300,5,13,83094', N'熱水器,瓦斯熱水器,恆溫熱水器,智能恆溫系列', N'櫻花', N'DH1672F', N'16L 四季溫智慧水量 熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81719', N'展板', N'83300,5,13,83094', N'熱水器,瓦斯熱水器,恆溫熱水器,智能恆溫系列', N'櫻花', N'DH1670F', N'16L 四季溫智慧水量 熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81720', N'展板', N'83300,5,13,83094', N'熱水器,瓦斯熱水器,恆溫熱水器,智能恆溫系列', N'櫻花', N'DH1638F', N'16L 四季溫智能恆溫熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81755', N'展板', N'83301,7,74,76', N'廚房電器,瓦斯爐,嵌入爐,標準系列', N'櫻花', N'G6320A', N'銅爐頭嵌入爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81756', N'展板', N'83301,83307,83210', N'廚房電器,烤箱與電器收納櫃,嵌入式微波烤箱', N'櫻花', N'E5650A', N'嵌入式變頻微波烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81757', N'展板', N'81002,82001,83005', N'SVAGO,烤箱/蒸烤設備,--- 微波烤箱', N'SVAGO', N'VE5060', N'變頻微波烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81758', N'展板', N'81002,83010', N'SVAGO,排油煙機', N'SVAGO', N'VR7236SXL', N'中島式排油煙機90', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81759', N'展板', N'81002,83010', N'SVAGO,排油煙機', N'SVAGO', N'VR7236SXXL', N'中島式排油煙機120', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81760', N'展板', N'83301,8,39', N'廚房電器,殺菌烘碗機,吊掛系列', N'櫻花', N'Q7580BS', N'殺菌烘碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81763', N'展板', N'81002,83006', N'SVAGO,IH感應爐具 ', N'SVAGO', N'VEG 2520', N'橫式三口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81778', N'展板', N'83098,83191', N'龍頭,廚房不鏽鋼無鉛立式龍頭', N'櫻花', N'LF119022', N'廚房不鏽鋼無鉛立式龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81778', N'官網', N'83098,83191', N'龍頭,廚房不鏽鋼無鉛立式龍頭', N'櫻花', N'LF119022', N'廚房不鏽鋼無鉛立式龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81779', N'展板', N'83098,83363', N'龍頭,廚房不鏽鋼無鉛三用龍頭', N'櫻花', N'LF119033', N'廚房不鏽鋼無鉛三用龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81779', N'官網', N'83098,83363', N'龍頭,廚房不鏽鋼無鉛三用龍頭', N'櫻花', N'LF119033', N'廚房不鏽鋼無鉛三用龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81790', N'展板', N'71001,72006,73007', N'Electrolux,爐具,--- 感應爐', N'Electrolux', N'EHI7280BE', N'橫式雙口感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81791', N'展板', N'83301,162', N'廚房電器,IH感應爐', N'櫻花', N'EG2100G', N'單口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81792', N'展板', N'83301,162', N'廚房電器,IH感應爐', N'櫻花', N'EG2200G', N'雙口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81829', N'展板', N'81002,83013', N'SVAGO,洗碗機', N'SVAGO', N'VE7770', N'全嵌式自動開門洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81830', N'展板', N'81002,83242', N'SVAGO,洗脫烘洗衣機', N'SVAGO', N'VE9960', N'洗脫烘衣機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81833', N'展板', N'83301,162', N'廚房電器,IH感應爐', N'櫻花', N'EG2300G', N'三口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81834', N'展板', N'83301,8,40', N'廚房電器,殺菌烘碗機,落地系列', N'櫻花', N'Q7650ML', N'殺菌烘碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81835', N'展板', N'83301,48', N'廚房電器,洗碗機', N'櫻花', N'E7683', N'半嵌式自動開門洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81836', N'展板', N'83301,48', N'廚房電器,洗碗機', N'櫻花', N'E7783', N'全嵌式自動開門洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81838', N'展板', N'83301,8,83114', N'廚房電器,殺菌烘碗機,嵌門板系列', N'櫻花', N'Q7596B', N'殺菌烘碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81839', N'展板', N'83312,83313,83332', N'TEKA,洗碗機,半嵌式洗碗機', N'TEKA', N'DW8 57 SI', N'半嵌式熱烘存自動開門洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81840', N'展板', N'83301,6,156', N'廚房電器,除油煙機,流線系列', N'櫻花', N'DR3885B', N'流線型除油煙機-渦輪變頻 智能風控系列', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81841', N'展板', N'83301,7,37,157', N'廚房電器,瓦斯爐,檯面爐,易清系列', N'櫻花', N'G2522BG', N'二口小面板易清檯面爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81842', N'展板', N'81002,82001,83003', N'SVAGO,烤箱/蒸烤設備,--- 蒸烤箱', N'SVAGO', N'VE8969', N'過熱水蒸氣烘烤爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81845', N'展板', N'81002,83006', N'SVAGO,IH感應爐具 ', N'SVAGO', N'VEG2380W', N'橫式雙口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81851', N'展板', N'83300,83227,14,24', N'熱水器,電能熱水器,儲熱式,標準系列', N'櫻花', N'EH5010A6', N'儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81852', N'展板', N'83300,83227,14,24', N'熱水器,電能熱水器,儲熱式,標準系列', N'櫻花', N'EH3010A6', N'儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81853', N'展板', N'83300,83227,14,24', N'熱水器,電能熱水器,儲熱式,標準系列', N'櫻花', N'EH2010A4', N'儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81854', N'展板', N'83300,83227,14,24', N'熱水器,電能熱水器,儲熱式,標準系列', N'櫻花', N'EH1210AL4', N'儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81855', N'展板', N'83300,83227,14,24', N'熱水器,電能熱水器,儲熱式,標準系列', N'櫻花', N'EH1210A4/A6', N'儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81856', N'展板', N'83300,83227,14,24', N'熱水器,電能熱水器,儲熱式,標準系列', N'櫻花', N'EH0810AL6', N'儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81857', N'展板', N'83300,83227,14,24', N'熱水器,電能熱水器,儲熱式,標準系列', N'櫻花', N'EH0810A6', N'儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81858', N'展板', N'83312,83313,83332', N'TEKA,洗碗機,半嵌式洗碗機', N'TEKA', N'DW8 57 SI E01', N'半嵌式熱烘存自動開門洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81859', N'展板', N'9,45,83244', N'淨水設備,濾心,濾心組合系列', N'櫻花', N'F9001', N'SQC 生飲淨水器專用濾心組 (一年份2支入)', N'F9001')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81860', N'展板', N'9,45,83244', N'淨水設備,濾心,濾心組合系列', N'櫻花', N'F9002', N'SQC 生飲淨水器專用濾心組 (一年份2支入)', N'F9002')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81861', N'展板', N'9,45,83244', N'淨水設備,濾心,濾心組合系列', N'櫻花', N'F9003', N'SQC 生飲淨水器專用濾心組 (一年份2支入)', N'F9003')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81863', N'展板', N'9,83280', N'淨水設備,濾心,濾心組合系列', N'櫻花', N'F9005', N'雙溫淨熱飲專用濾心組 (一年份5支入)', N'F9005')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81864', N'展板', N'83301,7,37,164', N'廚房電器,瓦斯爐,檯面爐,雙炫火系列', N'櫻花', N'G2922BG', N'二口雙炫火玻璃檯面爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81866', N'展板', N'83312,83314,83326', N'TEKA,蒸烤設備,烤箱', N'TEKA', N'STEAKMASTER', N'60cm牛排大師烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81868', N'展板', N'83312,83324', N'TEKA,其他', N'TEKA', N'CP 150 GS', N'保溫抽屜', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81869', N'展板', N'83312,83317,83330', N'TEKA,爐具,IH感應爐', N'TEKA', N'IBC 7322 S', N'橫式雙口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81870', N'展板', N'83312,83317,83330', N'TEKA,爐具,IH感應爐', N'TEKA', N'IBC 7320 D', N'橫式雙口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81872', N'展板', N'83312,83320,83336', N'TEKA,排油煙機,隱藏式油煙機', N'TEKA', N'CNL 6815 PLUS', N'抽拉式油煙機(60cm)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81873', N'展板', N'83312,83315', N'TEKA,紅酒櫃', N'TEKA', N'RVU 20046 GBK', N'獨立嵌入兩用紅酒櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81876', N'展板', N'83312,83319,83338', N'TEKA,水槽,花崗岩水槽', N'TEKA', N'FORSQUARE 7240 TGA B', N'上嵌式花崗岩水槽(黑)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81877', N'展板', N'83301,6,83205', N'廚房電器,除油煙機,近吸系列', N'櫻花', N'R7301A', N'近吸除油煙機-近吸隱藏系列(全隱藏)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81878', N'展板', N'83301,6,83205', N'廚房電器,除油煙機,近吸系列', N'櫻花', N'R7302A', N'近吸除油煙機-近吸隱藏系列(半隱藏)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81888', N'展板', N'83300,83227,14,83204', N'熱水器,電能熱水器,儲熱式,倍容定溫系列', N'櫻花', N'EH1851A6', N'倍容定溫儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81890', N'展板', N'83300,83227,14,83204', N'熱水器,電能熱水器,儲熱式,倍容定溫系列', N'櫻花', N'EH2651A6', N'倍容定溫儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81891', N'展板', N'83300,83227,14,83282', N'熱水器,電能熱水器,儲熱式,倍容系列', N'櫻花', N'EH0630AL6', N'倍容儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81893', N'展板', N'83300,83227,14,83282', N'熱水器,電能熱水器,儲熱式,倍容系列', N'櫻花', N'EH0630A6', N'倍容儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81896', N'展板', N'83300,83227,14,83282', N'熱水器,電能熱水器,儲熱式,倍容系列', N'櫻花', N'EH1230AL6', N'倍容儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81897', N'展板', N'83300,83227,14,83204', N'熱水器,電能熱水器,儲熱式,倍容定溫系列', N'櫻花', N'EH1251AL6', N'倍容定溫儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81898', N'展板', N'83300,83227,14,83282', N'熱水器,電能熱水器,儲熱式,倍容系列', N'櫻花', N'EH1230A6', N'倍容儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81899', N'展板', N'83300,83227,14,83204', N'熱水器,電能熱水器,儲熱式,倍容定溫系列', N'櫻花', N'EH1251A6', N'倍容定溫儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81902', N'展板', N'83300,83227,14,83282', N'熱水器,電能熱水器,儲熱式,倍容系列', N'櫻花', N'EH1830A6', N'倍容儲熱式電熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81903', N'展板', N'9,41', N'淨水設備,RO系列', N'櫻花', N'P0230A', N'RO淨水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81904', N'展板', N'83312,83319,83338', N'TEKA,水槽,花崗岩水槽', N'TEKA', N'FORSQUARE 7240 TGA A', N'上嵌式花崗岩水槽(米)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81905', N'展板', N'83312,83319,83338', N'TEKA,水槽,花崗岩水槽', N'TEKA', N'SQUARE 7240 TG B', N'下嵌式花崗岩水槽(黑)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81906', N'展板', N'83312,83319,83338', N'TEKA,水槽,花崗岩水槽', N'TEKA', N'SQUARE 7240 TG A', N'下嵌式花崗岩水槽(米)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81907', N'展板', N'83312,83319,83338', N'TEKA,水槽,花崗岩水槽', N'TEKA', N'FORSQUARE 5040 TGA B', N'上嵌式花崗岩水槽(黑)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81908', N'展板', N'83312,83319,83338', N'TEKA,水槽,花崗岩水槽', N'TEKA', N'FORSQUARE 5040 TGA A', N'上嵌式花崗岩水槽(米)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81909', N'展板', N'83312,83319,83338', N'TEKA,水槽,花崗岩水槽', N'TEKA', N'SQUARE 5040 TG B', N'下嵌式花崗岩水槽(黑)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81910', N'展板', N'83312,83319,83338', N'TEKA,水槽,花崗岩水槽', N'TEKA', N'SQUARE 5040 TG A', N'下嵌式花崗岩水槽(米)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81911', N'展板', N'83301,6,83205', N'廚房電器,除油煙機,近吸系列', N'櫻花', N'R7351', N'近吸除油煙機-近吸隱藏系列(全隱藏)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81912', N'展板', N'83301,6,83205', N'廚房電器,除油煙機,近吸系列', N'櫻花', N'R7352', N'近吸除油煙機-近吸隱藏系列(半隱藏)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81913', N'展板', N'9,41', N'淨水設備,RO系列', N'櫻花', N'P0233A', N'雙效RO淨水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81915', N'展板', N'9,83280', N'淨水設備,淨熱飲系列', N'櫻花', N'P0585', N'廚下雙溫淨熱飲', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81918', N'展板', N'83312,83319,83339', N'TEKA,水槽,不鏽鋼水槽', N'TEKA', N'ARQ7045', N'下嵌式不鏽鋼水槽', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81919', N'展板', N'83312,83319,83339', N'TEKA,水槽,不鏽鋼水槽', N'TEKA', N'ARQ5441', N'下嵌式不鏽鋼水槽', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81920', N'展板', N'83312,83319,83339', N'TEKA,水槽,不鏽鋼水槽', N'TEKA', N'BE LINEA RS15 7140', N'下嵌式不鏽鋼水槽', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81921', N'展板', N'83312,83319,83339', N'TEKA,水槽,不鏽鋼水槽', N'TEKA', N'BE LINEA RS15 4540', N'下嵌式不鏽鋼水槽', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81925', N'展板', N'83301,7,37,157', N'廚房電器,瓦斯爐,檯面爐,易清系列', N'櫻花', N'G2523YG', N'聚熱焱檯面爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81926', N'展板', N'83301,7,35,54', N'廚房電器,瓦斯爐,台爐 ,標準系列', N'櫻花', N'G633Y', N'聚熱焱安全爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81927', N'展板', N'83301,7,74,76', N'廚房電器,瓦斯爐,嵌入爐,標準系列', N'櫻花', N'G6330Y', N'聚熱焱安全爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81928', N'展板', N'83301,7,35,54', N'廚房電器,瓦斯爐,台爐 ,標準系列', N'櫻花', N'G616Y', N'聚熱焱安全爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81929', N'展板', N'83301,7,74,76', N'廚房電器,瓦斯爐,嵌入爐,標準系列', N'櫻花', N'G6160Y', N'聚熱焱安全爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81930', N'展板', N'83312,83317,83330', N'TEKA,爐具,IH感應爐', N'TEKA', N'IBS 32930 TTC', N'直式雙口感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81932', N'展板', N'83301,6,83205', N'廚房電器,除油煙機,近吸系列', N'櫻花', N'R7615', N'近吸除油煙機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81933', N'展板', N'83300,5,13,83094', N'熱水器,瓦斯熱水器,恆溫熱水器,智能恆溫系列', N'櫻花', N'DH1605A', N'16L 智能恆溫熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81935', N'展板', N'81002,83013', N'SVAGO,洗碗機', N'SVAGO', N'VE7190', N'獨立式熱風烘乾洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81936', N'展板', N'83312,83317,83330', N'TEKA,爐具,IH感應爐', N'TEKA', N'IZF 88700 MST', N'FullFlex 四口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81937', N'展板', N'83312,83317,83330', N'TEKA,爐具,IH感應爐', N'TEKA', N'IZC 93320 MST', N'橫式三口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81938', N'展板', N'83312,83317,83330', N'TEKA,爐具,IH感應爐', N'TEKA', N'IZF 65320 MSP', N'自由橋接 三口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81939', N'展板', N'83312,83317,83330', N'TEKA,爐具,IH感應爐', N'TEKA', N'IZS 34700 MST', N'直式滑控橋接 雙口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81942', N'展板', N'81002,83010', N'SVAGO,排油煙機', N'SVAGO', N'VR7010S', N'隱藏式排油煙機60', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81943', N'展板', N'81002,83006', N'SVAGO,IH感應爐具 ', N'SVAGO', N'VEG2220', N'直式雙口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81944', N'展板', N'81002,83010', N'SVAGO,排油煙機', N'SVAGO', N'VR7010SXL', N'隱藏式排油煙機90', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81945', N'展板', N'81002,83016', N'SVAGO,水槽', N'SVAGO', N'VUS750', N'下嵌式不鏽鋼水槽(75cm)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81947', N'展板', N'83100,83200', N'水槽,SAKURA花崗岩水槽', N'櫻花', N'SA-460-1/2/3/4/5/6/7/8', N'SAKURA花崗岩單槽水槽組', N'SA-460-1/2/3/4/5/6/7/8')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81947', N'官網', N'83100,83200', N'水槽,SAKURA花崗岩水槽', N'櫻花', N'SA-460-1/2/3/4/5/6/7/8', N'SAKURA花崗岩單槽水槽組', N'SA-460-1/2/3/4/5/6/7/8')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81948', N'展板', N'83100,83200', N'水槽,SAKURA花崗岩水槽', N'櫻花', N'SA-660-1/2/3/4/5/6/7/8', N'SAKURA花崗岩單槽水槽組', N'SA-660-1/2/3/4/5/6/7/8')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81948', N'官網', N'83100,83200', N'水槽,SAKURA花崗岩水槽', N'櫻花', N'SA-660-1/2/3/4/5/6/7/8', N'SAKURA花崗岩單槽水槽組', N'SA-660-1/2/3/4/5/6/7/8')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81949', N'展板', N'83100,83200', N'水槽,SAKURA花崗岩水槽', N'櫻花', N'SA-760-1/2/3/4/5/6/7/8', N'SAKURA花崗岩單槽水槽組', N'SA-760-1/2/3/4/5/6/7/8')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81949', N'官網', N'83100,83200', N'水槽,SAKURA花崗岩水槽', N'櫻花', N'SA-760-1/2/3/4/5/6/7/8', N'SAKURA花崗岩單槽水槽組', N'SA-760-1/2/3/4/5/6/7/8')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81950', N'展板', N'83100,83200', N'水槽,SAKURA花崗岩水槽', N'櫻花', N'SA-770-1/2/3/4/5/6/7/8', N'SAKURA花崗岩單槽水槽組', N'SA-770-1/2/3/4/5/6/7/8')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81950', N'官網', N'83100,83200', N'水槽,SAKURA花崗岩水槽', N'櫻花', N'SA-770-1/2/3/4/5/6/7/8', N'SAKURA花崗岩單槽水槽組', N'SA-770-1/2/3/4/5/6/7/8')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81951', N'展板', N'83100,83200', N'水槽,SAKURA花崗岩水槽', N'櫻花', N'SA-860-1/2/3/4/5/6/7/8', N'SAKURA花崗岩單槽水槽組', N'SA-860-1/2/3/4/5/6/7/8')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81951', N'官網', N'83100,83200', N'水槽,SAKURA花崗岩水槽', N'櫻花', N'SA-860-1/2/3/4/5/6/7/8', N'SAKURA花崗岩單槽水槽組', N'SA-860-1/2/3/4/5/6/7/8')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81952', N'展板', N'83100,83200', N'水槽,SAKURA花崗岩水槽', N'櫻花', N'SA-2860-1/2/3/4/5/6/7/8', N'SAKURA花崗岩雙槽水槽組', N'SA-2860-1/2/3/4/5/6/7/8')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81952', N'官網', N'83100,83200', N'水槽,SAKURA花崗岩水槽', N'櫻花', N'SA-2860-1/2/3/4/5/6/7/8', N'SAKURA花崗岩雙槽水槽組', N'SA-2860-1/2/3/4/5/6/7/8')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81954', N'展板', N'83301,83307,46', N'廚房電器,烤箱與電器收納櫃,嵌入式微波蒸烤箱', N'櫻花', N'E8891', N'嵌入式微波蒸烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81957', N'展板', N'83300,83227,14,83343', N'熱水器,電能熱水器,儲熱式,前置抑垢系列', N'櫻花', N'P9870', N'前置抑垢器', N'P9870')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81958', N'展板', N'83300,83227,14,83343', N'熱水器,電能熱水器,儲熱式,前置抑垢系列', N'櫻花', N'EHF6220', N'前置抑垢器濾芯', N'EHF6220')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81960', N'展板', N'9,83280', N'淨水設備,淨熱飲系列', N'櫻花', N'P0531', N'廚下RO雙溫淨熱飲', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81961', N'展板', N'9,83280', N'淨水設備,淨熱飲系列', N'櫻花', N'P5530W', N'檯面RO淨熱飲', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81962', N'展板', N'83301,6,83205', N'廚房電器,除油煙機,近吸系列', N'櫻花', N'DR7396', N'近吸除油煙機- 渦輪變頻 AI風控系列', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81963', N'展板', N'83301,6,29', N'廚房電器,除油煙機,歐化系列 ', N'櫻花', N'DR7788', N'AI除油煙機-渦輪變頻 環吸系列', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81964', N'展板', N'83301,7,37,164', N'廚房電器,瓦斯爐,檯面爐,雙炫火系列', N'櫻花', N'G2929G', N'智能雙炫火精控爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81965', N'展板', N'81002,83006', N'SVAGO,IH感應爐具 ', N'SVAGO', N'VEG2350', N'橫式雙口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81966', N'展板', N'81002,83010', N'SVAGO,排油煙機', N'SVAGO', N'VDR7191XL', N'智能風控壁掛式排油煙機90', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81967', N'展板', N'81002,83010', N'SVAGO,排油煙機', N'SVAGO', N'VDR7191XXL', N'智能風控壁掛式排油煙機120', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81968', N'展板', N'9,45,83236', N'淨水設備,濾心,RO系列', N'櫻花', N'F3180', N'MRO濾心(75G)', N'F3180')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81969', N'展板', N'81002,83016', N'SVAGO,水槽', N'SVAGO', N'VUS850', N'下嵌式不鏽鋼水槽(85cm)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81973', N'展板', N'9,155', N'淨水設備,熱飲機系列', N'櫻花', N'P0563B', N'廚下觸控式熱飲機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81976', N'展板', N'83098,83194', N'龍頭,廚房不鏽鋼無鉛伸縮龍頭', N'櫻花', N'LF119011MB', N'廚房不鏽鋼無鉛伸縮龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81976', N'官網', N'83098,83194', N'龍頭,廚房不鏽鋼無鉛伸縮龍頭', N'櫻花', N'LF119011MB', N'廚房不鏽鋼無鉛伸縮龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81977', N'展板', N'83098,83194', N'龍頭,廚房不鏽鋼無鉛伸縮龍頭', N'櫻花', N'LF1103019BK', N'廚房不鏽鋼無鉛感應伸縮龍頭(含手掃感應+溫度顯示)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81977', N'官網', N'83098,83194', N'龍頭,廚房不鏽鋼無鉛伸縮龍頭', N'櫻花', N'LF1103019BK', N'廚房不鏽鋼無鉛感應伸縮龍頭(含手掃感應+溫度顯示)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81978', N'展板', N'83098,83194', N'龍頭,廚房不鏽鋼無鉛伸縮龍頭', N'櫻花', N'LF119012LG', N'廚房不鏽鋼無鉛伸縮龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81978', N'官網', N'83098,83194', N'龍頭,廚房不鏽鋼無鉛伸縮龍頭', N'櫻花', N'LF119012LG', N'廚房不鏽鋼無鉛伸縮龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81979', N'展板', N'83098,83194', N'龍頭,廚房不鏽鋼無鉛伸縮龍頭', N'櫻花', N'LF119211BG', N'廚房不鏽鋼無鉛伸縮龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81979', N'官網', N'83098,83194', N'龍頭,廚房不鏽鋼無鉛伸縮龍頭', N'櫻花', N'LF119211BG', N'廚房不鏽鋼無鉛伸縮龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81980', N'展板', N'81002,83006', N'SVAGO,IH感應爐具 ', N'SVAGO', N'VEG2330', N'橫式雙口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81981', N'展板', N'81002,83349', N'SVAGO,瓦斯爐', N'SVAGO', N'VG2520G', N'二口瓦斯爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81982', N'展板', N'83097,83219', N'收納五金,抽屜地櫃收納', N'櫻花', N'GRASS Pro ONE靜音緩衝抽屜地櫃', N'GRASS Pro ONE靜音緩衝抽屜地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81982', N'官網', N'83097,83219', N'收納五金,抽屜地櫃收納', N'櫻花', N'GRASS Pro ONE靜音緩衝抽屜地櫃', N'GRASS Pro ONE靜音緩衝抽屜地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81986', N'展板', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'收納矮梯地櫃', N'收納矮梯地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81986', N'官網', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'收納矮梯地櫃', N'收納矮梯地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81992', N'展板', N'83097,83220', N'收納五金,籃類地櫃收納', N'櫻花', N'座式緩衝 ST 側拉籃地櫃(15cm)', N'座式緩衝 ST 側拉籃地櫃(15cm)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81992', N'官網', N'83097,83220', N'收納五金,籃類地櫃收納', N'櫻花', N'座式緩衝 ST 側拉籃地櫃(15cm)', N'座式緩衝 ST 側拉籃地櫃(15cm)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81993', N'展板', N'83097,83220', N'收納五金,籃類地櫃收納', N'櫻花', N'座式緩衝 ST 側拉籃地櫃(20/30cm)', N'座式緩衝 ST 側拉籃地櫃(20/30cm)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81993', N'官網', N'83097,83220', N'收納五金,籃類地櫃收納', N'櫻花', N'座式緩衝 ST 側拉籃地櫃(20/30cm)', N'座式緩衝 ST 側拉籃地櫃(20/30cm)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81994', N'展板', N'83097,83220', N'收納五金,籃類地櫃收納', N'櫻花', N'盤籃式側拉籃地櫃(進口五金)', N'盤籃式側拉籃地櫃(進口五金)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81994', N'官網', N'83097,83220', N'收納五金,籃類地櫃收納', N'櫻花', N'盤籃式側拉籃地櫃(進口五金)', N'盤籃式側拉籃地櫃(進口五金)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81995', N'展板', N'83097,83220', N'收納五金,籃類地櫃收納', N'櫻花', N'座式緩衝塗裝拉籃地櫃', N'座式緩衝塗裝拉籃地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81995', N'官網', N'83097,83220', N'收納五金,籃類地櫃收納', N'櫻花', N'座式緩衝塗裝拉籃地櫃', N'座式緩衝塗裝拉籃地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81996', N'展板', N'83097,83220', N'收納五金,籃類地櫃收納', N'櫻花', N'座式緩衝ST拉籃地櫃', N'座式緩衝ST拉籃地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81996', N'官網', N'83097,83220', N'收納五金,籃類地櫃收納', N'櫻花', N'座式緩衝ST拉籃地櫃', N'座式緩衝ST拉籃地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81997', N'展板', N'83097,83220', N'收納五金,籃類地櫃收納', N'櫻花', N'鋼珠緩衝圍籃地櫃', N'鋼珠緩衝圍籃地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81997', N'官網', N'83097,83220', N'收納五金,籃類地櫃收納', N'櫻花', N'鋼珠緩衝圍籃地櫃', N'鋼珠緩衝圍籃地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81998', N'展板', N'83097,83355', N'收納五金,其他地櫃收納', N'櫻花', N'多功能收納盤籃式拉籃地櫃(進口五金)', N'多功能收納盤籃式拉籃地櫃(進口五金)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'81998', N'官網', N'83097,83355', N'收納五金,其他地櫃收納', N'櫻花', N'多功能收納盤籃式拉籃地櫃(進口五金)', N'多功能收納盤籃式拉籃地櫃(進口五金)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82000', N'展板', N'83097,83355', N'收納五金,其他地櫃收納', N'櫻花', N'盤籃式分類緩衝垃圾桶地櫃(進口五金)', N'盤籃式分類緩衝垃圾桶地櫃(進口五金)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82000', N'官網', N'83097,83355', N'收納五金,其他地櫃收納', N'櫻花', N'盤籃式分類緩衝垃圾桶地櫃(進口五金)', N'盤籃式分類緩衝垃圾桶地櫃(進口五金)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82001', N'展板', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'電動升降瀝水吊櫃', N'電動升降瀝水吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82001', N'官網', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'電動升降瀝水吊櫃', N'電動升降瀝水吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82002', N'展板', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'上掀門吊櫃', N'上掀門吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82002', N'官網', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'上掀門吊櫃', N'上掀門吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82003', N'展板', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'多功能儲物盤籃高櫃(進口五金)', N'多功能儲物盤籃高櫃(進口五金)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82003', N'官網', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'多功能儲物盤籃高櫃(進口五金)', N'多功能儲物盤籃高櫃(進口五金)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82004', N'展板', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'嵌入式電器高櫃', N'嵌入式電器高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82004', N'官網', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'嵌入式電器高櫃', N'嵌入式電器高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82005', N'展板', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'平板抽電器高櫃', N'平板抽電器高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82005', N'官網', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'平板抽電器高櫃', N'平板抽電器高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82006', N'展板', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'座式緩衝平板抽電器高櫃', N'座式緩衝平板抽電器高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82006', N'官網', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'座式緩衝平板抽電器高櫃', N'座式緩衝平板抽電器高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82007', N'展板', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'多功能儲物高櫃', N'多功能儲物高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82007', N'官網', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'多功能儲物高櫃', N'多功能儲物高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82008', N'展板', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'多功能拉籃高櫃', N'多功能拉籃高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82008', N'官網', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'多功能拉籃高櫃', N'多功能拉籃高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82009', N'展板', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'盤籃式拉籃高櫃(進口五金)', N'盤籃式拉籃高櫃(進口五金)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82009', N'官網', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'盤籃式拉籃高櫃(進口五金)', N'盤籃式拉籃高櫃(進口五金)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82010', N'展板', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'圍籃高櫃', N'圍籃高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82010', N'官網', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'圍籃高櫃', N'圍籃高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82011', N'展板', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'多功能拉籃半高櫃', N'多功能拉籃半高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82011', N'官網', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'多功能拉籃半高櫃', N'多功能拉籃半高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82012', N'展板', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'多功能儲物半高櫃', N'多功能儲物半高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82012', N'官網', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'多功能儲物半高櫃', N'多功能儲物半高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82013', N'展板', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'圍籃半高櫃', N'圍籃半高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82013', N'官網', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'圍籃半高櫃', N'圍籃半高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82014', N'展板', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'鋁質捲門半高櫃', N'鋁質捲門半高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82014', N'官網', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'鋁質捲門半高櫃', N'鋁質捲門半高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82015', N'展板', N'83097,83354', N'收納五金,LED鋁條嵌燈專用櫃', N'櫻花', N'鋁框玻璃門按壓抽高櫃', N'鋁框玻璃門按壓抽高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82015', N'官網', N'83097,83354', N'收納五金,LED鋁條嵌燈專用櫃', N'櫻花', N'鋁框玻璃門按壓抽高櫃', N'鋁框玻璃門按壓抽高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82016', N'展板', N'83097,83354', N'收納五金,LED鋁條嵌燈專用櫃', N'櫻花', N'鋁框玻璃門疊櫃', N'鋁框玻璃門疊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82016', N'官網', N'83097,83354', N'收納五金,LED鋁條嵌燈專用櫃', N'櫻花', N'鋁框玻璃門疊櫃', N'鋁框玻璃門疊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82017', N'展板', N'83097,83354', N'收納五金,LED鋁條嵌燈專用櫃', N'櫻花', N'鋁框玻璃門吊櫃', N'鋁框玻璃門吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82017', N'官網', N'83097,83354', N'收納五金,LED鋁條嵌燈專用櫃', N'櫻花', N'鋁框玻璃門吊櫃', N'鋁框玻璃門吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82018', N'展板', N'83097,83354', N'收納五金,LED鋁條嵌燈專用櫃', N'櫻花', N'吊櫃_銑LED溝槽', N'吊櫃_銑LED溝槽', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82018', N'官網', N'83097,83354', N'收納五金,LED鋁條嵌燈專用櫃', N'櫻花', N'吊櫃_銑LED溝槽', N'吊櫃_銑LED溝槽', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82019', N'展板', N'83097,83354', N'收納五金,LED鋁條嵌燈專用櫃', N'櫻花', N'2小3高內抽高櫃', N'2小3高內抽高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82019', N'官網', N'83097,83354', N'收納五金,LED鋁條嵌燈專用櫃', N'櫻花', N'2小3高內抽高櫃', N'2小3高內抽高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82020', N'展板', N'83301,7,37,157', N'廚房電器,瓦斯爐,檯面爐,易清系列', N'櫻花', N'G2623BG', N'二口大面板易清檯面爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82022', N'展板', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'對開大型儲物半高櫃', N'對開大型儲物半高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82022', N'官網', N'83097,83258', N'收納五金,高櫃/半高櫃收納', N'櫻花', N'對開大型儲物半高櫃', N'對開大型儲物半高櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82023', N'展板', N'83097,83354', N'收納五金,LED鋁條嵌燈專用櫃', N'櫻花', N'LED鋁條嵌燈部品', N'LED鋁條嵌燈部品', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82023', N'官網', N'83097,83354', N'收納五金,LED鋁條嵌燈專用櫃', N'櫻花', N'LED鋁條嵌燈部品', N'LED鋁條嵌燈部品', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82024', N'展板', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'鋁方管活動推車', N'鋁方管活動推車', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82024', N'官網', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'鋁方管活動推車', N'鋁方管活動推車', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82025', N'展板', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'鋁方管層架吊櫃', N'鋁方管層架吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82025', N'官網', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'鋁方管層架吊櫃', N'鋁方管層架吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82026', N'展板', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'鋁方管中島吊掛架(雙層)', N'鋁方管中島吊掛架(雙層)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82026', N'官網', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'鋁方管中島吊掛架(雙層)', N'鋁方管中島吊掛架(雙層)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82027', N'展板', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'鋁方管中島吊掛架(單層)', N'鋁方管中島吊掛架(單層)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82027', N'官網', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'鋁方管中島吊掛架(單層)', N'鋁方管中島吊掛架(單層)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82028', N'展板', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'鋁方管旋轉桌', N'鋁方管旋轉桌', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82028', N'官網', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'鋁方管旋轉桌', N'鋁方管旋轉桌', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82029', N'展板', N'83097,83221', N'收納五金,黃金地段收納', N'櫻花', N'巧易鉤光源掛件組', N'巧易鉤光源掛件組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82029', N'官網', N'83097,83221', N'收納五金,黃金地段收納', N'櫻花', N'巧易鉤光源掛件組', N'巧易鉤光源掛件組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82030', N'展板', N'83097,83221', N'收納五金,黃金地段收納', N'櫻花', N'霧黑易利鉤黃金地段掛件組', N'霧黑易利鉤黃金地段掛件組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82030', N'官網', N'83097,83221', N'收納五金,黃金地段收納', N'櫻花', N'霧黑易利鉤黃金地段掛件組', N'霧黑易利鉤黃金地段掛件組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82031', N'展板', N'83097,83221', N'收納五金,黃金地段收納', N'櫻花', N'VOLPATO鋁層架組', N'VOLPATO鋁層架組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82031', N'官網', N'83097,83221', N'收納五金,黃金地段收納', N'櫻花', N'VOLPATO鋁層架組', N'VOLPATO鋁層架組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82032', N'展板', N'83097,83219', N'收納五金,抽屜地櫃收納', N'櫻花', N'開放木抽地櫃', N'開放木抽地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82032', N'官網', N'83097,83219', N'收納五金,抽屜地櫃收納', N'櫻花', N'開放木抽地櫃', N'開放木抽地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82033', N'展板', N'83097,83220', N'收納五金,籃類地櫃收納', N'櫻花', N'座式緩衝塗裝圍籃地櫃', N'座式緩衝塗裝圍籃地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82033', N'官網', N'83097,83220', N'收納五金,籃類地櫃收納', N'櫻花', N'座式緩衝塗裝圍籃地櫃', N'座式緩衝塗裝圍籃地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82034', N'展板', N'83097,83220', N'收納五金,籃類地櫃收納', N'櫻花', N'座式緩衝ST圍籃地櫃', N'座式緩衝ST圍籃地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82034', N'官網', N'83097,83220', N'收納五金,籃類地櫃收納', N'櫻花', N'座式緩衝ST圍籃地櫃', N'座式緩衝ST圍籃地櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82035', N'展板', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'斜掀門吊櫃', N'斜掀門吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82035', N'官網', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'斜掀門吊櫃', N'斜掀門吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82036', N'展板', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'上下摺門吊櫃', N'上下摺門吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82036', N'官網', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'上下摺門吊櫃', N'上下摺門吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82037', N'展板', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'電動升降收納吊櫃', N'電動升降收納吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82037', N'官網', N'83097,83217', N'收納五金,吊櫃收納', N'櫻花', N'電動升降收納吊櫃', N'電動升降收納吊櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82040', N'展板', N'83098,83353', N'龍頭,配件', N'櫻花', N'F0252', N'配件-給皂器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82040', N'官網', N'83098,83353', N'龍頭,配件', N'櫻花', N'F0252', N'配件-給皂器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82042', N'展板', N'83301,48', N'廚房電器,洗碗機', N'櫻花', N'E7881', N'獨立式熱風烘乾洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82057', N'展板', N'83312,83314,83328', N'TEKA,蒸烤設備,微波烤', N'TEKA', N'MWE 258 FI BK', N'嵌入式微波烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82058', N'展板', N'83312,83320,83336', N'TEKA,排油煙機,隱藏式油煙機', N'TEKA', N'CNL 9815 PLUS', N'抽拉式油煙機(90cm)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82059', N'展板', N'83312,83324', N'TEKA,其他', N'TEKA', N'SteamBox', N'多功能蒸烤配件組', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82060', N'展板', N'83312,83313,83333', N'TEKA,洗碗機,全嵌式洗碗機', N'TEKA', N'DFI 76950', N'全嵌式自動開門洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82061', N'展板', N'83312,83314,83327', N'TEKA,蒸烤設備,蒸烤箱', N'TEKA', N'HLB 8550 SC', N'60cm舒肥蒸烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82062', N'展板', N'83312,83314,83327', N'TEKA,蒸烤設備,蒸烤箱', N'TEKA', N'HLC 8470 SC', N'45cm食物探針舒肥蒸烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82063', N'展板', N'83312,83318', N'TEKA,咖啡機', N'TEKA', N'CLC 855 GM', N'全自動咖啡機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82068', N'展板', N'83301,6,34', N'廚房電器,除油煙機,配備', N'櫻花', N'RA-010', N'櫻花配件包-鋁', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82069', N'展板', N'83301,6,34', N'廚房電器,除油煙機,配備', N'櫻花', N'RA-008', N'櫻花平濾油網組-鋁', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82070', N'展板', N'83301,6,34', N'廚房電器,除油煙機,配備', N'櫻花', N'RA-002', N'櫻花濾油網組-PP', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82085', N'展板', N'81002,83349', N'SVAGO,瓦斯爐', N'SVAGO', N'VG2528G', N'二口智能定時瓦斯爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82086', N'展板', N'9,42', N'淨水設備,SQC系列', N'櫻花', N'P0775', N'生飲淨水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82087', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'F0265', N'除菌強效除鉛濾心', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82088', N'展板', N'9,41', N'淨水設備,RO系列', N'櫻花', N'P0261', N'RO淨水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82089', N'展板', N'9,41', N'淨水設備,RO系列', N'櫻花', N'P0262', N'RO淨水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82090', N'展板', N'9,41', N'淨水設備,RO系列', N'櫻花', N'P0265', N'雙效RO淨水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82091', N'展板', N'9,41', N'淨水設備,RO系列', N'櫻花', N'P0266', N'雙效RO淨水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82092', N'展板', N'9,45', N'淨水設備,濾心', N'櫻花', N'F0187', N'RO膜濾心(800G)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82096', N'展板', N'81002,83006', N'SVAGO,IH感應爐具 ', N'SVAGO', N'VEG2320', N'橫式雙口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82099', N'展板', N'83301,83307,49', N'廚房電器,烤箱與電器收納櫃,電器收納櫃', N'櫻花', N'E3621A', N'電器收納櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82101', N'展板', N'9,45,83244', N'淨水設備,濾心,濾心組合系列', N'櫻花', N'F2197', N'雙效RO淨水器專用濾心3支入(800G二年份)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82102', N'展板', N'9,45,83244', N'淨水設備,濾心,濾心組合系列', N'櫻花', N'F0197', N'RO淨水器專用濾心 7支入(800G二年份)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82103', N'展板', N'83301,7,35,54', N'廚房電器,瓦斯爐,台爐 ,標準系列', N'櫻花', N'G5201S', N'二口節能安全爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82103', N'官網', N'83301,7,35,54', N'廚房電器,瓦斯爐,台爐 ,標準系列', N'櫻花', N'G5201S', N'二口節能安全爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82104', N'展板', N'83301,7,74,76', N'廚房電器,瓦斯爐,嵌入爐,標準系列', N'櫻花', N'G6201S', N'二口節能安全爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82104', N'官網', N'83301,7,74,76', N'廚房電器,瓦斯爐,嵌入爐,標準系列', N'櫻花', N'G6201S', N'二口節能安全爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82105', N'展板', N'83301,7,37,164', N'廚房電器,瓦斯爐,檯面爐,雙炫火系列', N'櫻花', N'G2922S', N'雙炫火檯面爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82106', N'展板', N'83301,83307,49', N'廚房電器,烤箱與電器收納櫃,電器收納櫃', N'櫻花', N'E3625A', N'嵌入式電器收納櫃', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82110', N'展板', N'83301,7,37,157', N'廚房電器,瓦斯爐,檯面爐,易清系列', N'櫻花', N'G2527G', N'二口小面板智控易清檯面爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82111', N'展板', N'83301,7,37,157', N'廚房電器,瓦斯爐,檯面爐,易清系列', N'櫻花', N'G2627G', N'二口大面板智控易清檯面爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82112', N'展板', N'81002,83013', N'SVAGO,洗碗機', N'SVAGO', N'VD6111', N'半嵌式45cm自動開門洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82113', N'展板', N'81002,83006', N'SVAGO,IH感應爐具 ', N'SVAGO', N'VEG2510', N'橫式三口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82114', N'展板', N'83301,8,39', N'廚房電器,殺菌烘碗機,吊掛系列', N'櫻花', N'Q680', N'殺菌烘碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82118', N'展板', N'83301,162', N'廚房電器,IH感應爐', N'櫻花', N'EG2120AG', N'單口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82119', N'展板', N'83301,162', N'廚房電器,IH感應爐', N'櫻花', N'EG2331AG', N'雙口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82120', N'展板', N'83301,162', N'廚房電器,IH感應爐', N'櫻花', N'EG2200AG', N'雙口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82121', N'展板', N'83301,8,39', N'廚房電器,殺菌烘碗機,吊掛系列', N'櫻花', N'Q7585B', N'智能升降烘碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82122', N'展板', N'83301,8,39', N'廚房電器,殺菌烘碗機,吊掛系列', N'櫻花', N'Q7585W', N'智能升降烘碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82129', N'展板', N'83300,5,13,83094', N'熱水器,瓦斯熱水器,恆溫熱水器,智能恆溫系列', N'櫻花', N'DH1638H', N'16L POWER四季溫智能恆溫熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82131', N'展板', N'83301,6,83205', N'廚房電器,除油煙機,近吸系列', N'櫻花', N'DR7397', N'近吸除油煙機- 渦輪變頻 AI風控系列', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82132', N'展板', N'83301,162', N'廚房電器,IH感應爐', N'櫻花', N'EG2351G', N'雙口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82133', N'展板', N'83301,6,31', N'廚房電器,除油煙機,隱藏系列', N'櫻花', N'R609', N'隱藏除油煙機- 小宅系列', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82134', N'展板', N'83301,6,31', N'廚房電器,除油煙機,隱藏系列', N'櫻花', N'R610HS', N'隱藏除油煙機- 小宅系列', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82137', N'展板', N'83312,83313,83333', N'TEKA,洗碗機,全嵌式洗碗機', N'TEKA', N'DFI 26700', N'全嵌式自動開門洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82138', N'展板', N'83312,83313,83332', N'TEKA,洗碗機,半嵌式洗碗機', N'TEKA', N'DSI 26700', N'半嵌式自動開門洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82139', N'展板', N'81002,83006', N'SVAGO,IH感應爐具 ', N'SVAGO', N'VEG2382', N'AI連動橫式雙口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82140', N'展板', N'81002,83010', N'SVAGO,排油煙機', N'SVAGO', N'VR7152SXL', N'AI連動壁掛式排油煙機90', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82143', N'展板', N'83301,162', N'廚房電器,IH感應爐', N'櫻花', N'EG2501G', N'雙口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82162', N'展板', N'83300,5,13,83094', N'熱水器,瓦斯熱水器,恆溫熱水器,智能恆溫系列', N'櫻花', N'DH1670H', N'POWER四季溫智慧水量熱水器', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82163', N'展板', N'81002,83010', N'SVAGO,排油煙機', N'SVAGO', N'VR7015H', N'AI連動隱藏式排油煙機60', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82164', N'展板', N'81002,83013', N'SVAGO,洗碗機', N'SVAGO', N'VE7770A', N'全嵌式自動開門洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82165', N'展板', N'83098,83194', N'龍頭,廚房不鏽鋼無鉛伸縮龍頭', N'櫻花', N'LF119012NB', N'廚房不鏽鋼無鉛伸縮龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82165', N'官網', N'83098,83194', N'龍頭,廚房不鏽鋼無鉛伸縮龍頭', N'櫻花', N'LF119012NB', N'廚房不鏽鋼無鉛伸縮龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82169', N'展板', N'81002,83006', N'SVAGO,IH感應爐具 ', N'SVAGO', N'VEG2512', N'AI連動橫式雙口IH感應爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82170', N'展板', N'83312,83320,83335', N'TEKA,排油煙機,壁掛式油煙機', N'TEKA', N'DLH 982 T', N'壁掛式油煙機(90cm)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82171', N'展板', N'83312,83317,83367', N'TEKA,爐具,瓦斯爐', N'TEKA', N'GBC 76B2 2G XBN', N'雙口定時瓦斯爐', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82172', N'展板', N'81002,83242', N'SVAGO,洗脫烘洗衣機', N'SVAGO', N'VE9962', N'洗脫烘衣機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82173', N'展板', N'83098,83194', N'龍頭,廚房不鏽鋼無鉛伸縮龍頭', N'櫻花', N'LFV30201A', N'廚房不鏽鋼無鉛伸縮龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82173', N'官網', N'83098,83194', N'龍頭,廚房不鏽鋼無鉛伸縮龍頭', N'櫻花', N'LFV30201A', N'廚房不鏽鋼無鉛伸縮龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82174', N'展板', N'83378,83435,83384', N'檯面,陶板檯面,西班牙Coverlam卡沃石檯面', N'櫻花', N'C5406-CL601', N'西班牙Coverlam卡沃石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82175', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D1109', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82176', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D1179', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82177', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D1180', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82178', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D1181', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82179', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D1182', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82180', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D2510', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82181', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D2535', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82182', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D2537', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82183', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D2503', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82184', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D2513', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82185', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D2526', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82186', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D2529', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82187', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D2533', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82188', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D2536', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82189', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D2512', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82190', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D2516', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82191', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D2525', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82192', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D2527', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82193', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D2528', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82194', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D2530', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82195', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D2531', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82196', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D2532', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82197', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D2534', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82198', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D3503', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82199', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D3504', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82200', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D3506', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82201', N'展板', N'83377,83386', N'門板,MFC四邊封門板', N'櫻花', N'D3508', N'MFC四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82202', N'展板', N'83377,83387', N'門板,絲絨門板', N'櫻花', N'D4301', N'絲絨門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82203', N'展板', N'83377,83387', N'門板,絲絨門板', N'櫻花', N'D4302', N'絲絨門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82204', N'展板', N'83377,83387', N'門板,絲絨門板', N'櫻花', N'D4303', N'絲絨門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82205', N'展板', N'83377,83387', N'門板,絲絨門板', N'櫻花', N'D4304', N'絲絨門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82206', N'展板', N'83377,83387', N'門板,絲絨門板', N'櫻花', N'D4305', N'絲絨門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82207', N'展板', N'83377,83388', N'門板,框型四邊封門板', N'櫻花', N'D4607-D143', N'框型四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82208', N'展板', N'83377,83388', N'門板,框型四邊封門板', N'櫻花', N'D4607-DK5276', N'框型四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82209', N'展板', N'83377,83388', N'門板,框型四邊封門板', N'櫻花', N'D4607-D570', N'框型四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82210', N'展板', N'83377,83388', N'門板,框型四邊封門板', N'櫻花', N'D4607-D575', N'框型四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82211', N'展板', N'83377,83388', N'門板,框型四邊封門板', N'櫻花', N'D4607-D769', N'框型四邊封門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82212', N'展板', N'83377,83389', N'門板,晶耀門板', N'櫻花', N'D6189-DSK16', N'晶耀門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82213', N'展板', N'83377,83389', N'門板,晶耀門板', N'櫻花', N'D6189-DSK23', N'晶耀門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82214', N'展板', N'83377,83389', N'門板,晶耀門板', N'櫻花', N'D6189-DSK30', N'晶耀門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82215', N'展板', N'83377,83389', N'門板,晶耀門板', N'櫻花', N'D6189-DSK33', N'晶耀門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82216', N'展板', N'83377,83389', N'門板,晶耀門板', N'櫻花', N'D6189-DSK04', N'晶耀門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82217', N'展板', N'83377,83389', N'門板,晶耀門板', N'櫻花', N'D6189-DSK09', N'晶耀門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82218', N'展板', N'83377,83389', N'門板,晶耀門板', N'櫻花', N'D6189-DSK12', N'晶耀門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82219', N'展板', N'83377,83389', N'門板,晶耀門板', N'櫻花', N'D6189-DSK15', N'晶耀門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82220', N'展板', N'83377,83389', N'門板,晶耀門板', N'櫻花', N'D6189-DSK21', N'晶耀門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82221', N'展板', N'83377,83390', N'門板,極晶耀門板', N'櫻花', N'D6190-D13W', N'極晶耀門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82222', N'展板', N'83377,83390', N'門板,極晶耀門板', N'櫻花', N'D6190-D17W', N'極晶耀門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82223', N'展板', N'83377,83390', N'門板,極晶耀門板', N'櫻花', N'D6190-D86GRx', N'極晶耀門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82224', N'展板', N'83378,83435,83384', N'檯面,陶板檯面,西班牙Coverlam卡沃石檯面', N'櫻花', N'C5406-CL602', N'西班牙Coverlam卡沃石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82225', N'展板', N'83378,83435,83384', N'檯面,陶板檯面,西班牙Coverlam卡沃石檯面', N'櫻花', N'C5406-CL603', N'西班牙Coverlam卡沃石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82226', N'展板', N'83378,83435,83384', N'檯面,陶板檯面,西班牙Coverlam卡沃石檯面', N'櫻花', N'C5407-CL704', N'西班牙Coverlam卡沃石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82227', N'展板', N'83378,83435,83384', N'檯面,陶板檯面,西班牙Coverlam卡沃石檯面', N'櫻花', N'C5407-CL705', N'西班牙Coverlam卡沃石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82228', N'展板', N'83377,83391', N'門板,Style風格門板', N'櫻花', N'D6501-D0806MH', N'Style風格門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82229', N'展板', N'83377,83391', N'門板,Style風格門板', N'櫻花', N'D6501-D6317H', N'Style風格門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82230', N'展板', N'83377,83391', N'門板,Style風格門板', N'櫻花', N'D6501-D7377MH', N'Style風格門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82231', N'展板', N'83377,83391', N'門板,Style風格門板', N'櫻花', N'D6501-D7378MH', N'Style風格門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82232', N'展板', N'83377,83391', N'門板,Style風格門板', N'櫻花', N'D6501-D7383MH', N'Style風格門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82233', N'展板', N'83377,83391', N'門板,Style風格門板', N'櫻花', N'D6501-D8816K', N'Style風格門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82234', N'展板', N'83377,83391', N'門板,Style風格門板', N'櫻花', N'D6501-D8832H', N'Style風格門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82235', N'展板', N'83377,83392', N'門板,銀線晶耀門板', N'櫻花', N'D6195-DK01', N'銀線晶耀門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82236', N'展板', N'83377,83392', N'門板,銀線晶耀門板', N'櫻花', N'D6195-DK22', N'銀線晶耀門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82237', N'展板', N'83377,83393', N'門板,膜壓門板', N'櫻花', N'D6109-#038', N'膜壓門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82238', N'展板', N'83377,83393', N'門板,膜壓門板', N'櫻花', N'D6109-#9717', N'膜壓門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82239', N'展板', N'83377,83394', N'門板,霧感抗菌門板', N'櫻花', N'D6310-M2572', N'霧感抗菌門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82240', N'展板', N'83377,83394', N'門板,霧感抗菌門板', N'櫻花', N'D6310-M2573', N'霧感抗菌門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82241', N'展板', N'83377,83394', N'門板,霧感抗菌門板', N'櫻花', N'D6310-M2575', N'霧感抗菌門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82242', N'展板', N'83377,83394', N'門板,霧感抗菌門板', N'櫻花', N'D6310-M2576', N'霧感抗菌門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82243', N'展板', N'83377,83394', N'門板,霧感抗菌門板', N'櫻花', N'D6310-M2580', N'霧感抗菌門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82244', N'展板', N'83377,83394', N'門板,霧感抗菌門板', N'櫻花', N'D6310-M2581', N'霧感抗菌門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82245', N'展板', N'83377,83394', N'門板,霧感抗菌門板', N'櫻花', N'D6310-M2582', N'霧感抗菌門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82246', N'展板', N'83377,83394', N'門板,霧感抗菌門板', N'櫻花', N'D6310-M2583', N'霧感抗菌門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82247', N'展板', N'83377,83394', N'門板,霧感抗菌門板', N'櫻花', N'D6310-M2585', N'霧感抗菌門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82248', N'展板', N'83377,83394', N'門板,霧感抗菌門板', N'櫻花', N'D6310-M2587', N'霧感抗菌門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82249', N'展板', N'83377,83396', N'門板,陶瓷塗裝門板-素色', N'櫻花', N'D7201-D8410', N'陶瓷塗裝門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82250', N'展板', N'83377,83396', N'門板,陶瓷塗裝門板-素色', N'櫻花', N'D7201-D8411', N'陶瓷塗裝門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82251', N'展板', N'83377,83396', N'門板,陶瓷塗裝門板-素色', N'櫻花', N'D7201-D8412', N'陶瓷塗裝門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82252', N'展板', N'83377,83396', N'門板,陶瓷塗裝門板-素色', N'櫻花', N'D7201-D8413', N'陶瓷塗裝門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82253', N'展板', N'83378,83435,83384', N'檯面,陶板檯面,西班牙Coverlam卡沃石檯面', N'櫻花', N'C5407-CL706', N'西班牙Coverlam卡沃石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82254', N'展板', N'83377,83396', N'門板,陶瓷塗裝門板-素色', N'櫻花', N'D7201-D8414', N'陶瓷塗裝門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82255', N'展板', N'83377,83396', N'門板,陶瓷塗裝門板-素色', N'櫻花', N'D7201-D8415', N'陶瓷塗裝門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82256', N'展板', N'83377,83396', N'門板,陶瓷塗裝門板-素色', N'櫻花', N'D7201-D8416', N'陶瓷塗裝門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82257', N'展板', N'83377,83396', N'門板,陶瓷塗裝門板-素色', N'櫻花', N'D7201-D8417', N'陶瓷塗裝門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82258', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5053-CS102', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82259', N'展板', N'83377,83396', N'門板,陶瓷塗裝門板-素色', N'櫻花', N'D7201-D8418', N'陶瓷塗裝門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82260', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5053-CS201', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82261', N'展板', N'83377,83396', N'門板,陶瓷塗裝門板-素色', N'櫻花', N'D7203-D8410', N'陶瓷塗裝門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82262', N'展板', N'83377,83396', N'門板,陶瓷塗裝門板-素色', N'櫻花', N'D7203-D8411', N'陶瓷塗裝門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82263', N'展板', N'83377,83396', N'門板,陶瓷塗裝門板-素色', N'櫻花', N'D7203-D8412', N'陶瓷塗裝門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82264', N'展板', N'83377,83396', N'門板,陶瓷塗裝門板-素色', N'櫻花', N'D7203-D8413', N'陶瓷塗裝門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82265', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5054-CS601', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82266', N'展板', N'83377,83396', N'門板,陶瓷塗裝門板-素色', N'櫻花', N'D7203-D8414', N'陶瓷塗裝門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82267', N'展板', N'83377,83396', N'門板,陶瓷塗裝門板-素色', N'櫻花', N'D7203-D8415', N'陶瓷塗裝門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82268', N'展板', N'83377,83396', N'門板,陶瓷塗裝門板-素色', N'櫻花', N'D7203-D8416', N'陶瓷塗裝門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82269', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5054-CS602', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82270', N'展板', N'83377,83396', N'門板,陶瓷塗裝門板-素色', N'櫻花', N'D7203-D8417', N'陶瓷塗裝門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82271', N'展板', N'83377,83396', N'門板,陶瓷塗裝門板-素色', N'櫻花', N'D7203-D8418', N'陶瓷塗裝門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82272', N'展板', N'83377,83397', N'門板,陶瓷塗裝門板-類金屬色', N'櫻花', N'D7202-D8419', N'陶瓷塗裝門板-類金屬色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82273', N'展板', N'83377,83397', N'門板,陶瓷塗裝門板-類金屬色', N'櫻花', N'D7204-D8419', N'陶瓷塗裝門板-類金屬色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82274', N'展板', N'83377,83398', N'門板,膜壓門板(臻美)', N'櫻花', N'D6111-D4706', N'膜壓門板(臻美)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82275', N'展板', N'83377,83398', N'門板,膜壓門板(臻美)', N'櫻花', N'D6111-D9717', N'膜壓門板(臻美)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82276', N'展板', N'83377,83398', N'門板,膜壓門板(臻美)', N'櫻花', N'D6111-D41703', N'膜壓門板(臻美)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82277', N'展板', N'83377,83398', N'門板,膜壓門板(臻美)', N'櫻花', N'D6111-D5712R', N'膜壓門板(臻美)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82278', N'展板', N'83377,83398', N'門板,膜壓門板(臻美)', N'櫻花', N'D6111-D7781R', N'膜壓門板(臻美)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82279', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5054-CS604', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82280', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5054-CS606', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82281', N'展板', N'83377,83399', N'門板,粗鋁框玻璃門板', N'櫻花', N'D7009-D7009A', N'粗鋁框玻璃門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82282', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5054-CS611', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82283', N'展板', N'83377,83399', N'門板,粗鋁框玻璃門板', N'櫻花', N'D7009-D7009B', N'粗鋁框玻璃門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82284', N'展板', N'83377,83400', N'門板,陶瓷塗裝J型門板-素色', N'櫻花', N'D7205-D8410', N'陶瓷塗裝J型門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82285', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5054-CS612', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82286', N'展板', N'83377,83400', N'門板,陶瓷塗裝J型門板-素色', N'櫻花', N'D7205-D8411', N'陶瓷塗裝J型門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82287', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5054-CS614', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82288', N'展板', N'83377,83400', N'門板,陶瓷塗裝J型門板-素色', N'櫻花', N'D7205-D8412', N'陶瓷塗裝J型門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82289', N'展板', N'83377,83400', N'門板,陶瓷塗裝J型門板-素色', N'櫻花', N'D7205-D8413', N'陶瓷塗裝J型門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82290', N'展板', N'83377,83400', N'門板,陶瓷塗裝J型門板-素色', N'櫻花', N'D7205-D8414', N'陶瓷塗裝J型門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82291', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5054-CS621', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82293', N'展板', N'83377,83400', N'門板,陶瓷塗裝J型門板-素色', N'櫻花', N'D7205-D8415', N'陶瓷塗裝J型門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82294', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5055-CS501-Alpina White', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82295', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5055-CS503-Blanco Zeus (皮紋面)', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82296', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5055-CS504-Lyra', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82297', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5055-CS507-Bianco River (火燒面)', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82298', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5055-CS509-Kensho (火燒面)', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82299', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5058-CS8601-Blanco Zeus-20mm', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82300', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5058-CS8602-Yukon-20mm', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82301', N'展板', N'83377,83400', N'門板,陶瓷塗裝J型門板-素色', N'櫻花', N'D7205-D8416', N'陶瓷塗裝J型門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82302', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5058-CS8603-Blanco Stellar-20mm', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82303', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5058-CS8606-Negro Stellar-20mm', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82304', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5058-CS8611-Bianco River-20mm', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82305', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5058-CS8612-Blanco Maple-20mm', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82306', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5059-CS8501-Alpina White-20mm', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82307', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5059-CS8503-Blanco Zeus-Extra (皮紋面)-20mm', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82308', N'展板', N'83377,83400', N'門板,陶瓷塗裝J型門板-素色', N'櫻花', N'D7205-D8417', N'陶瓷塗裝J型門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82309', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C506P-CS8102-Gris Expo-20mm', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82310', N'展板', N'83377,83400', N'門板,陶瓷塗裝J型門板-素色', N'櫻花', N'D7205-D8418', N'陶瓷塗裝J型門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82311', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C506P-CS8201-Blanco Norte-20mm', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82312', N'展板', N'83378,83436,83420', N'檯面,石英石檯面,HANSTONE石英石檯面', N'櫻花', N'C50H1-CL101', N'HANSTONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82313', N'展板', N'83378,83436,83420', N'檯面,石英石檯面,HANSTONE石英石檯面', N'櫻花', N'C50H1-CL105', N'HANSTONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82314', N'展板', N'83378,83436,83420', N'檯面,石英石檯面,HANSTONE石英石檯面', N'櫻花', N'C50H2-BA201', N'HANSTONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82315', N'展板', N'83378,83436,83420', N'檯面,石英石檯面,HANSTONE石英石檯面', N'櫻花', N'C50H2-RS314', N'HANSTONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82316', N'展板', N'83378,83436,83420', N'檯面,石英石檯面,HANSTONE石英石檯面', N'櫻花', N'C50H3-CT402', N'HANSTONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82317', N'展板', N'83378,83436,83420', N'檯面,石英石檯面,HANSTONE石英石檯面', N'櫻花', N'C50H3-BT354', N'HANSTONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82318', N'展板', N'83378,83436,83420', N'檯面,石英石檯面,HANSTONE石英石檯面', N'櫻花', N'C50H3-BA205', N'HANSTONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82319', N'展板', N'83377,83401', N'門板,陶瓷塗裝J型門板-類金屬色', N'櫻花', N'D7206-D8419', N'陶瓷塗裝J型門板-類金屬色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82320', N'展板', N'83378,83436,83420', N'檯面,石英石檯面,HANSTONE石英石檯面', N'櫻花', N'C50H4-RU601', N'HANSTONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82321', N'展板', N'83378,83436,83421', N'檯面,石英石檯面,SAKURA STONE石英石檯面', N'櫻花', N'C5101-SV105', N'SAKURA STONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82322', N'展板', N'83378,83436,83421', N'檯面,石英石檯面,SAKURA STONE石英石檯面', N'櫻花', N'C5102-SV206', N'SAKURA STONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82323', N'展板', N'83378,83436,83421', N'檯面,石英石檯面,SAKURA STONE石英石檯面', N'櫻花', N'C5102-SV207', N'SAKURA STONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82324', N'展板', N'83378,83436,83421', N'檯面,石英石檯面,SAKURA STONE石英石檯面', N'櫻花', N'C5104-SV408', N'SAKURA STONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82325', N'展板', N'83378,83436,83421', N'檯面,石英石檯面,SAKURA STONE石英石檯面', N'櫻花', N'C511P-SV016', N'SAKURA STONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82326', N'展板', N'83378,83436,83421', N'檯面,石英石檯面,SAKURA STONE石英石檯面', N'櫻花', N'C5105-SV509', N'SAKURA STONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82327', N'展板', N'83377,83402', N'門板,陶瓷塗裝細邊框型門板-素色', N'櫻花', N'D7207-D8410', N'陶瓷塗裝細邊框型門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82328', N'展板', N'83378,83436,83421', N'檯面,石英石檯面,SAKURA STONE石英石檯面', N'櫻花', N'C5105-SV017', N'SAKURA STONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82329', N'展板', N'83378,83436,83421', N'檯面,石英石檯面,SAKURA STONE石英石檯面', N'櫻花', N'C510P-SV001', N'SAKURA STONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82330', N'展板', N'83378,83436,83421', N'檯面,石英石檯面,SAKURA STONE石英石檯面', N'櫻花', N'C510P-SV002', N'SAKURA STONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82331', N'展板', N'83378,83436,83421', N'檯面,石英石檯面,SAKURA STONE石英石檯面', N'櫻花', N'C510P-SV003', N'SAKURA STONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82332', N'展板', N'83377,83402', N'門板,陶瓷塗裝細邊框型門板-素色', N'櫻花', N'D7207-D8411', N'陶瓷塗裝細邊框型門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82333', N'展板', N'83378,83436,83421', N'檯面,石英石檯面,SAKURA STONE石英石檯面', N'櫻花', N'C510P-SV004', N'SAKURA STONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82334', N'展板', N'83377,83402', N'門板,陶瓷塗裝細邊框型門板-素色', N'櫻花', N'D7207-D8412', N'陶瓷塗裝細邊框型門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82335', N'展板', N'83378,83436,83421', N'檯面,石英石檯面,SAKURA STONE石英石檯面', N'櫻花', N'C5112-SV9210', N'SAKURA STONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82336', N'展板', N'83378,83436,83421', N'檯面,石英石檯面,SAKURA STONE石英石檯面', N'櫻花', N'C5112-SV9211', N'SAKURA STONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82337', N'展板', N'83378,83436,83421', N'檯面,石英石檯面,SAKURA STONE石英石檯面', N'櫻花', N'C5112-SV9212', N'SAKURA STONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82338', N'展板', N'83377,83402', N'門板,陶瓷塗裝細邊框型門板-素色', N'櫻花', N'D7207-D8413', N'陶瓷塗裝細邊框型門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82339', N'展板', N'83378,83436,83421', N'檯面,石英石檯面,SAKURA STONE石英石檯面', N'櫻花', N'C5112-SV9213', N'SAKURA STONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82340', N'展板', N'83377,83402', N'門板,陶瓷塗裝細邊框型門板-素色', N'櫻花', N'D7207-D8414', N'陶瓷塗裝細邊框型門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82341', N'展板', N'83378,83436,83421', N'檯面,石英石檯面,SAKURA STONE石英石檯面', N'櫻花', N'C5113-SV9019', N'SAKURA STONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82342', N'展板', N'83377,83402', N'門板,陶瓷塗裝細邊框型門板-素色', N'櫻花', N'D7207-D8415', N'陶瓷塗裝細邊框型門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82343', N'展板', N'83377,83402', N'門板,陶瓷塗裝細邊框型門板-素色', N'櫻花', N'D7207-D8416', N'陶瓷塗裝細邊框型門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82344', N'展板', N'83378,83436,83421', N'檯面,石英石檯面,SAKURA STONE石英石檯面', N'櫻花', N'C5113-SV9020', N'SAKURA STONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82345', N'展板', N'83377,83402', N'門板,陶瓷塗裝細邊框型門板-素色', N'櫻花', N'D7207-D8417', N'陶瓷塗裝細邊框型門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82346', N'展板', N'83377,83402', N'門板,陶瓷塗裝細邊框型門板-素色', N'櫻花', N'D7207-D8418', N'陶瓷塗裝細邊框型門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82347', N'展板', N'83378,83436,83421', N'檯面,石英石檯面,SAKURA STONE石英石檯面', N'櫻花', N'C5113-SV9021', N'SAKURA STONE石英石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82348', N'展板', N'83377,83404', N'門板,FENIX門板', N'櫻花', N'D9201-D0032', N'FENIX門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82349', N'展板', N'83377,83404', N'門板,FENIX門板', N'櫻花', N'D9201-D0718', N'FENIX門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82350', N'展板', N'83378,83437,83422', N'檯面,人造石檯面,ＨANEX人造石檯面', N'櫻花', N'C5082-S-004', N'ＨANEX人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82351', N'展板', N'83377,83404', N'門板,FENIX門板', N'櫻花', N'D9201-D0720', N'FENIX門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82352', N'展板', N'83378,83437,83422', N'檯面,人造石檯面,ＨANEX人造石檯面', N'櫻花', N'C5082-S-008-N', N'ＨANEX人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82353', N'展板', N'83377,83404', N'門板,FENIX門板', N'櫻花', N'D9201-D0750', N'FENIX門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82354', N'展板', N'83377,83404', N'門板,FENIX門板', N'櫻花', N'D9201-D0751', N'FENIX門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82355', N'展板', N'83378,83437,83422', N'檯面,人造石檯面,ＨANEX人造石檯面', N'櫻花', N'C5083-D-024', N'ＨANEX人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82356', N'展板', N'83377,83404', N'門板,FENIX門板', N'櫻花', N'D9201-D0754', N'FENIX門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82357', N'展板', N'83377,83405', N'門板,黑色細鋁框玻璃門板-AIR(含垂直L型把手)', N'櫻花', N'D7006', N'黑色細鋁框玻璃門板-AIR(含垂直L型把手)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82358', N'展板', N'83378,83437,83422', N'檯面,人造石檯面,ＨANEX人造石檯面', N'櫻花', N'C5083-T-089', N'ＨANEX人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82359', N'展板', N'83378,83437,83422', N'檯面,人造石檯面,ＨANEX人造石檯面', N'櫻花', N'C5083-T-021', N'ＨANEX人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82360', N'展板', N'83378,83437,83422', N'檯面,人造石檯面,ＨANEX人造石檯面', N'櫻花', N'C5083-D-001', N'ＨANEX人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82361', N'展板', N'83378,83437,83422', N'檯面,人造石檯面,ＨANEX人造石檯面', N'櫻花', N'C5083-D-025', N'ＨANEX人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82362', N'展板', N'83378,83437,83422', N'檯面,人造石檯面,ＨANEX人造石檯面', N'櫻花', N'C5083-C-001', N'ＨANEX人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82363', N'展板', N'83378,83437,83422', N'檯面,人造石檯面,ＨANEX人造石檯面', N'櫻花', N'C5083-D-007', N'ＨANEX人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82364', N'展板', N'83378,83437,83422', N'檯面,人造石檯面,ＨANEX人造石檯面', N'櫻花', N'C5083-T-012-H', N'ＨANEX人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82365', N'展板', N'83378,83437,83422', N'檯面,人造石檯面,ＨANEX人造石檯面', N'櫻花', N'C5083(花色)-T-003-H-Ivory', N'ＨANEX人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82366', N'展板', N'83378,83437,83422', N'檯面,人造石檯面,ＨANEX人造石檯面', N'櫻花', N'C5083(花色)-T-025-Chestnut', N'ＨANEX人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82367', N'展板', N'83378,83437,83422', N'檯面,人造石檯面,ＨANEX人造石檯面', N'櫻花', N'C5083(花色)-D-028-Black Beat', N'ＨANEX人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82368', N'展板', N'83378,83437,83422', N'檯面,人造石檯面,ＨANEX人造石檯面', N'櫻花', N'C5083(花色)-D-003-Goldbrown', N'ＨANEX人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82369', N'展板', N'83378,83437,83422', N'檯面,人造石檯面,ＨANEX人造石檯面', N'櫻花', N'C5083(花色)-C-004-Cubic Transblanc', N'ＨANEX人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82370', N'展板', N'83378,83437,83422', N'檯面,人造石檯面,ＨANEX人造石檯面', N'櫻花', N'C5083(花色)-P-004-Solaris', N'ＨANEX人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82371', N'展板', N'83378,83437,83422', N'檯面,人造石檯面,ＨANEX人造石檯面', N'櫻花', N'C5083(花色)-D-012-Lightbrown', N'ＨANEX人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82372', N'展板', N'83378,83437,83422', N'檯面,人造石檯面,ＨANEX人造石檯面', N'櫻花', N'C5083(花色)', N'ＨANEX人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82373', N'展板', N'83378,83437,83422', N'檯面,人造石檯面,ＨANEX人造石檯面', N'櫻花', N'C5083(花色)-M-003-Red', N'ＨANEX人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82374', N'展板', N'83378,83437,83422', N'檯面,人造石檯面,ＨANEX人造石檯面', N'櫻花', N'C5083(花色)-M-007-Black', N'ＨANEX人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82375', N'展板', N'83377,83406', N'門板,黑色細鋁框玻璃門板', N'櫻花', N'D7010-D7010A', N'黑色細鋁框玻璃門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82376', N'展板', N'83377,83406', N'門板,黑色細鋁框玻璃門板', N'櫻花', N'D7010-D7010C', N'黑色細鋁框玻璃門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82377', N'展板', N'83377,83407', N'門板,鏡面塗裝門板', N'櫻花', N'D9188-D9101', N'鏡面塗裝門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82378', N'展板', N'83377,83407', N'門板,鏡面塗裝門板', N'櫻花', N'D9188-D9102', N'鏡面塗裝門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82379', N'展板', N'83377,83407', N'門板,鏡面塗裝門板', N'櫻花', N'D9188-D9103', N'鏡面塗裝門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82380', N'展板', N'83377,83407', N'門板,鏡面塗裝門板', N'櫻花', N'D9188-D9104', N'鏡面塗裝門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82381', N'展板', N'83377,83407', N'門板,鏡面塗裝門板', N'櫻花', N'D9188-D9105', N'鏡面塗裝門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82382', N'展板', N'83377,83407', N'門板,鏡面塗裝門板', N'櫻花', N'D9188-D9106', N'鏡面塗裝門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82383', N'展板', N'83377,83407', N'門板,鏡面塗裝門板', N'櫻花', N'D9188-D9107', N'鏡面塗裝門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82384', N'展板', N'83377,83407', N'門板,鏡面塗裝門板', N'櫻花', N'D9188-D9108', N'鏡面塗裝門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82385', N'展板', N'83377,83407', N'門板,鏡面塗裝門板', N'櫻花', N'D9188-D9109', N'鏡面塗裝門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82386', N'展板', N'83377,83408', N'門板,霧面塗裝門板(無造型)', N'櫻花', N'D8589-D8511', N'霧面塗裝門板(無造型)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82387', N'展板', N'83377,83408', N'門板,霧面塗裝門板(無造型)', N'櫻花', N'D8589-D8512', N'霧面塗裝門板(無造型)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82388', N'展板', N'83377,83408', N'門板,霧面塗裝門板(無造型)', N'櫻花', N'D8589-D8513', N'霧面塗裝門板(無造型)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82389', N'展板', N'83377,83408', N'門板,霧面塗裝門板(無造型)', N'櫻花', N'D8589-D8514', N'霧面塗裝門板(無造型)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82390', N'展板', N'83377,83408', N'門板,霧面塗裝門板(無造型)', N'櫻花', N'D8589-D8515', N'霧面塗裝門板(無造型)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82391', N'展板', N'83377,83408', N'門板,霧面塗裝門板(無造型)', N'櫻花', N'D8589-D8516', N'霧面塗裝門板(無造型)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82392', N'展板', N'83377,83408', N'門板,霧面塗裝門板(無造型)', N'櫻花', N'D8589-D8517', N'霧面塗裝門板(無造型)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82393', N'展板', N'83377,83408', N'門板,霧面塗裝門板(無造型)', N'櫻花', N'D8589-D8518', N'霧面塗裝門板(無造型)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82394', N'展板', N'83377,83408', N'門板,霧面塗裝門板(無造型)', N'櫻花', N'D8589-D8519', N'霧面塗裝門板(無造型)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82395', N'展板', N'83377,83409', N'門板,陶瓷塗裝格柵門板-素色', N'櫻花', N'D7209-D8410', N'陶瓷塗裝格柵門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82396', N'展板', N'83377,83409', N'門板,陶瓷塗裝格柵門板-素色', N'櫻花', N'D7209-D8411', N'陶瓷塗裝格柵門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82397', N'展板', N'83377,83409', N'門板,陶瓷塗裝格柵門板-素色', N'櫻花', N'D7209-D8412', N'陶瓷塗裝格柵門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82398', N'展板', N'83377,83409', N'門板,陶瓷塗裝格柵門板-素色', N'櫻花', N'D7209-D8413', N'陶瓷塗裝格柵門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82399', N'展板', N'83377,83409', N'門板,陶瓷塗裝格柵門板-素色', N'櫻花', N'D7209-D8414', N'陶瓷塗裝格柵門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82400', N'展板', N'83377,83409', N'門板,陶瓷塗裝格柵門板-素色', N'櫻花', N'D7209-D8415', N'陶瓷塗裝格柵門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82401', N'展板', N'83377,83409', N'門板,陶瓷塗裝格柵門板-素色', N'櫻花', N'D7209-D8416', N'陶瓷塗裝格柵門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82402', N'展板', N'83377,83409', N'門板,陶瓷塗裝格柵門板-素色', N'櫻花', N'D7209-D8417', N'陶瓷塗裝格柵門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82403', N'展板', N'83377,83409', N'門板,陶瓷塗裝格柵門板-素色', N'櫻花', N'D7209-D8418', N'陶瓷塗裝格柵門板-素色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82404', N'展板', N'83377,83410', N'門板,陶瓷塗裝格柵門板-類金屬色', N'櫻花', N'D7210-D8419', N'陶瓷塗裝格柵門板-類金屬色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82405', N'展板', N'83377,83411', N'門板,金色細鋁框玻璃門板-AIR (含垂直L型把手)', N'櫻花', N'D7011', N'金色細鋁框玻璃門板-AIR(含垂直L型把手)', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82406', N'展板', N'83377,83412', N'門板,染色實木門板', N'櫻花', N'D4008-EA01', N'染色實木門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82407', N'展板', N'83377,83412', N'門板,染色實木門板', N'櫻花', N'D4008-EA02', N'染色實木門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82408', N'展板', N'83377,83412', N'門板,染色實木門板', N'櫻花', N'D4008-EA06', N'染色實木門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82409', N'展板', N'83377,83412', N'門板,染色實木門板', N'櫻花', N'D4008-EA07', N'染色實木門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82410', N'展板', N'83377,83412', N'門板,染色實木門板', N'櫻花', N'D4008-EA08', N'染色實木門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82411', N'展板', N'83377,83412', N'門板,染色實木門板', N'櫻花', N'D4008-EA09', N'染色實木門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82412', N'展板', N'83377,83412', N'門板,染色實木門板', N'櫻花', N'D4008-EA10', N'染色實木門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82413', N'展板', N'83377,83412', N'門板,染色實木門板', N'櫻花', N'D4008-EA11', N'染色實木門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82414', N'展板', N'83377,83412', N'門板,染色實木門板', N'櫻花', N'D4008-EA12', N'染色實木門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82415', N'展板', N'83377,83413', N'門板,染色實木格柵門板', N'櫻花', N'D4009-EA01', N'染色實木格柵門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82416', N'展板', N'83377,83413', N'門板,染色實木格柵門板', N'櫻花', N'D4009-EA02', N'染色實木格柵門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82417', N'展板', N'83377,83413', N'門板,染色實木格柵門板', N'櫻花', N'D4009-EA06', N'染色實木格柵門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82418', N'展板', N'83377,83413', N'門板,染色實木格柵門板', N'櫻花', N'D4009-EA07', N'染色實木格柵門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82419', N'展板', N'83377,83413', N'門板,染色實木格柵門板', N'櫻花', N'D4009-EA08', N'染色實木格柵門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82420', N'展板', N'83377,83413', N'門板,染色實木格柵門板', N'櫻花', N'D4009-EA09', N'染色實木格柵門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82421', N'展板', N'83377,83413', N'門板,染色實木格柵門板', N'櫻花', N'D4009-EA10', N'染色實木格柵門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82422', N'展板', N'83377,83413', N'門板,染色實木格柵門板', N'櫻花', N'D4009-EA11', N'染色實木格柵門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82423', N'展板', N'83377,83413', N'門板,染色實木格柵門板', N'櫻花', N'D4009-EA12', N'染色實木格柵門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82424', N'展板', N'83378,83437,83423', N'檯面,人造石檯面,HANEX-STRATUM火山石檯面', N'櫻花', N'C5301-ST-101', N'HANEX-STRATUM火山石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82425', N'展板', N'83377,83414', N'門板,原色實木門板', N'櫻花', N'D4010', N'原色實木門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82426', N'展板', N'83377,83414', N'門板,原色實木門板', N'櫻花', N'D4011', N'原色實木門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82427', N'展板', N'83378,83437,83423', N'檯面,人造石檯面,HANEX-STRATUM火山石檯面', N'櫻花', N'C5301-ST-102', N'HANEX-STRATUM火山石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82428', N'展板', N'83377,83415', N'門板,格柵門板', N'櫻花', N'D9301,D9302-D0806MH', N'格柵門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82429', N'展板', N'83377,83415', N'門板,格柵門板', N'櫻花', N'D9301,D9302-D6317H', N'格柵門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82430', N'展板', N'83377,83415', N'門板,格柵門板', N'櫻花', N'D9301,D9302-D7377MH', N'格柵門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82431', N'展板', N'83377,83415', N'門板,格柵門板', N'櫻花', N'D9301,D9302-D7378MH', N'格柵門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82432', N'展板', N'83377,83415', N'門板,格柵門板', N'櫻花', N'D9301,D9302-D7383MH', N'格柵門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82433', N'展板', N'83377,83415', N'門板,格柵門板', N'櫻花', N'D9301,D9302-D8816K', N'格柵門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82434', N'展板', N'83377,83415', N'門板,格柵門板', N'櫻花', N'D9301,D9302-D8832H', N'格柵門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82435', N'展板', N'83378,83437,83423', N'檯面,人造石檯面,HANEX-STRATUM火山石檯面', N'櫻花', N'C5301-ST-103', N'HANEX-STRATUM火山石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82436', N'展板', N'83378,83437,83423', N'檯面,人造石檯面,HANEX-STRATUM火山石檯面', N'櫻花', N'C5301-ST-104', N'HANEX-STRATUM火山石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82437', N'展板', N'83378,83437,83423', N'檯面,人造石檯面,HANEX-STRATUM火山石檯面', N'櫻花', N'C5301-ST-105', N'HANEX-STRATUM火山石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82438', N'展板', N'83377,83416', N'門板,烤漆實木格子窗清玻璃門板', N'櫻花', N'D4012-D4706', N'烤漆實木格子窗清玻璃門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82439', N'展板', N'83378,83437,83423', N'檯面,人造石檯面,HANEX-STRATUM火山石檯面', N'櫻花', N'C5301-ST-106', N'HANEX-STRATUM火山石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82440', N'展板', N'83377,83416', N'門板,烤漆實木格子窗清玻璃門板', N'櫻花', N'D4013-D9717', N'烤漆實木格子窗清玻璃門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82441', N'展板', N'83378,83437,83423', N'檯面,人造石檯面,HANEX-STRATUM火山石檯面', N'櫻花', N'C5301-ST-201', N'HANEX-STRATUM火山石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82442', N'展板', N'83378,83437,83423', N'檯面,人造石檯面,HANEX-STRATUM火山石檯面', N'櫻花', N'C5301-ST-202', N'HANEX-STRATUM火山石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82443', N'展板', N'83378,83437,83424', N'檯面,人造石檯面,HANEX-BRIONNE遠紅外線人造石檯面', N'櫻花', N'50PP-B-012', N'HANEX-BRIONNE遠紅外線人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82444', N'展板', N'83378,83437,83424', N'檯面,人造石檯面,HANEX-BRIONNE遠紅外線人造石檯面', N'櫻花', N'50PP-B-031', N'HANEX-BRIONNE遠紅外線人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82445', N'展板', N'83378,83437,83425', N'檯面,人造石檯面,CORIAN人造石檯面', N'櫻花', N'50SP-CW103', N'CORIAN人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82446', N'展板', N'83378,83437,83425', N'檯面,人造石檯面,CORIAN人造石檯面', N'櫻花', N'50SP-DV233', N'CORIAN人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82447', N'展板', N'83378,83437,83425', N'檯面,人造石檯面,CORIAN人造石檯面', N'櫻花', N'50SP-EV502', N'CORIAN人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82448', N'展板', N'83378,83437,83425', N'檯面,人造石檯面,CORIAN人造石檯面', N'櫻花', N'50SP-IS528', N'CORIAN人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82449', N'展板', N'83378,83437,83425', N'檯面,人造石檯面,CORIAN人造石檯面', N'櫻花', N'50SP-LN228', N'CORIAN人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82450', N'展板', N'83378,83437,83425', N'檯面,人造石檯面,CORIAN人造石檯面', N'櫻花', N'50SP-MT707', N'CORIAN人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82451', N'展板', N'83378,83437,83425', N'檯面,人造石檯面,CORIAN人造石檯面', N'櫻花', N'50SP-MS703', N'CORIAN人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82452', N'展板', N'83378,83437,83425', N'檯面,人造石檯面,CORIAN人造石檯面', N'櫻花', N'50SP-RP230', N'CORIAN人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82453', N'展板', N'83378,83437,83425', N'檯面,人造石檯面,CORIAN人造石檯面', N'櫻花', N'50SP-TW726', N'CORIAN人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82454', N'展板', N'83378,83437,83425', N'檯面,人造石檯面,CORIAN人造石檯面', N'櫻花', N'50SP-WJ229', N'CORIAN人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82455', N'展板', N'83378,83437,83425', N'檯面,人造石檯面,CORIAN人造石檯面', N'櫻花', N'50SP-VW606-Venaro White 暗紋白', N'CORIAN人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82456', N'展板', N'83378,83437,83425', N'檯面,人造石檯面,CORIAN人造石檯面', N'櫻花', N'50SP-HY2519-Deep Night Sky 深夜空', N'CORIAN人造石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82457', N'展板', N'83378,83438,83426', N'檯面,不鏽鋼檯面,不鏽鋼檯面A型檯面', N'櫻花', N'C38160-2102', N'不鏽鋼A型檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82458', N'展板', N'83378,83438,83427', N'檯面,不鏽鋼檯面,不鏽鋼檯面B型檯面', N'櫻花', N'C39160-2102', N'不鏽鋼B型檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82459', N'展板', N'83378,83439,83428', N'檯面,美耐板檯面,美耐板加厚檯面-風格', N'櫻花', N'6317H', N'美耐板加厚檯面-風格', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82460', N'展板', N'83378,83439,83428', N'檯面,美耐板檯面,美耐板加厚檯面-風格', N'櫻花', N'7377MH', N'美耐板加厚檯面-風格', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82461', N'展板', N'83378,83439,83428', N'檯面,美耐板檯面,美耐板加厚檯面-風格', N'櫻花', N'7378MH', N'美耐板加厚檯面-風格', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82462', N'展板', N'83378,83439,83428', N'檯面,美耐板檯面,美耐板加厚檯面-風格', N'櫻花', N'7383MH', N'美耐板加厚檯面-風格', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82463', N'展板', N'83378,83439,83428', N'檯面,美耐板檯面,美耐板加厚檯面-風格', N'櫻花', N'0806MH', N'美耐板加厚檯面-風格', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82464', N'展板', N'83378,83439,83428', N'檯面,美耐板檯面,美耐板加厚檯面-風格', N'櫻花', N'8832H', N'美耐板加厚檯面-風格', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82465', N'展板', N'83378,83439,83428', N'檯面,美耐板檯面,美耐板加厚檯面-風格', N'櫻花', N'1541NT', N'美耐板加厚檯面-風格', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82466', N'展板', N'83377,83395', N'門板,金屬門板', N'櫻花', N'D1190', N'金屬門板', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82467', N'展板', N'83098,83362', N'龍頭,廚房無鉛伸縮龍頭', N'櫻花', N'LFK87121JV-13A', N'廚房無鉛伸縮龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82467', N'官網', N'83098,83362', N'龍頭,廚房無鉛伸縮龍頭', N'櫻花', N'LFK87121JV-13A', N'廚房無鉛伸縮龍頭', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82468', N'展板', N'83312,83314,83327', N'TEKA,蒸烤設備,蒸烤箱', N'TEKA', N'HKB 760 SC', N'60cm蒸烤箱', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82469', N'展板', N'83377,83403', N'門板,陶瓷塗裝細邊框型門板-類金屬色', N'櫻花', N'D7208-D8419', N'陶瓷塗裝細邊框型門板-類金屬色', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82470', N'展板', N'83097,83222', N'收納五金,創意設計', N'櫻花', N'鋁方管活動推車+B59', N'鋁方管活動推車+B59', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82471', N'展板', N'83378,83436,83385', N'檯面,石英石檯面,SILESTONE賽麗石檯面', N'櫻花', N'C5054-CS623-Gris Expo (火燒面)', N'SILESTONE賽麗石檯面', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82472', N'展板', N'81002,83013', N'SVAGO,洗碗機', N'SVAGO', N'VD6561', N'半嵌式熱烘存洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82482', N'展板', N'81002,83013', N'SVAGO,洗碗機', N'SVAGO', N'VD8565', N'全嵌式熱烘存洗碗機', N'')
GO

INSERT INTO [sync].[BuyKitchenProducts] ([id], [channel], [product_class_id_group], [product_class_name_group], [Brand], [model], [name], [erp_model]) VALUES (N'82483', N'展板', N'83312,83317,83367', N'TEKA,爐具,瓦斯爐', N'TEKA', N'GBC 30B0 1G XBN', N'單口瓦斯爐', N'')
GO

