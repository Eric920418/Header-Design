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

 Date: 19/03/2026 13:03:29
*/


-- ----------------------------
-- Table structure for BuyKitchenClasses
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[sync].[BuyKitchenClasses]') AND type IN ('U'))
	DROP TABLE [sync].[BuyKitchenClasses]
GO

CREATE TABLE [sync].[BuyKitchenClasses] (
  [id] int  NOT NULL,
  [channel] varchar(10) COLLATE Chinese_Taiwan_Stroke_CI_AS  NULL,
  [description] nvarchar(max) COLLATE Chinese_Taiwan_Stroke_CI_AS  NOT NULL,
  [parent_id] int  NOT NULL,
  [name] nvarchar(255) COLLATE Chinese_Taiwan_Stroke_CI_AS  NOT NULL,
  [sort] int  NOT NULL
)
GO

ALTER TABLE [sync].[BuyKitchenClasses] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of BuyKitchenClasses
-- ----------------------------
INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'5', N'展板', N'', N'83300', N'瓦斯熱水器', N'57')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'6', N'展板', N'', N'83301', N'除油煙機', N'110')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'7', N'展板', N'', N'83301', N'瓦斯爐', N'120')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'8', N'展板', N'', N'83301', N'殺菌烘碗機', N'130')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'9', N'展板', N'', N'0', N'淨水設備', N'2')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'13', N'展板', N'', N'5', N'恆溫熱水器', N'50')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'14', N'展板', N'', N'83227', N'儲熱式', N'50')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'16', N'展板', N'', N'83302', N'熱泵', N'58')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'20', N'展板', N'', N'13', N'數位恆溫系列', N'70')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'23', N'展板', N'', N'13', N'其他配備', N'100')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'24', N'展板', N'', N'14', N'標準系列', N'12')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'25', N'展板', N'', N'14', N'e省電系列', N'11')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'26', N'展板', N'', N'83227', N'瞬熱式', N'14')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'29', N'展板', N'', N'6', N'歐化系列 ', N'21')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'30', N'展板', N'', N'6', N'斜背系列', N'25')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'31', N'展板', N'', N'6', N'隱藏系列', N'22')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'32', N'展板', N'', N'6', N'深罩系列', N'24')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'33', N'展板', N'', N'6', N'輕巧系列', N'26')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'34', N'展板', N'', N'6', N'配備', N'27')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'35', N'展板', N'', N'7', N'台爐 ', N'55')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'37', N'展板', N'', N'7', N'檯面爐', N'58')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'38', N'展板', N'', N'7', N'併爐', N'41')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'39', N'展板', N'', N'8', N'吊掛系列', N'42')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'40', N'展板', N'', N'8', N'落地系列', N'43')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'41', N'展板', N'', N'9', N'RO系列', N'0')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'42', N'展板', N'', N'9', N'SQC系列', N'0')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'44', N'展板', N'', N'9', N'過濾系列', N'47')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'45', N'展板', N'', N'9', N'濾心', N'60')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'46', N'展板', N'', N'83307', N'嵌入式微波蒸烤箱', N'150')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'48', N'展板', N'', N'83301', N'洗碗機', N'135')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'49', N'展板', N'', N'83307', N'電器收納櫃', N'140')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'53', N'展板', N'', N'35', N'雙內焰系列', N'36')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'54', N'展板', N'', N'35', N'標準系列', N'37')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'57', N'展板', N'', N'37', N'防乾燒系列', N'32')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'60', N'展板', N'', N'37', N'標準系列', N'33')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'61', N'展板', N'', N'38', N'節能系列', N'41')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'74', N'展板', N'', N'7', N'嵌入爐', N'58')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'75', N'展板', N'', N'74', N'雙內焰系列', N'39')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'76', N'展板', N'', N'74', N'標準系列', N'40')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'147', N'展板', N'', N'13', N'供排平衡系列', N'60')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'153', N'展板', N'', N'37', N'高效系列', N'33')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'153', N'官網', N'', N'37', N'高效系列', N'33')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'154', N'展板', N'', N'37', N'雙內焰系列', N'30')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'155', N'展板', N'', N'9', N'熱飲機系列', N'2')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'156', N'展板', N'', N'6', N'流線系列', N'23')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'157', N'展板', N'', N'37', N'易清系列', N'31')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'160', N'展板', N'', N'83307', N'蒸烤箱(嵌入式)', N'160')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'162', N'展板', N'', N'83301', N'IH感應爐', N'125')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'163', N'展板', N'', N'35', N'雙炫火系列', N'35')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'164', N'展板', N'', N'37', N'雙炫火系列', N'28')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'165', N'展板', N'', N'74', N'雙炫火系列', N'38')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'166', N'展板', N'', N'13', N'無線溫控系列', N'20')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'171', N'展板', N'', N'13', N'循環預熱系列', N'50')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'173', N'展板', N'', N'172', N'SHINELUX(old)', N'58')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'175', N'展板', N'', N'13', N'環保減排系列', N'30')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'176', N'展板', N'', N'13', N'冷凝高效系列', N'40')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'177', N'展板', N'', N'13', N'渦輪增壓系列', N'10')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'72001', N'展板', N'', N'71001', N'蒸烤設備', N'216004')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'72006', N'展板', N'', N'71001', N'爐具', N'216014')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'73002', N'展板', N'', N'72001', N'--- 烤箱', N'216004')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'73003', N'展板', N'', N'72001', N'--- 蒸烤箱', N'216005')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'73004', N'展板', N'', N'72001', N'--- 蒸爐', N'216006')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'73007', N'展板', N'', N'72006', N'--- 感應爐', N'216014')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'73008', N'展板', N'', N'72006', N'--- 電陶爐', N'216015')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'73009', N'展板', N'', N'72006', N'--- 瓦斯爐', N'216016')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'73010', N'展板', N'', N'71001', N'排油煙機', N'144011')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'73011', N'展板', N'', N'71001', N'冰箱、紅酒櫃', N'144012')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'73012', N'展板', N'', N'71001', N'咖啡機', N'144013')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'73013', N'展板', N'', N'71001', N'洗碗機', N'144014')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'73014', N'展板', N'', N'71001', N'洗、脫、烘衣機', N'144015')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'73034', N'展板', N'', N'71001', N'其他', N'144035')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'73035', N'展板', N'', N'72006', N'--- 鐵板燒', N'216042')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'81002', N'展板', N'', N'0', N'SVAGO', N'250000')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'82001', N'展板', N'', N'81002', N'烤箱/蒸烤設備', N'164014')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83002', N'展板', N'', N'82001', N'--- 烤箱', N'246005')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83003', N'展板', N'', N'82001', N'--- 蒸烤箱', N'246006')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83005', N'展板', N'', N'82001', N'--- 微波烤箱', N'246008')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83006', N'展板', N'', N'81002', N'IH感應爐具 ', N'164013')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83010', N'展板', N'', N'81002', N'排油煙機', N'164012')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83013', N'展板', N'', N'81002', N'洗碗機', N'164015')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83016', N'展板', N'', N'81002', N'水槽', N'164018')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83018', N'展板', N'', N'82017', N'--- Damixa', N'246037')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83019', N'展板', N'', N'82017', N'--- Newform', N'246038')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83094', N'展板', N'智能恆溫系列', N'13', N'智能恆溫系列', N'15')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83096', N'展板', N'整體廚房', N'0', N'整體廚房', N'10')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83097', N'展板', N'收納五金', N'0', N'收納五金', N'20')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83098', N'展板', N'龍頭', N'0', N'龍頭', N'30')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83100', N'展板', N'水槽', N'0', N'水槽', N'40')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83114', N'展板', N' 嵌門板系列', N'8', N'嵌門板系列', N'41')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83115', N'展板', N'', N'83096', N'Loft', N'5')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83161', N'展板', N'日本進口系列', N'13', N'日本進口系列', N'50')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83191', N'展板', N'', N'83098', N'廚房不鏽鋼無鉛立式龍頭', N'2')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83191', N'官網', N'', N'83098', N'廚房不鏽鋼無鉛立式龍頭', N'2')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83194', N'展板', N'', N'83098', N'廚房不鏽鋼無鉛伸縮龍頭', N'3')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83194', N'官網', N'', N'83098', N'廚房不鏽鋼無鉛伸縮龍頭', N'3')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83197', N'展板', N'', N'83098', N'廚房無鉛三用龍頭', N'5')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83197', N'官網', N'', N'83098', N'廚房無鉛三用龍頭', N'5')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83198', N'展板', N'', N'83100', N'不鏽鋼單槽水槽組', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83198', N'官網', N'', N'83100', N'不鏽鋼單槽水槽組', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83200', N'展板', N'', N'83100', N'SAKURA花崗岩水槽', N'30')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83200', N'官網', N'', N'83100', N'SAKURA花崗岩水槽', N'30')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83201', N'展板', N'', N'83100', N'SAKURA嚴選人造石水槽', N'20')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83201', N'官網', N'', N'83100', N'SAKURA嚴選人造石水槽', N'20')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83204', N'展板', N'', N'14', N'倍容定溫系列', N'30')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83205', N'展板', N'', N'6', N'近吸系列', N'10')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83206', N'展板', N'', N'83096', N'Elegant', N'10')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83210', N'展板', N'', N'83307', N'嵌入式微波烤箱', N'155')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83217', N'展板', N'', N'83097', N'吊櫃收納', N'5')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83217', N'官網', N'', N'83097', N'吊櫃收納', N'5')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83218', N'展板', N'', N'83097', N'轉角地櫃收納', N'3')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83218', N'官網', N'', N'83097', N'轉角地櫃收納', N'3')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83219', N'展板', N'', N'83097', N'抽屜地櫃收納', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83219', N'官網', N'', N'83097', N'抽屜地櫃收納', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83220', N'展板', N'', N'83097', N'籃類地櫃收納', N'2')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83220', N'官網', N'', N'83097', N'籃類地櫃收納', N'2')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83221', N'展板', N'', N'83097', N'黃金地段收納', N'9')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83221', N'官網', N'', N'83097', N'黃金地段收納', N'9')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83222', N'展板', N'', N'83097', N'創意設計', N'8')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83222', N'官網', N'', N'83097', N'創意設計', N'8')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83227', N'展板', N'', N'83300', N'電能熱水器', N'105')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83229', N'展板', N'', N'83231', N'標準系列', N'0')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83230', N'展板', N'', N'83231', N'加強抗風系列', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83231', N'展板', N'', N'5', N'傳統熱水器', N'2')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83234', N'展板', N'', N'26', N'數位恆溫系列', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83235', N'展板', N'', N'26', N'分段調溫系列', N'2')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83236', N'展板', N'', N'45', N'RO系列', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83237', N'展板', N'', N'45', N'SQC系列', N'2')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83238', N'展板', N'', N'45', N'過濾系列', N'3')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83239', N'展板', N'', N'15', N'標準型', N'2')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83240', N'展板', N'', N'16', N'一體式', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83242', N'展板', N'', N'81002', N'洗脫烘洗衣機', N'164016')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83243', N'展板', N'', N'81002', N'紅酒櫃', N'164017')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83244', N'展板', N'', N'45', N'濾心組合系列', N'4')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83244', N'官網', N'', N'45', N'濾心組合系列', N'4')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83246', N'展板', N'小空間 備料大輕鬆

│產品特點│
細鋁框玻璃門，質感加分。
造型開放櫃，一目了然好拿取。
上掀桌板，備料空間無限延伸。
鍋具吊掛架，分類收納好整理。

│選購產品│
LED嵌燈，實用美觀兼具。
嵌入式插座，便利家電使用。', N'83250', N'備料延伸櫃', N'4')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83246', N'官網', N'小空間 備料大輕鬆

│產品特點│
細鋁框玻璃門，質感加分。
造型開放櫃，一目了然好拿取。
上掀桌板，備料空間無限延伸。
鍋具吊掛架，分類收納好整理。

│選購產品│
LED嵌燈，實用美觀兼具。
嵌入式插座，便利家電使用。', N'83250', N'備料延伸櫃', N'4')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83247', N'展板', N'貼心收納 一站搞定

│產品特點│

造型開放櫃，隨拿即用。
開放式電器櫃  展示收納美觀又便利。
平板抽可以作為延伸檯面，放大料理空間。
配置SAKURA靜音緩衝抽屜，家電配置，一應俱全。
具人體工學設計，上下櫃分離。
滿足不同族群收納使用。
可選配內嵌單口感應爐，增加料理機能。
_____________________________________________

│選購產品│

LED崁燈，實用美觀兼具。
崁入式插座，便利家電使用。
杯具吊掛桿組(茶水點心吧建議選配)。
犀利鉤掛件，配件收納，一目了然。
SVAGO 單口感應爐，觸控式8段火力，輕鬆控制料理更便利。', N'83250', N'小家電收納吧(90cm)', N'2')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83247', N'官網', N'貼心收納 一站搞定

│產品特點│

造型開放櫃，隨拿即用。
開放式電器櫃  展示收納美觀又便利。
平板抽可以作為延伸檯面，放大料理空間。
配置SAKURA靜音緩衝抽屜，家電配置，一應俱全。
具人體工學設計，上下櫃分離。
滿足不同族群收納使用。
可選配內嵌單口感應爐，增加料理機能。
_____________________________________________

│選購產品│

LED崁燈，實用美觀兼具。
崁入式插座，便利家電使用。
杯具吊掛桿組(茶水點心吧建議選配)。
犀利鉤掛件，配件收納，一目了然。
SVAGO 單口感應爐，觸控式8段火力，輕鬆控制料理更便利。', N'83250', N'小家電收納吧(90cm)', N'2')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83248', N'展板', N'貼心收納 一站搞定

│產品特點│

造型開放櫃，隨拿即用。
開放式電器櫃  展示收納美觀又便利。
平板抽可以作為延伸檯面，放大料理空間。
配置SAKURA靜音緩衝抽屜，家電配置，一應俱全。
具人體工學設計，上下櫃分離。
滿足不同族群收納使用。
可選配內嵌單口感應爐，增加料理機能。
_____________________________________________

│選購產品│

LED崁燈，實用美觀兼具。
崁入式插座，便利家電使用。
杯具吊掛桿組(茶水點心吧建議選配)。
犀利鉤掛件，配件收納，一目了然。
SVAGO 單口感應爐，觸控式8段火力，輕鬆控制料理更便利。', N'83250', N'小家電收納吧(120cm)', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83248', N'官網', N'貼心收納 一站搞定

│產品特點│

造型開放櫃，隨拿即用。
開放式電器櫃  展示收納美觀又便利。
平板抽可以作為延伸檯面，放大料理空間。
配置SAKURA靜音緩衝抽屜，家電配置，一應俱全。
具人體工學設計，上下櫃分離。
滿足不同族群收納使用。
可選配內嵌單口感應爐，增加料理機能。
_____________________________________________

│選購產品│

LED崁燈，實用美觀兼具。
崁入式插座，便利家電使用。
杯具吊掛桿組(茶水點心吧建議選配)。
犀利鉤掛件，配件收納，一目了然。
SVAGO 單口感應爐，觸控式8段火力，輕鬆控制料理更便利。', N'83250', N'小家電收納吧(120cm)', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83250', N'展板', N'邊櫃系列', N'0', N'邊櫃系列', N'11')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83250', N'官網', N'邊櫃系列', N'0', N'邊櫃系列', N'11')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83254', N'展板', N'小空間 收納大升級

│產品特點│
細鋁框玻璃門，簡約時尚展現。
造型開放櫃，便捷取用。
上掀桌板，調理、收納一站完成。
SAKURA靜音緩衝抽屜，隨拿即食。

│選購產品│
LED嵌燈，實用美觀兼具。
嵌入式插座，便利家電使用。
杯具吊掛桿，精美杯具展示。', N'83250', N'茶水點心吧', N'4')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83254', N'官網', N'小空間 收納大升級

│產品特點│
細鋁框玻璃門，簡約時尚展現。
造型開放櫃，便捷取用。
上掀桌板，調理、收納一站完成。
SAKURA靜音緩衝抽屜，隨拿即食。

│選購產品│
LED嵌燈，實用美觀兼具。
嵌入式插座，便利家電使用。
杯具吊掛桿，精美杯具展示。', N'83250', N'茶水點心吧', N'4')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83258', N'展板', N'', N'83097', N'高櫃/半高櫃收納', N'6')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83258', N'官網', N'', N'83097', N'高櫃/半高櫃收納', N'6')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83271', N'展板', N'', N'16', N'直熱式', N'19')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83280', N'展板', N'', N'9', N'淨熱飲系列', N'2')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83282', N'展板', N'', N'14', N'倍容系列', N'49')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83300', N'展板', N'櫻花熱水器系列', N'0', N'熱水器', N'3')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83301', N'展板', N'1', N'0', N'廚房電器', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83303', N'展板', N'1', N'83307', N'嵌入式電烤箱', N'200')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83307', N'展板', N'烤箱與電器收納櫃', N'83301', N'烤箱與電器收納櫃', N'500')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83312', N'展板', N'TEKA', N'0', N'TEKA', N'350000')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83313', N'展板', N'洗碗機', N'83312', N'洗碗機', N'322000')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83314', N'展板', N'烤箱/蒸烤箱', N'83312', N'蒸烤設備', N'320000')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83315', N'展板', N'酒櫃', N'83312', N'紅酒櫃', N'324000')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83317', N'展板', N'爐具', N'83312', N'爐具', N'321000')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83318', N'展板', N'咖啡機', N'83312', N'咖啡機', N'323000')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83319', N'展板', N'花崗岩槽、不鏽鋼槽', N'83312', N'水槽', N'328000')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83320', N'展板', N'排油煙機', N'83312', N'排油煙機', N'326000')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83321', N'展板', N'冰箱', N'83312', N'冰箱', N'325000')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83322', N'展板', N'洗脫烘', N'83312', N'洗脫烘', N'327000')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83323', N'展板', N'龍頭', N'83312', N'龍頭', N'329000')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83324', N'展板', N'其他', N'83312', N'其他', N'330000')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83326', N'展板', N'烤箱', N'83314', N'烤箱', N'319500')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83327', N'展板', N'蒸烤箱', N'83314', N'蒸烤箱', N'319600')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83328', N'展板', N'微波烤', N'83314', N'微波烤', N'319700')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83329', N'展板', N'蒸爐', N'83314', N'蒸爐', N'319800')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83330', N'展板', N'IH感應爐', N'83317', N'IH感應爐', N'320500')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83331', N'展板', N'瓦斯爐', N'72006', N'瓦斯爐', N'120')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83332', N'展板', N'半嵌式洗碗機', N'83313', N'半嵌式洗碗機', N'321500')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83333', N'展板', N'全嵌式洗碗機', N'83313', N'全嵌式洗碗機', N'321600')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83334', N'展板', N'獨立式洗碗機', N'83313', N'獨立式洗碗機', N'321700')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83335', N'展板', N'壁掛式油煙機', N'83320', N'壁掛式油煙機', N'325500')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83336', N'展板', N'隱藏式油煙機', N'83320', N'隱藏式油煙機', N'325600')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83337', N'展板', N'中島式油煙機', N'83320', N'中島式油煙機', N'325700')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83338', N'展板', N'花崗岩水槽', N'83319', N'花崗岩水槽', N'327500')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83339', N'展板', N'不鏽鋼水槽', N'83319', N'不鏽鋼水槽', N'327600')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83341', N'展板', N'單槍龍頭', N'83323', N'單槍龍頭', N'328500')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83342', N'展板', N'伸縮龍頭', N'83323', N'伸縮龍頭', N'328600')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83343', N'展板', N'1', N'14', N'前置抑垢系列', N'49')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83349', N'展板', N'瓦斯爐', N'81002', N'瓦斯爐', N'1000')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83353', N'展板', N'龍頭配件', N'83098', N'配件', N'29')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83353', N'官網', N'龍頭配件', N'83098', N'配件', N'29')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83354', N'展板', N'LED鋁條嵌燈專用櫃', N'83097', N'LED鋁條嵌燈專用櫃', N'7')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83354', N'官網', N'LED鋁條嵌燈專用櫃', N'83097', N'LED鋁條嵌燈專用櫃', N'7')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83355', N'展板', N'其他地櫃收納', N'83097', N'其他地櫃收納', N'4')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83355', N'官網', N'其他地櫃收納', N'83097', N'其他地櫃收納', N'4')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83356', N'展板', N'2', N'83100', N'不鏽鋼壓花水槽', N'3')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83356', N'官網', N'2', N'83100', N'不鏽鋼壓花水槽', N'3')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83357', N'展板', N'2', N'83100', N'手工方型槽', N'2')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83357', N'官網', N'2', N'83100', N'手工方型槽', N'2')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83358', N'展板', N'2', N'83100', N'CARYSIL花崗岩水槽', N'31')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83358', N'官網', N'2', N'83100', N'CARYSIL花崗岩水槽', N'31')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83359', N'展板', N'• 符合CNS8088，飲水用水龍頭規範，健康無鉛
• 採用台灣康勤陶瓷閥芯，品質保證
• 配置瑞士進口NEOPERL 起泡器，出水柔和', N'83098', N'廚房無鉛立式龍頭', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83359', N'官網', N'• 符合CNS8088，飲水用水龍頭規範，健康無鉛
• 採用台灣康勤陶瓷閥芯，品質保證
• 配置瑞士進口NEOPERL 起泡器，出水柔和', N'83098', N'廚房無鉛立式龍頭', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83362', N'展板', N'2', N'83098', N'廚房無鉛伸縮龍頭', N'4')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83362', N'官網', N'2', N'83098', N'廚房無鉛伸縮龍頭', N'4')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83363', N'展板', N'2', N'83098', N'廚房不鏽鋼無鉛三用龍頭', N'6')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83363', N'官網', N'2', N'83098', N'廚房不鏽鋼無鉛三用龍頭', N'6')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83364', N'展板', N'2', N'83100', N'不鏽鋼水槽', N'4')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83364', N'官網', N'2', N'83100', N'不鏽鋼水槽', N'4')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83367', N'展板', N'瓦斯爐', N'83317', N'瓦斯爐', N'320502')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83377', N'展板', N'門板', N'0', N'門板', N'2000')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83377', N'官網', N'門板', N'0', N'門板', N'2000')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83378', N'展板', N'檯面', N'0', N'檯面', N'2001')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83378', N'官網', N'檯面', N'0', N'檯面', N'2001')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83384', N'展板', N'高耐熱：可直接放置熱鍋，無需擔心檯面受損
高耐污：吸水率極低，表面無孔隙，防止污漬滲入
高抗刮：卓越耐刮性，刀具滑過不留痕跡
高質感：先進數位印刷技術，還原天然石材真實風貌', N'83435', N'西班牙Coverlam卡沃石檯面', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83385', N'展板', N'持久美麗：顏色選擇豐富，質感近乎天然石材
高耐污性：極高抗腐蝕能力，液體不易滲透
高耐熱性：接觸高溫不易形成凹痕和焦斑
高耐刮性：刀鏟利器不易刮傷檯面
容易打理：日常清潔簡單易維持
安全衛生：成分不含重金屬物質，無輻射', N'83436', N'SILESTONE賽麗石檯面', N'2')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83386', N'展板', N'．防潮、低甲醛板材，環保耐用、易清潔。', N'83377', N'MFC四邊封門板', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83387', N'展板', N'．德國PFLEIDERER革命性產品，運用創新熱塗層專利技法打造絲絨般細滑的消光霧面質感。
．採用防潮、低甲醛塑合板基材，健康安全且環保耐用。
．德國專業大廠製造，色彩穩定、品質保障。', N'83377', N'絲絨門板', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83388', N'展板', N'．框型造型門板，勾勒簡約鄉村風格調性。
．採用耐刮、耐磨、防潮低甲醛塑合板基材，花色多樣及穩固木榫結構，美觀與實用兼具。', N'83377', N'框型四邊封門板', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83389', N'展板', N'．低甲醛防潮塑合板基材，堅固耐用、不易翹曲變形。
．彩色透心壓克力面材，門板光彩晶亮。
．高密度E1/P3塑合板基材，質量重且保釘力佳，鉸鍊加工更穩固。', N'83377', N'晶耀門板', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83390', N'展板', N'．極平整：專業且先進的製程設備，確保門板平整似鏡。
．極光亮：T1.5mm彩色透心壓克力面材，平坦光亮。
．極抗變：防潮塑合板，堅固耐用、不易變形。
．極穩固：高密度板材保釘力佳，鉸鍊加工更穩固。', N'83377', N'極晶耀門板', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83391', N'展板', N'．輕奢質感材質、特殊光澤紋理─金屬、石紋、珠光。
．板材花色延伸門板、桌板、層架。
．耐衝擊、耐高溫、耐刮擦、耐磨、耐髒，經久耐用、易清潔。
．通過防潮低甲醛驗證、防燄一級檢測。', N'83377', N'Style風格門板', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83392', N'展板', N'．德國進口雙色3D封邊材質，呈現細緻層次銀色線條和亮面晶透光感。
．透心壓克力面材結合高密度低甲醛防潮塑合板基材與專業製程，平整似鏡的質感。
．堅實耐用、抗變強度佳，提升保釘力，門板鉸鍊加工穩固。', N'83377', N'銀線晶耀門板', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83393', N'展板', N'．採用先進膜壓工藝完整包覆門板表面，透過立體打型設計，展現細緻線條與典雅風情。
．以「霧光白」與「木紋白」為基調，立體線條隨光影流轉，層次分明，為空間注入豐富而細膩的視覺表情。', N'83377', N'膜壓門板', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83394', N'展板', N'．面材融合銀離子(Ag+)抗菌科技。
．霧感硬化6H透心面材，油漬髒污不易殘留、好清潔。
．融接封邊工法，色調多樣、適搭性高。
．高密度低甲醛防潮塑合板基材，耐用、抗變強度及保釘力佳，鉸鍊加工穩固。', N'83377', N'霧感抗菌門板', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83395', N'展板', N'．低甲醛板材，環保耐用、易清潔。
．銀色仿金屬拉絲表面處理，適搭俐落現代風格。', N'83377', N'金屬門板', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83396', N'展板', N'．全包覆式陶瓷塗裝，耐刮、耐熱、防潮。
．陶瓷紋理質感細緻，抗汙易清、花色多樣。
．通過八大金屬檢測，安全低甲醛。', N'83377', N'陶瓷塗裝門板-素色', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83397', N'展板', N'．全包覆式陶瓷塗裝，耐刮、耐熱、防潮。
．陶瓷紋理質感細緻，抗汙易清、花色多樣。
．通過八大金屬檢測，安全低甲醛。', N'83377', N'陶瓷塗裝門板-類金屬色', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83398', N'展板', N'．櫻花獨家開發「細邊框造型」膜壓門板─以俐落細膩線條融合古典風格意象。
．具優雅細緻美式都會風格語彙。', N'83377', N'膜壓門板(臻美)', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83399', N'展板', N'．現代框型玻璃門板搭配銀色塗裝鋁合金框架，異材質結合T5mm強化玻璃。
．搭配整體風格設計、局部規劃配置，豐富空間表情。', N'83377', N'粗鋁框玻璃門板', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83400', N'展板', N'．全包覆式陶瓷塗裝，耐刮、耐熱、防潮。
．陶瓷紋理質感細緻，抗汙易清、花色多樣。
．通過八大金屬檢測，安全低甲醛。
．J型把手造型門板設計，一體成型、簡約俐落。', N'83377', N'陶瓷塗裝J型門板-素色', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83401', N'展板', N'．全包覆式陶瓷塗裝，耐刮、耐熱、防潮。
．陶瓷紋理質感細緻，抗汙易清、花色多樣。
．通過八大金屬檢測，安全低甲醛。
．J型把手造型門板設計，一體成型、簡約俐落。', N'83377', N'陶瓷塗裝J型門板-類金屬色', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83402', N'展板', N'．全包覆式陶瓷塗裝，耐刮、耐熱、防潮。
．陶瓷紋理質感細緻，抗汙易清、花色多樣。
．通過八大金屬檢測，安全低甲醛。
．細邊框造型門板設計，展現優雅設計語彙。', N'83377', N'陶瓷塗裝細邊框型門板-素色', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83403', N'展板', N'．全包覆式陶瓷塗裝，耐刮、耐熱、防潮。
．陶瓷紋理質感細緻，抗汙易清、花色多樣。
．通過八大金屬檢測，安全低甲醛。
．細邊框造型門板設計，展現優雅設計語彙。', N'83377', N'陶瓷塗裝細邊框型門板-類金屬色', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83404', N'展板', N'．義大利進口FENIX奈米智慧板材。
．具極致霧面效果、舒適觸感、抗指紋特性及熱修復機能。
．可耐刮、耐磨、耐污、耐乾熱。
．通過美國NSF認證，確保食品安全。
．融接封邊技術展現高規工法。', N'83377', N'FENIX門板', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83405', N'展板', N'．高櫃門框配置一體成型垂直L型把手，鋁合金材質、粉體塗裝，耐候性佳。
．垂直配置進口LED鋁條嵌燈，增添空間氛圍質感。
．標配GRASS SCALA靜音緩衝按壓抽屜，增加隱藏式收納機能。', N'83377', N'黑色細鋁框玻璃門板-AIR(含垂直L型把手)', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83406', N'展板', N'．現代框型玻璃門板設計─黑色粉體塗裝鋁合金框架結構，異材質結合T5mm強化玻璃，簡約大方。
．搭配整體風格設計、局部規劃配置，豐富空間表情。', N'83377', N'黑色細鋁框玻璃門板', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83407', N'展板', N'．六面全包覆式塗裝工藝，光澤細膩通透、成就空間高端質感。
．門板表面光滑亮麗、耐候性佳，日常保養輕鬆省心。
．適合現代、輕奢、極簡風格空間，展現簡潔而大器的設計語彙。', N'83377', N'鏡面塗裝門板', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83408', N'展板', N'．霧面烤漆處理，消光內斂與眾不同，呈現高質感視覺表現。
．現代簡約質感佳，適合作為主要色系運用。', N'83377', N'霧面塗裝門板(無造型)', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83409', N'展板', N'．全包覆式陶瓷塗裝，耐刮、耐熱、防潮。
．陶瓷紋理質感細緻，抗汙易清、花色多樣。
．通過八大金屬檢測，安全低甲醛。
．格柵造型門板設計，一體成型。', N'83377', N'陶瓷塗裝格柵門板-素色', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83410', N'展板', N'．全包覆式陶瓷塗裝，耐刮、耐熱、防潮。
．陶瓷紋理質感細緻，抗汙易清、花色多樣。
．通過八大金屬檢測，安全低甲醛。
．格柵造型門板設計，一體成型。', N'83377', N'陶瓷塗裝格柵門板-類金屬色', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83411', N'展板', N'．高櫃門框配置一體成型垂直L型把手，鋁合金材質、金色拉絲陽極表面處理，耐候性佳。
．垂直配置進口LED鋁條嵌燈，增添空間氛圍質感。
．標配GRASS SCALA靜音緩衝按壓抽屜，增加隱藏式收納機能。', N'83377', N'金色細鋁框玻璃門板-AIR (含垂直L型把手)', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83412', N'展板', N'．天然北美橡木實木門板，厚實比例的框型設計、結合獨家導角與刻溝肚片細節，勾勒出溫馨質樸、充滿手作溫度的鄉村風格表情。
．透過細膩的原木染色工序，賦予橡木更高彩度且層次豐富的色澤，展現南法鄉村特有的濃烈熱情與自然活力，使空間洋溢溫暖的生活氛圍。', N'83377', N'染色實木門板', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83413', N'展板', N'．天然北美橡木實木門板，厚實比例的框型設計、結合獨家導角與鏤空格柵工藝，勾勒出溫馨質樸、充滿手作溫度的鄉村風格表情。
．透過細膩的原木染色工序，賦予橡木更高彩度且層次豐富的色澤，展現南法鄉村特有的濃烈熱情與自然活力，使空間洋溢溫暖的生活氛圍。', N'83377', N'染色實木格柵門板', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83414', N'展板', N'．嚴選實木材質(白荃木/胡桃木)，展現天然獨一無二的木紋肌理、色澤層次與溫潤觸感。
．厚實比例勾勒大器風範，為居家空間增添沉穩貴雅氣度，彰顯不凡品味與生活格調。', N'83377', N'原色實木門板', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83415', N'展板', N'．以直條交錯排列，透過光影、材質、線性結構呈現出秩序之美。
．適用各種不同風格及空間， 增添豐富設計層次和視覺焦點。', N'83377', N'格柵門板', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83416', N'展板', N'．櫻花獨家開發「細邊框造型」門板設計─以俐落細膩線條融合古典風格意象。
．具優雅細緻美式都會風格語彙。', N'83377', N'烤漆實木格子窗清玻璃門板', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83420', N'展板', N'抗菌功能：低孔隙率使細菌難以附著，更易於日常清潔
高耐磨 高硬度：能承受日常刮磨、撞擊與長期使用磨耗
高施工性：板材穩定性佳，不易崩角與裂縫
防髒污 易清潔：醬料飲料不易滲入，清潔維護簡易', N'83436', N'HANSTONE石英石檯面', N'3')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83421', N'展板', N'高硬度 超耐磨：刀鏟利器不易劃傷、磨損檯面
高耐污 易清潔：表面不易藏污納垢，簡易維持
緻密抗菌 好健康：質地緻密、全方位抗菌
衛生無毒 安心用：無重金屬輻射源成份與任何污染源', N'83436', N'SAKURA STONE石英石檯面', N'4')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83422', N'展板', N'抗菌防護：緻密表面抑制細菌孳生
耐磨高耐久：長期使用仍維持細緻外觀
高施工性：便於切割、熱彎、拼接
防髒污：毛細孔極小，表面不易滲色
預防病菌：非多孔性材質有效降低病菌殘留
環境友善：以友善環境配方製造', N'83437', N'ＨANEX人造石檯面', N'5')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83423', N'展板', N'自然美觀：自然深淺石紋，營造原石般質感
抗菌防護：緻密表面抑制細菌孳生
耐磨高耐久：長期使用仍維持細緻外觀
高施工性：便於切割、熱彎、拼接
防髒污：毛細孔極小，表面不易滲色
預防病菌：非多孔性材質有效降低病菌殘留
環境友善：以友善環境配方製造', N'83437', N'HANEX-STRATUM火山石檯面', N'6')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83424', N'展板', N'特殊面材：具備遠紅外線功能的壓克力面材
抗菌防護：緻密表面抑制細菌孳生
耐磨高耐久：長期使用仍維持細緻外觀
高施工性：便於切割、熱彎、拼接
防髒污：毛細孔極小，表面不易滲色
預防病菌：非多孔性材質有效降低病菌殘留
環境友善：以友善環境配方製造', N'83437', N'HANEX-BRIONNE遠紅外線人造石檯面', N'7')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83425', N'展板', N'安全衛生：無孔表面，無縫拼接，有效抑制病菌滋生
可修復性：無懼磨損，歷久彌新，輕鬆修復，不留痕跡
質感溫潤：絲般表面，觸感光滑溫潤
設計靈活：適合多種空間。 多重元素無縫綜合
綠色環保：不含有害化學物質，安全環保。', N'83437', N'CORIAN人造石檯面', N'8')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83426', N'展板', N'衛生易清：光滑無毛細孔，不易滋生細菌
耐溫抗焰：可直接承受熱鍋高溫，無須墊板
防水防潮：水氣油漬不易滲入，不膨脹、不變形
抗菌防霉：一體成型、無接縫設計可避免藏汙納垢
耐用長壽：實心不鏽鋼耐壓、耐撞且不易變形
極簡外觀：金屬質感適合工業風、現代感廚房', N'83438', N'不鏽鋼檯面A型檯面', N'9')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83427', N'展板', N'衛生易清：光滑無毛細孔，不易滋生細菌
耐溫抗焰：可直接承受熱鍋高溫，無須墊板
防水防潮：水氣油漬不易滲入，不膨脹、不變形
抗菌防霉：一體成型、無接縫設計可避免藏汙納垢
耐用長壽：實心不鏽鋼耐壓、耐撞且不易變形
極簡外觀：金屬質感適合工業風、現代感廚房', N'83438', N'不鏽鋼檯面B型檯面', N'10')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83428', N'展板', N'經久耐用 易清潔：採用HPL高壓層壓板面材，耐衝擊、耐高溫、耐刮擦、耐磨、耐髒，經久耐用、易清潔
防潮 防焰：通過防潮低甲醛驗證、防燄一級檢測，能防止火源擴大延燒
花色多樣：自由搭配，輕鬆打造空間風格', N'83439', N'美耐板加厚檯面-風格', N'11')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83429', N'展板', N'1. 斯里蘭卡高級天然椰殼製成，吸附效果優。
2. 碳粉不會輕易流出，造成黑水的污染。
3. 銀添成分可抑制細菌滋長', N'45', N'銀添活性碳棒濾心', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83430', N'展板', N'1.高級天然斯里蘭卡椰殼製成，濾除效果優異。
2.保護RO膜管使其不受化學物質（氯）侵蝕，延長RO膜的壽命。', N'45', N'椰殼活性碳(10吋)', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83433', N'展板', N'德國拜耳食品級陽離子交換樹脂材料製成，能夠軟化水質，有效強化樹脂交換功能，降低水中石灰質含量，使澀口之硬水轉換為甘甜軟水。', N'45', N'樹脂濾心(12吋)', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83435', N'展板', N'陶板檯面', N'83378', N'陶板檯面', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83435', N'官網', N'陶板檯面', N'83378', N'陶板檯面', N'1')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83436', N'展板', N'石英石檯面', N'83378', N'石英石檯面', N'2')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83436', N'官網', N'石英石檯面', N'83378', N'石英石檯面', N'2')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83437', N'展板', N'人造石檯面', N'83378', N'人造石檯面', N'3')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83437', N'官網', N'人造石檯面', N'83378', N'人造石檯面', N'3')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83438', N'展板', N'不鏽鋼檯面', N'83378', N'不鏽鋼檯面', N'4')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83438', N'官網', N'不鏽鋼檯面', N'83378', N'不鏽鋼檯面', N'4')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83439', N'展板', N'美耐板檯面', N'83378', N'美耐板檯面', N'5')
GO

INSERT INTO [sync].[BuyKitchenClasses] ([id], [channel], [description], [parent_id], [name], [sort]) VALUES (N'83439', N'官網', N'美耐板檯面', N'83378', N'美耐板檯面', N'5')
GO

