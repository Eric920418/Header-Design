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

 Date: 19/03/2026 13:04:15
*/


-- ----------------------------
-- Table structure for BuyKitchenPublicFiles
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[sync].[BuyKitchenPublicFiles]') AND type IN ('U'))
	DROP TABLE [sync].[BuyKitchenPublicFiles]
GO

CREATE TABLE [sync].[BuyKitchenPublicFiles] (
  [id] int  NOT NULL,
  [type] varchar(14) COLLATE Chinese_Taiwan_Stroke_CI_AS  NULL,
  [product_id] int  NULL,
  [url] nvarchar(548) COLLATE Chinese_Taiwan_Stroke_CI_AS  NULL,
  [sort] int  NULL
)
GO

ALTER TABLE [sync].[BuyKitchenPublicFiles] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of BuyKitchenPublicFiles
-- ----------------------------
INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1698', N'使用手冊', N'1022', N'https://buy.sakura.com.tw/files/1698/DH1628.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1701', N'使用手冊', N'1023', N'https://buy.sakura.com.tw/files/1701/DH2460.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1703', N'product_images', N'34', N'https://buy.sakura.com.tw/media/1703/image.jpg', N'721')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1704', N'型錄', N'34', N'https://buy.sakura.com.tw/files/1704/SH-1691.jpg', N'722')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1743', N'使用手冊', N'975', N'https://buy.sakura.com.tw/files/1743/GH1035 .pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1746', N'使用手冊', N'976', N'https://buy.sakura.com.tw/files/1746/GH1235 .pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1750', N'product_images', N'48', N'https://buy.sakura.com.tw/media/1750/image.jpg', N'768')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1751', N'product_images', N'49', N'https://buy.sakura.com.tw/media/1751/image.jpg', N'769')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1752', N'product_images', N'958', N'https://buy.sakura.com.tw/media/1752/image.jpg', N'770')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1753', N'使用手冊', N'958', N'https://buy.sakura.com.tw/files/1753/DH1628-SH-1625-SH-1626專用.pdf', N'771')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1754', N'product_images', N'1033', N'https://buy.sakura.com.tw/media/1754/image.jpg', N'772')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1781', N'product_images', N'926', N'https://buy.sakura.com.tw/media/1781/image.jpg', N'799')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1784', N'product_images', N'954', N'https://buy.sakura.com.tw/media/1784/image.jpg', N'802')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1787', N'product_images', N'955', N'https://buy.sakura.com.tw/media/1787/image.jpg', N'805')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1834', N'product_images', N'921', N'https://buy.sakura.com.tw/media/1834/image.jpg', N'852')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1837', N'product_images', N'939', N'https://buy.sakura.com.tw/media/1837/image.jpg', N'855')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1840', N'product_images', N'946', N'https://buy.sakura.com.tw/media/1840/image.jpg', N'858')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1843', N'product_images', N'1012', N'https://buy.sakura.com.tw/media/1843/image.jpg', N'861')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1845', N'product_images', N'1013', N'https://buy.sakura.com.tw/media/1845/image.jpg', N'863')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1865', N'product_images', N'893', N'https://buy.sakura.com.tw/media/1865/image.jpg', N'883')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1868', N'product_images', N'1003', N'https://buy.sakura.com.tw/media/1868/image.jpg', N'886')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1871', N'product_images', N'8', N'https://buy.sakura.com.tw/media/1871/image.jpg', N'889')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1875', N'product_images', N'84', N'https://buy.sakura.com.tw/media/1875/image.jpg', N'893')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1876', N'product_images', N'85', N'https://buy.sakura.com.tw/media/1876/image.jpg', N'894')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1877', N'product_images', N'86', N'https://buy.sakura.com.tw/media/1877/image.jpg', N'895')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1881', N'product_images', N'1027', N'https://buy.sakura.com.tw/media/1881/image.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1884', N'product_images', N'1028', N'https://buy.sakura.com.tw/media/1884/image.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1906', N'product_images', N'978', N'https://buy.sakura.com.tw/media/1906/image.jpg', N'924')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1911', N'型錄', N'979', N'https://buy.sakura.com.tw/files/1911/G2633S.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1918', N'product_images', N'982', N'https://buy.sakura.com.tw/media/1918/image.jpg', N'936')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1920', N'型錄', N'982', N'https://buy.sakura.com.tw/files/1920/G2522S.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1921', N'product_images', N'147', N'https://buy.sakura.com.tw/media/1921/image.jpg', N'939')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1923', N'型錄', N'147', N'https://buy.sakura.com.tw/files/1923/G-2830KG .jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1924', N'product_images', N'148', N'https://buy.sakura.com.tw/media/1924/image.jpg', N'942')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1926', N'型錄', N'148', N'https://buy.sakura.com.tw/files/1926/G-2830KS .jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1927', N'product_images', N'149', N'https://buy.sakura.com.tw/media/1927/image.jpg', N'945')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1939', N'型錄', N'11', N'https://buy.sakura.com.tw/files/1939/G-5700K .jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1943', N'product_images', N'940', N'https://buy.sakura.com.tw/media/1943/image.jpg', N'961')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1945', N'型錄', N'940', N'https://buy.sakura.com.tw/files/1945/G5703 .jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1962', N'型錄', N'164', N'https://buy.sakura.com.tw/files/1962/G-6700K.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1966', N'product_images', N'941', N'https://buy.sakura.com.tw/media/1966/image.jpg', N'984')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1968', N'型錄', N'941', N'https://buy.sakura.com.tw/files/1968/G6703 .jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1981', N'型錄', N'924', N'https://buy.sakura.com.tw/files/1981/G-6500KG .jpg', N'999')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1982', N'product_images', N'944', N'https://buy.sakura.com.tw/media/1982/image.jpg', N'1000')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1984', N'型錄', N'944', N'https://buy.sakura.com.tw/files/1984/G2112G .PDF', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1988', N'product_images', N'912', N'https://buy.sakura.com.tw/media/1988/image.jpg', N'1006')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1991', N'product_images', N'913', N'https://buy.sakura.com.tw/media/1991/image.jpg', N'1009')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'1994', N'product_images', N'942', N'https://buy.sakura.com.tw/media/1994/image.jpg', N'1012')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2000', N'product_images', N'1006', N'https://buy.sakura.com.tw/media/2000/image.jpg', N'1018')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2003', N'product_images', N'1010', N'https://buy.sakura.com.tw/media/2003/image.jpg', N'1021')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2006', N'product_images', N'1018', N'https://buy.sakura.com.tw/media/2006/image.jpg', N'1024')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2009', N'product_images', N'1019', N'https://buy.sakura.com.tw/media/2009/image.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2011', N'型錄', N'1019', N'https://buy.sakura.com.tw/files/2011/Q7693  .jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2030', N'product_images', N'17', N'https://buy.sakura.com.tw/media/2030/image.jpg', N'1048')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2033', N'product_images', N'96', N'https://buy.sakura.com.tw/media/2033/image.jpg', N'1051')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2034', N'product_images', N'97', N'https://buy.sakura.com.tw/media/2034/image.jpg', N'1052')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2036', N'product_images', N'99', N'https://buy.sakura.com.tw/media/2036/image.jpg', N'1054')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2037', N'product_images', N'100', N'https://buy.sakura.com.tw/media/2037/image.jpg', N'1055')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2038', N'product_images', N'101', N'https://buy.sakura.com.tw/media/2038/image.jpg', N'1056')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2041', N'product_images', N'104', N'https://buy.sakura.com.tw/media/2041/image.jpg', N'1059')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2042', N'product_images', N'105', N'https://buy.sakura.com.tw/media/2042/image.jpg', N'1060')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2043', N'product_images', N'106', N'https://buy.sakura.com.tw/media/2043/image.jpg', N'1061')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2044', N'product_images', N'107', N'https://buy.sakura.com.tw/media/2044/image.jpg', N'1062')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2045', N'product_images', N'108', N'https://buy.sakura.com.tw/media/2045/image.jpg', N'1063')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2046', N'product_images', N'109', N'https://buy.sakura.com.tw/media/2046/image.jpg', N'1064')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2047', N'product_images', N'110', N'https://buy.sakura.com.tw/media/2047/image.jpg', N'1065')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2048', N'product_images', N'111', N'https://buy.sakura.com.tw/media/2048/image.jpg', N'1066')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2050', N'product_images', N'113', N'https://buy.sakura.com.tw/media/2050/image.jpg', N'1068')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2053', N'product_images', N'118', N'https://buy.sakura.com.tw/media/2053/image.jpg', N'1071')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2054', N'product_images', N'119', N'https://buy.sakura.com.tw/media/2054/image.jpg', N'1072')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2055', N'product_images', N'120', N'https://buy.sakura.com.tw/media/2055/image.jpg', N'1073')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2056', N'product_images', N'121', N'https://buy.sakura.com.tw/media/2056/image.jpg', N'1074')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2057', N'product_images', N'122', N'https://buy.sakura.com.tw/media/2057/image.jpg', N'1075')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2058', N'product_images', N'123', N'https://buy.sakura.com.tw/media/2058/image.jpg', N'1076')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2059', N'product_images', N'124', N'https://buy.sakura.com.tw/media/2059/image.jpg', N'1077')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2060', N'product_images', N'125', N'https://buy.sakura.com.tw/media/2060/image.jpg', N'1078')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2061', N'product_images', N'126', N'https://buy.sakura.com.tw/media/2061/image.jpg', N'1079')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2062', N'product_images', N'127', N'https://buy.sakura.com.tw/media/2062/image.jpg', N'1080')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2063', N'product_images', N'128', N'https://buy.sakura.com.tw/media/2063/image.jpg', N'1081')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2070', N'product_images', N'1015', N'https://buy.sakura.com.tw/media/2070/image.jpg', N'1088')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2072', N'型錄', N'1015', N'https://buy.sakura.com.tw/files/2072/E6672.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2073', N'product_images', N'1004', N'https://buy.sakura.com.tw/media/2073/image.jpg', N'1091')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2090', N'product_images', N'1025', N'https://buy.sakura.com.tw/media/2090/image.jpg', N'1108')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2092', N'型錄', N'1025', N'https://buy.sakura.com.tw/files/2092/EG2330GB .jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2096', N'product_images', N'1007', N'https://buy.sakura.com.tw/media/2096/image.jpg', N'1114')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2147', N'product_images', N'70047', N'https://buy.sakura.com.tw/media/2147/image.jpg', N'1165')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2151', N'product_images', N'70123', N'https://buy.sakura.com.tw/media/2151/image.jpg', N'1169')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2152', N'使用手冊', N'70123', N'https://buy.sakura.com.tw/files/2152/E9KLCS01A.pdf', N'1170')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2153', N'product_images', N'70124', N'https://buy.sakura.com.tw/media/2153/image.jpg', N'1171')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2154', N'使用手冊', N'70124', N'https://buy.sakura.com.tw/files/2154/E9KLPS01.pdf', N'1172')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2155', N'product_images', N'70125', N'https://buy.sakura.com.tw/media/2155/image.jpg', N'1173')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2156', N'使用手冊', N'70125', N'https://buy.sakura.com.tw/files/2156/E9KLCS01.pdf', N'1174')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2159', N'product_images', N'70127', N'https://buy.sakura.com.tw/media/2159/image.jpg', N'1177')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2160', N'使用手冊', N'70127', N'https://buy.sakura.com.tw/files/2160/E9KLSP01.pdf', N'1178')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2173', N'product_images', N'70030', N'https://buy.sakura.com.tw/media/2173/image.jpg', N'1191')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2182', N'product_images', N'70027', N'https://buy.sakura.com.tw/media/2182/image.jpg', N'1200')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2184', N'product_images', N'70031', N'https://buy.sakura.com.tw/media/2184/image.jpg', N'1202')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2187', N'product_images', N'70015', N'https://buy.sakura.com.tw/media/2187/image.jpg', N'1205')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2283', N'使用手冊', N'80134', N'https://buy.sakura.com.tw/files/2283/JG110B.pdf', N'1301')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2355', N'product_images', N'1027', N'https://buy.sakura.com.tw/media/2355/IMG_3231(2922A).JPG', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2356', N'product_images', N'1027', N'https://buy.sakura.com.tw/media/2356/_O5O9377.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2357', N'product_images', N'1027', N'https://buy.sakura.com.tw/media/2357/_O5O9396.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2359', N'product_images', N'1028', N'https://buy.sakura.com.tw/media/2359/_O5O9377.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2360', N'product_images', N'1028', N'https://buy.sakura.com.tw/media/2360/_O5O9396.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2361', N'product_images', N'1028', N'https://buy.sakura.com.tw/media/2361/_O5O9409.jpg', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2362', N'product_images', N'1028', N'https://buy.sakura.com.tw/media/2362/IMG_3231(2922A).JPG', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2423', N'product_images', N'1019', N'https://buy.sakura.com.tw/media/2423/23_800x800pix_96dpi_Q7693.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2425', N'product_images', N'1019', N'https://buy.sakura.com.tw/media/2425/25_800x800pix_96dpi_Q7693.png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2426', N'product_images', N'1019', N'https://buy.sakura.com.tw/media/2426/26_800x800pix_96dpi_全平面烘碗機.png', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2427', N'product_images', N'1019', N'https://buy.sakura.com.tw/media/2427/27_800x800pix_96dpi_全平面烘碗機2.png', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2538', N'product_images', N'80339', N'https://buy.sakura.com.tw/media/2538/G2926G.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2554', N'型錄', N'80339', N'https://buy.sakura.com.tw/files/2554/智能雙炫火.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2599', N'product_images', N'80351', N'https://buy.sakura.com.tw/media/2599/Q7592b.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2605', N'product_images', N'1014', N'https://buy.sakura.com.tw/media/2605/G2928G.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2606', N'型錄', N'1014', N'https://buy.sakura.com.tw/files/2606/G29282928G.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2615', N'保養手冊', N'1014', N'https://buy.sakura.com.tw/files/2615/瓦斯爐.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2618', N'保養手冊', N'954', N'https://buy.sakura.com.tw/files/2618/儲熱式電熱水器.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2923', N'product_images', N'80377', N'https://buy.sakura.com.tw/media/2923/201704240858.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2924', N'product_images', N'80377', N'https://buy.sakura.com.tw/media/2924/201704240901.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2925', N'product_images', N'80377', N'https://buy.sakura.com.tw/media/2925/201704240902.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2926', N'product_images', N'80378', N'https://buy.sakura.com.tw/media/2926/201704271728.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2927', N'product_images', N'80378', N'https://buy.sakura.com.tw/media/2927/201704271737.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2928', N'product_images', N'80378', N'https://buy.sakura.com.tw/media/2928/201704271738.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2929', N'product_images', N'80378', N'https://buy.sakura.com.tw/media/2929/201704271739.jpg', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2930', N'product_images', N'80378', N'https://buy.sakura.com.tw/media/2930/201704271740.jpg', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2931', N'product_images', N'80379', N'https://buy.sakura.com.tw/media/2931/201704241321.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2932', N'product_images', N'80379', N'https://buy.sakura.com.tw/media/2932/201704241335.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2933', N'product_images', N'80379', N'https://buy.sakura.com.tw/media/2933/201704241341.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2934', N'product_images', N'80379', N'https://buy.sakura.com.tw/media/2934/201704241358.jpg', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2935', N'product_images', N'80379', N'https://buy.sakura.com.tw/media/2935/201704241407.jpg', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2936', N'product_images', N'80379', N'https://buy.sakura.com.tw/media/2936/201704241413.jpg', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2937', N'product_images', N'80380', N'https://buy.sakura.com.tw/media/2937/201704241846.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2938', N'product_images', N'80380', N'https://buy.sakura.com.tw/media/2938/201704241858.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2939', N'product_images', N'80380', N'https://buy.sakura.com.tw/media/2939/201704241920.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2940', N'product_images', N'80380', N'https://buy.sakura.com.tw/media/2940/201704241949.jpg', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2942', N'product_images', N'80381', N'https://buy.sakura.com.tw/media/2942/201704241846.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2943', N'product_images', N'80381', N'https://buy.sakura.com.tw/media/2943/201704241858.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2944', N'product_images', N'80381', N'https://buy.sakura.com.tw/media/2944/201704241920.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2945', N'product_images', N'80381', N'https://buy.sakura.com.tw/media/2945/201704241949.jpg', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'2946', N'product_images', N'80381', N'https://buy.sakura.com.tw/media/2946/201704242013.jpg', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3542', N'RoHS', N'70030', N'https://buy.sakura.com.tw/files/3542/EOB3400AAX.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3543', N'RoHS', N'80080', N'https://buy.sakura.com.tw/files/3543/FDT4007.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3549', N'product_images', N'102', N'https://buy.sakura.com.tw/media/3549/C65-0304 快捷高效濾心.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3550', N'product_images', N'103', N'https://buy.sakura.com.tw/media/3550/C65-0305 快捷高效潔淨濾心.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3562', N'product_images', N'80396', N'https://buy.sakura.com.tw/media/3562/上掀.gif', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3563', N'product_images', N'80396', N'https://buy.sakura.com.tw/media/3563/折門.gif', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3564', N'product_images', N'80396', N'https://buy.sakura.com.tw/media/3564/抽屜.gif', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3570', N'product_images', N'80393', N'https://buy.sakura.com.tw/media/3570/上掀.gif', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3571', N'product_images', N'80393', N'https://buy.sakura.com.tw/media/3571/折門.gif', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3572', N'product_images', N'80393', N'https://buy.sakura.com.tw/media/3572/抽屜.gif', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3573', N'product_images', N'80393', N'https://buy.sakura.com.tw/media/3573/電動插座.gif', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3574', N'product_images', N'80394', N'https://buy.sakura.com.tw/media/3574/上掀.gif', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3575', N'product_images', N'80394', N'https://buy.sakura.com.tw/media/3575/折門.gif', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3576', N'product_images', N'80394', N'https://buy.sakura.com.tw/media/3576/抽屜.gif', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3577', N'product_images', N'80394', N'https://buy.sakura.com.tw/media/3577/電動插座.gif', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3582', N'product_images', N'80395', N'https://buy.sakura.com.tw/media/3582/上掀.gif', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3583', N'product_images', N'80395', N'https://buy.sakura.com.tw/media/3583/折門.gif', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3584', N'product_images', N'80395', N'https://buy.sakura.com.tw/media/3584/抽屜.gif', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3585', N'product_images', N'80395', N'https://buy.sakura.com.tw/media/3585/電動插座.gif', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3590', N'product_images', N'80396', N'https://buy.sakura.com.tw/media/3590/電動插座.gif', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3640', N'RoHS', N'1015', N'https://buy.sakura.com.tw/files/3640/E6672.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3649', N'RoHS', N'954', N'https://buy.sakura.com.tw/files/3649/瞬熱SH125.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3650', N'RoHS', N'955', N'https://buy.sakura.com.tw/files/3650/瞬熱SH125.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3679', N'product_images', N'80401', N'https://buy.sakura.com.tw/media/3679/SPDL-860.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3707', N'RoHS', N'926', N'https://buy.sakura.com.tw/files/3707/SH-186.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3770', N'RoHS', N'8', N'https://buy.sakura.com.tw/files/3770/R-3012XXXXX.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3771', N'RoHS', N'893', N'https://buy.sakura.com.tw/files/3771/R-3250XXXXX.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3773', N'RoHS', N'1003', N'https://buy.sakura.com.tw/files/3773/R-3268XXXXX.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3774', N'RoHS', N'1012', N'https://buy.sakura.com.tw/files/3774/R-3500XXXXX.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3775', N'RoHS', N'1013', N'https://buy.sakura.com.tw/files/3775/R-3506XXXXX.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3804', N'RoHS', N'942', N'https://buy.sakura.com.tw/files/3804/Q-600CW.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3805', N'RoHS', N'912', N'https://buy.sakura.com.tw/files/3805/Q-7565XXXX.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3833', N'RoHS', N'1025', N'https://buy.sakura.com.tw/files/3833/EG2330GB.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3835', N'RoHS', N'946', N'https://buy.sakura.com.tw/files/3835/R-605.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3903', N'使用手冊', N'920', N'https://buy.sakura.com.tw/files/3903/SH-1680,SH-1388.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3944', N'product_images', N'80628', N'https://buy.sakura.com.tw/media/3944/R3261_800.png', N'1984')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3985', N'product_images', N'80630', N'https://buy.sakura.com.tw/media/3985/PURE.png', N'2003')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'3989', N'product_images', N'80640', N'https://buy.sakura.com.tw/media/3989/CLASSIC.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4054', N'product_images', N'80660', N'https://buy.sakura.com.tw/media/4054/JB450-1.jpg', N'2047')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4159', N'RoHS', N'80628', N'https://buy.sakura.com.tw/files/4159/R3261_v1.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4160', N'RoHS', N'80623', N'https://buy.sakura.com.tw/files/4160/R3262_v1.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4165', N'product_images', N'80667', N'https://buy.sakura.com.tw/media/4165/當代系列_型錄模組_1.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4166', N'product_images', N'80667', N'https://buy.sakura.com.tw/media/4166/當代系列_型錄模組_2.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4167', N'product_images', N'80667', N'https://buy.sakura.com.tw/media/4167/當代系列_型錄模組_3.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4240', N'product_images', N'70046', N'https://buy.sakura.com.tw/media/4240/伊萊克斯鐵板燒-新款產品圖.jpg', N'2147')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4305', N'使用手冊', N'80800', N'https://buy.sakura.com.tw/files/4305/G615.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4307', N'使用手冊', N'80801', N'https://buy.sakura.com.tw/media/4307/G6150.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4314', N'product_images', N'80800', N'https://buy.sakura.com.tw/media/4314/G615_web2.png', N'2187')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4315', N'product_images', N'80801', N'https://buy.sakura.com.tw/media/4315/G6150_web2.png', N'2188')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4325', N'product_images', N'80795', N'https://buy.sakura.com.tw/media/4325/Q7692_3.png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4326', N'product_images', N'80795', N'https://buy.sakura.com.tw/media/4326/Q7692_4.png', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4327', N'product_images', N'80795', N'https://buy.sakura.com.tw/media/4327/Q7692_5.png', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4328', N'型錄', N'80795', N'https://buy.sakura.com.tw/files/4328/Q7692_DM.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4378', N'product_images', N'80819', N'https://buy.sakura.com.tw/media/4378/一字.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4379', N'product_images', N'80820', N'https://buy.sakura.com.tw/media/4379/臻美.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4389', N'product_images', N'80821', N'https://buy.sakura.com.tw/media/4389/ㄈ.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4393', N'product_images', N'80822', N'https://buy.sakura.com.tw/media/4393/L型.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4398', N'product_images', N'80820', N'https://buy.sakura.com.tw/media/4398/型錄模組2.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4399', N'product_images', N'80820', N'https://buy.sakura.com.tw/media/4399/型錄模組3.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4400', N'product_images', N'80820', N'https://buy.sakura.com.tw/media/4400/型錄模組4.png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4404', N'product_images', N'80393', N'https://buy.sakura.com.tw/media/4404/LOFT L型 hr2.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4405', N'product_images', N'80394', N'https://buy.sakura.com.tw/media/4405/loft 一字+中島 hr.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4406', N'product_images', N'80395', N'https://buy.sakura.com.tw/media/4406/loft 一字高櫃 hr2.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4407', N'product_images', N'80396', N'https://buy.sakura.com.tw/media/4407/loft 一字 hr.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4408', N'product_images', N'80823', N'https://buy.sakura.com.tw/media/4408/E8692.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4409', N'product_images', N'80823', N'https://buy.sakura.com.tw/media/4409/E8692_1.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4410', N'product_images', N'80823', N'https://buy.sakura.com.tw/media/4410/E8692_2.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4411', N'product_images', N'80823', N'https://buy.sakura.com.tw/media/4411/E8692_3.png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4414', N'RoHS', N'80823', N'https://buy.sakura.com.tw/files/4414/RoHS_E8692.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4428', N'product_images', N'80819', N'https://buy.sakura.com.tw/media/4428/一字型2.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4429', N'product_images', N'80819', N'https://buy.sakura.com.tw/media/4429/一字型3.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4430', N'product_images', N'80821', N'https://buy.sakura.com.tw/media/4430/ㄈ型2.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4431', N'product_images', N'80822', N'https://buy.sakura.com.tw/media/4431/L型2.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4506', N'product_images', N'80833', N'https://buy.sakura.com.tw/media/4506/LF3036.png', N'2269')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4534', N'product_images', N'80844', N'https://buy.sakura.com.tw/media/4534/E8890.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4535', N'product_images', N'80844', N'https://buy.sakura.com.tw/media/4535/E8890_1.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4536', N'product_images', N'80844', N'https://buy.sakura.com.tw/media/4536/E8890_2.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4537', N'product_images', N'80844', N'https://buy.sakura.com.tw/media/4537/E8890_3.png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4540', N'RoHS', N'80844', N'https://buy.sakura.com.tw/files/4540/E8890_RoHS.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4606', N'product_images', N'80855', N'https://buy.sakura.com.tw/media/4606/P0553A.png', N'2319')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4608', N'使用手冊', N'80855', N'https://buy.sakura.com.tw/files/4608/P0553A說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4663', N'product_images', N'993', N'https://buy.sakura.com.tw/media/4663/SH2291 3年保固.png', N'2334')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4664', N'product_images', N'930', N'https://buy.sakura.com.tw/media/4664/SH2470A 3年保固.png', N'2335')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4665', N'product_images', N'963', N'https://buy.sakura.com.tw/media/4665/SH2480 3年保固.png', N'2336')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4672', N'product_images', N'1005', N'https://buy.sakura.com.tw/media/4672/E7682_1.png', N'2340')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4690', N'product_images', N'80839', N'https://buy.sakura.com.tw/media/4690/D_3033-800X800px.JPG', N'2346')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4699', N'使用手冊', N'930', N'https://buy.sakura.com.tw/files/4699/SH2470A_2018.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4704', N'product_images', N'929', N'https://buy.sakura.com.tw/media/4704/SH1335.png', N'2353')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4708', N'使用手冊', N'963', N'https://buy.sakura.com.tw/files/4708/SH2480_2018.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4749', N'product_images', N'80893', N'https://buy.sakura.com.tw/media/4749/LFD_6033.png', N'2384')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4755', N'product_images', N'80897', N'https://buy.sakura.com.tw/media/4755/LFD_2022.png', N'2388')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4757', N'product_images', N'80898', N'https://buy.sakura.com.tw/media/4757/LFD_3022.png', N'2390')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4759', N'product_images', N'80899', N'https://buy.sakura.com.tw/media/4759/LFD_6022.png', N'2392')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4767', N'product_images', N'997', N'https://buy.sakura.com.tw/media/4767/SH1338_800x800_官網圖.png', N'2400')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4774', N'product_images', N'80640', N'https://buy.sakura.com.tw/media/4774/DNA2_大器勾勒對稱輪廓_調整大小.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4775', N'product_images', N'80640', N'https://buy.sakura.com.tw/media/4775/DNA3_古典現代完美交融01_調整大小.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4776', N'product_images', N'80640', N'https://buy.sakura.com.tw/media/4776/DNA3_古典現代完美交融02_調整大小.jpg', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4799', N'product_images', N'80905', N'https://buy.sakura.com.tw/media/4799/LFD-0222-800X800px.jpg', N'2411')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4802', N'product_images', N'80896', N'https://buy.sakura.com.tw/media/4802/LFD-0233-800X800px.jpg', N'2414')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4866', N'RoHS', N'1005', N'https://buy.sakura.com.tw/files/4866/E7682_RoHS.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4867', N'RoHS', N'1004', N'https://buy.sakura.com.tw/files/4867/E7782_RoHS.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'4868', N'product_images', N'80434', N'https://buy.sakura.com.tw/media/4868/RA-005 櫻花平濾油網組_1.png', N'2447')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'5888', N'型錄', N'80928', N'https://buy.sakura.com.tw/files/5888/EHI7260BA單張型錄(A4).pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'5890', N'product_images', N'80928', N'https://buy.sakura.com.tw/media/5890/EHI7260BA產品圖.jpg', N'2450')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'5924', N'RoHS', N'921', N'https://buy.sakura.com.tw/files/5924/RoHs聲明書(DR3590XXXXX).pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'5925', N'RoHS', N'939', N'https://buy.sakura.com.tw/files/5925/RoHs聲明書(DR3592XXXXX).pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'5943', N'使用手冊', N'80943', N'https://buy.sakura.com.tw/files/5943/G2721G-S說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'5948', N'product_images', N'80943', N'https://buy.sakura.com.tw/media/5948/G2721G_web.png', N'2466')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'5949', N'型錄', N'80943', N'https://buy.sakura.com.tw/files/5949/Sakura_G2721_DM.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'5982', N'product_images', N'80623', N'https://buy.sakura.com.tw/media/5982/R3262_web.png', N'2474')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'5985', N'使用手冊', N'80623', N'https://buy.sakura.com.tw/files/5985/斜背.深罩.輕巧系列說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'5986', N'型錄', N'80623', N'https://buy.sakura.com.tw/files/5986/R3262_DM.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'5995', N'product_images', N'1022', N'https://buy.sakura.com.tw/media/5995/DH1628_web1.png', N'2484')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'5996', N'product_images', N'1023', N'https://buy.sakura.com.tw/media/5996/DH2460_web.png', N'2485')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'5997', N'使用手冊', N'8', N'https://buy.sakura.com.tw/files/5997/斜背.深罩.輕巧系列.pdf', N'2486')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6001', N'使用手冊', N'893', N'https://buy.sakura.com.tw/files/6001/斜背.深罩.輕巧系列.pdf', N'2490')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6002', N'使用手冊', N'1003', N'https://buy.sakura.com.tw/files/6002/斜背.深罩.輕巧系列.pdf', N'2491')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6003', N'使用手冊', N'80628', N'https://buy.sakura.com.tw/files/6003/斜背.深罩.輕巧系列.pdf', N'2492')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6044', N'RoHS', N'1006', N'https://buy.sakura.com.tw/files/6044/RoHS_Q7596A.pdf', N'2518')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6045', N'RoHS', N'1019', N'https://buy.sakura.com.tw/files/6045/RoHS_Q7693.pdf', N'2519')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6047', N'RoHS', N'1018', N'https://buy.sakura.com.tw/files/6047/RoHS_Q7690.pdf', N'2521')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6050', N'RoHS', N'1010', N'https://buy.sakura.com.tw/files/6050/RoHS_Q7595.pdf', N'2524')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6051', N'RoHS', N'80351', N'https://buy.sakura.com.tw/files/6051/RoHS_Q7592B.pdf', N'2525')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6052', N'product_images', N'158', N'https://buy.sakura.com.tw/media/6052/G252K_web.png', N'2526')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6061', N'product_images', N'80974', N'https://buy.sakura.com.tw/media/6061/R7765_web.png', N'2535')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6128', N'product_images', N'81003', N'https://buy.sakura.com.tw/media/6128/3_BLUM電動抽屜地櫃800x800.jpg', N'2596')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6140', N'product_images', N'80989', N'https://buy.sakura.com.tw/media/6140/26_左右折門吊櫃800x800.jpg', N'2608')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6142', N'product_images', N'80991', N'https://buy.sakura.com.tw/media/6142/29_玻璃門板吊櫃800x800.jpg', N'2610')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6145', N'product_images', N'80994', N'https://buy.sakura.com.tw/media/6145/32_電動上掀吊櫃800x800.jpg', N'2613')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6155', N'product_images', N'81011', N'https://buy.sakura.com.tw/media/6155/52_橫桿掛架黃金地段掛件組800x800.jpg', N'2623')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6159', N'product_images', N'81015', N'https://buy.sakura.com.tw/media/6159/56_隱藏式二摺桌800x800.jpg', N'2627')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6162', N'product_images', N'81018', N'https://buy.sakura.com.tw/media/6162/60_置物層架800x800.jpg', N'2630')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6180', N'使用手冊', N'1014', N'https://buy.sakura.com.tw/files/6180/智能雙炫火說明書  108.7.23.pdf', N'2648')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6181', N'使用手冊', N'80339', N'https://buy.sakura.com.tw/files/6181/智能雙炫火說明書  108.7.23.pdf', N'2649')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6218', N'product_images', N'81024', N'https://buy.sakura.com.tw/media/6218/P0231.png', N'2684')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6335', N'product_images', N'80396', N'https://buy.sakura.com.tw/media/6335/LOFT-潮派廚房-工業風.jpg', N'2785')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6336', N'使用手冊', N'955', N'https://buy.sakura.com.tw/files/6336/SH-123 產品說明書.pdf', N'2786')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6337', N'使用手冊', N'954', N'https://buy.sakura.com.tw/files/6337/SH-125 產品說明書.pdf', N'2787')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6341', N'使用手冊', N'80898', N'https://buy.sakura.com.tw/files/6341/180803-水龍頭電子使用手冊.pdf', N'2791')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6374', N'product_images', N'81036', N'https://buy.sakura.com.tw/media/6374/SE8102 去背圖檔 190729.png', N'2823')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6375', N'使用手冊', N'81036', N'https://buy.sakura.com.tw/files/6375/櫻花熱泵熱水器SE8102_產品使用暨安裝說明書.pdf', N'2824')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6445', N'product_images', N'978', N'https://buy.sakura.com.tw/media/6445/G2633GB.png', N'2851')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6488', N'product_images', N'137', N'https://buy.sakura.com.tw/media/6488/G632KS.png', N'2880')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6489', N'product_images', N'11', N'https://buy.sakura.com.tw/media/6489/G5700KS.png', N'2881')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6494', N'product_images', N'164', N'https://buy.sakura.com.tw/media/6494/G6700KS.png', N'2886')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6533', N'型錄', N'81033', N'https://buy.sakura.com.tw/files/6533/櫻花淨水產品型錄.pdf', N'2924')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6591', N'RoHS', N'80912', N'https://buy.sakura.com.tw/files/6591/櫻花白鐵電熱水器2018.11.12.pdf', N'2976')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6592', N'RoHS', N'80924', N'https://buy.sakura.com.tw/files/6592/櫻花白鐵電熱水器2018.11.12.pdf', N'2977')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6593', N'RoHS', N'80909', N'https://buy.sakura.com.tw/files/6593/櫻花白鐵電熱水器2018.11.12.pdf', N'2978')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6594', N'RoHS', N'80914', N'https://buy.sakura.com.tw/files/6594/櫻花白鐵電熱水器2018.11.12.pdf', N'2979')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6595', N'RoHS', N'81063', N'https://buy.sakura.com.tw/files/6595/櫻花白鐵電熱水器2018.11.12.pdf', N'2980')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6596', N'RoHS', N'80917', N'https://buy.sakura.com.tw/files/6596/櫻花白鐵電熱水器2018.11.12.pdf', N'2982')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6598', N'RoHS', N'80974', N'https://buy.sakura.com.tw/files/6598/R7765S_RoHS.pdf', N'2983')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6605', N'product_images', N'80912', N'https://buy.sakura.com.tw/media/6605/EH2651S6.png', N'2990')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6606', N'product_images', N'80924', N'https://buy.sakura.com.tw/media/6606/EH1851S6.png', N'2991')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6607', N'product_images', N'80909', N'https://buy.sakura.com.tw/media/6607/EH1251S6.png', N'2992')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6608', N'product_images', N'80914', N'https://buy.sakura.com.tw/media/6608/EH1251LS6.png', N'2993')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6609', N'product_images', N'81063', N'https://buy.sakura.com.tw/media/6609/EH0651S6.png', N'2994')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6610', N'product_images', N'80917', N'https://buy.sakura.com.tw/media/6610/EH0651LS6.png', N'2995')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6625', N'product_images', N'924', N'https://buy.sakura.com.tw/media/6625/玻璃嵌入爐G6500KG_S.png', N'3008')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6626', N'使用手冊', N'924', N'https://buy.sakura.com.tw/files/6626/G6500KG使用手冊.pdf', N'3009')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6666', N'RoHS', N'80092', N'https://buy.sakura.com.tw/files/6666/rohs_PLANA SV.pdf', N'3049')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6667', N'使用手冊', N'80092', N'https://buy.sakura.com.tw/files/6667/PLANA SV 說明書(含安裝圖).pdf', N'3050')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6695', N'RoHS', N'80945', N'https://buy.sakura.com.tw/files/6695/TID7040[限用物質含有情況標示].pdf', N'3078')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6698', N'RoHS', N'81083', N'https://buy.sakura.com.tw/files/6698/TID6516 ROHS.pdf', N'3080')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6700', N'RoHS', N'80946', N'https://buy.sakura.com.tw/files/6700/TID3580限用物質表.pdf', N'3082')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6703', N'RoHS', N'81086', N'https://buy.sakura.com.tw/files/6703/rohs_TID3510.pdf', N'3085')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6725', N'使用手冊', N'80080', N'https://buy.sakura.com.tw/files/6725/FDT4007烤箱說明書.pdf', N'3106')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6728', N'RoHS', N'80146', N'https://buy.sakura.com.tw/files/6728/FDT1007A_RoHS.pdf', N'3109')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6742', N'RoHS', N'80083', N'https://buy.sakura.com.tw/files/6742/RoHS_SK1664S.pdf', N'3123')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6743', N'使用手冊', N'80083', N'https://buy.sakura.com.tw/files/6743/SK1664S說明書.pdf', N'3124')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6768', N'RoHS', N'80141', N'https://buy.sakura.com.tw/files/6768/MW7711_RoHS.pdf', N'3148')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6771', N'RoHS', N'80142', N'https://buy.sakura.com.tw/files/6771/MW7709_RoHS.pdf', N'3151')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6803', N'product_images', N'81088', N'https://buy.sakura.com.tw/media/6803/TID2310.png', N'3182')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6805', N'RoHS', N'81088', N'https://buy.sakura.com.tw/files/6805/TID2310[限用物質含有情況標示聲明書].pdf', N'3184')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6806', N'product_images', N'81089', N'https://buy.sakura.com.tw/media/6806/TID2310.png', N'3185')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6808', N'RoHS', N'81089', N'https://buy.sakura.com.tw/files/6808/TID2310[限用物質含有情況標示聲明書].pdf', N'3187')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6891', N'product_images', N'80794', N'https://buy.sakura.com.tw/media/6891/R7600XL_正.png', N'3250')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6892', N'product_images', N'80794', N'https://buy.sakura.com.tw/media/6892/R7600XL_斜_R.png', N'3251')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6893', N'product_images', N'80794', N'https://buy.sakura.com.tw/media/6893/R7600_web2.png', N'3252')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6903', N'product_images', N'80146', N'https://buy.sakura.com.tw/media/6903/FDT1007A.png', N'3261')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6904', N'product_images', N'80080', N'https://buy.sakura.com.tw/media/6904/FDT4007.png', N'3262')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6906', N'product_images', N'80134', N'https://buy.sakura.com.tw/media/6906/JG110B.png', N'3264')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6907', N'product_images', N'80142', N'https://buy.sakura.com.tw/media/6907/MW7709.png', N'3265')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6908', N'product_images', N'80141', N'https://buy.sakura.com.tw/media/6908/MW7711.png', N'3266')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6909', N'product_images', N'80092', N'https://buy.sakura.com.tw/media/6909/PLANA_SV.png', N'3267')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6920', N'product_images', N'80946', N'https://buy.sakura.com.tw/media/6920/TID3580.png', N'3278')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6921', N'product_images', N'81083', N'https://buy.sakura.com.tw/media/6921/TID6516.png', N'3279')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6922', N'product_images', N'80945', N'https://buy.sakura.com.tw/media/6922/TID7040.png', N'3280')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6948', N'product_images', N'81116', N'https://buy.sakura.com.tw/media/6948/細鋁框玻璃門.jpg', N'3301')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6949', N'product_images', N'81117', N'https://buy.sakura.com.tw/media/6949/上掀桌板.jpg', N'3302')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6950', N'product_images', N'81118', N'https://buy.sakura.com.tw/media/6950/SAKURA靜音緩衝抽屜.jpg', N'3303')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6951', N'product_images', N'81119', N'https://buy.sakura.com.tw/media/6951/櫻花-邊櫃系列官網圖0423_工作區域 1 複本 6.jpg', N'3304')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6952', N'product_images', N'81120', N'https://buy.sakura.com.tw/media/6952/延伸桌板.jpg', N'3305')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6953', N'product_images', N'81121', N'https://buy.sakura.com.tw/media/6953/鍋具吊掛架.jpg', N'3306')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'6995', N'product_images', N'81125', N'https://buy.sakura.com.tw/media/6995/EOB8857AAX.png', N'3345')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7005', N'product_images', N'81128', N'https://buy.sakura.com.tw/media/7005/EWW114wifi洗脫烘.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7006', N'product_images', N'81128', N'https://buy.sakura.com.tw/media/7006/EWW1141AEWA-2 ENG copy.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7012', N'product_images', N'81129', N'https://buy.sakura.com.tw/media/7012/細鋁框玻璃門.jpg', N'3353')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7013', N'product_images', N'81130', N'https://buy.sakura.com.tw/media/7013/上掀桌板.jpg', N'3354')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7014', N'product_images', N'81139', N'https://buy.sakura.com.tw/media/7014/SAKURA靜音緩衝抽屜.jpg', N'3355')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7015', N'product_images', N'81140', N'https://buy.sakura.com.tw/media/7015/造型開放櫃 犀利鉤掛件.jpg', N'3356')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7021', N'product_images', N'81145', N'https://buy.sakura.com.tw/media/7021/造型開放櫃 犀利鉤掛件.jpg', N'3362')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7024', N'product_images', N'81146', N'https://buy.sakura.com.tw/media/7024/開放式電器櫃 SAKURA靜音緩衝抽屜(120cm).jpg', N'3365')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7025', N'product_images', N'81147', N'https://buy.sakura.com.tw/media/7025/行動餐車.jpg', N'3366')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7026', N'product_images', N'81141', N'https://buy.sakura.com.tw/media/7026/開放式電器櫃 SAKURA靜音緩衝抽屜 (90cm).jpg', N'3367')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7027', N'product_images', N'81144', N'https://buy.sakura.com.tw/media/7027/平板抽 選配IH感應爐.jpg', N'3368')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7033', N'product_images', N'81148', N'https://buy.sakura.com.tw/media/7033/2.jpg', N'3373')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7034', N'product_images', N'81149', N'https://buy.sakura.com.tw/media/7034/1.jpg', N'3374')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7035', N'product_images', N'81150', N'https://buy.sakura.com.tw/media/7035/3.jpg', N'3375')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7059', N'型錄', N'81161', N'https://buy.sakura.com.tw/media/7059/Electrolux單張型錄-感應爐.pdf', N'3389')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7067', N'product_images', N'81164', N'https://buy.sakura.com.tw/media/7067/產品圖_EGT9239CK玻璃三口瓦斯爐.jpg', N'3397')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7068', N'說明書', N'81164', N'https://buy.sakura.com.tw/media/7068/EGT7828CK-EGT9239CK說明書(無圖框).pdf', N'3398')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7069', N'型錄', N'81164', N'https://buy.sakura.com.tw/media/7069/Electrolux單張型錄-瓦斯爐.pdf', N'3399')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7071', N'product_images', N'81165', N'https://buy.sakura.com.tw/media/7071/產品圖_EGT7828CK玻璃雙口瓦斯爐.jpg', N'3401')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7073', N'型錄', N'81165', N'https://buy.sakura.com.tw/media/7073/Electrolux單張型錄-瓦斯爐.pdf', N'3403')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7198', N'product_images', N'80402', N'https://buy.sakura.com.tw/media/7198/SKL668NW-01.jpg', N'3512')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7204', N'使用手冊', N'81188', N'https://buy.sakura.com.tw/media/7204/R3608 instruction.pdf', N'3516')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7206', N'使用手冊', N'81142', N'https://buy.sakura.com.tw/files/7206/2005_P0780 instruction.pdf', N'3518')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7207', N'product_images', N'81188', N'https://buy.sakura.com.tw/media/7207/R3680_800.png', N'3519')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7223', N'product_images', N'81167', N'https://buy.sakura.com.tw/media/7223/SKL006B.jpg', N'3534')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7224', N'product_images', N'81168', N'https://buy.sakura.com.tw/media/7224/SKL303-01.jpg', N'3535')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7225', N'product_images', N'81180', N'https://buy.sakura.com.tw/media/7225/SKL505AF-01-01.jpg', N'3536')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7227', N'product_images', N'81181', N'https://buy.sakura.com.tw/media/7227/SKL301F-01-01.jpg', N'3537')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7229', N'product_images', N'81169', N'https://buy.sakura.com.tw/media/7229/SKL104F-01.jpg', N'3539')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7230', N'product_images', N'81183', N'https://buy.sakura.com.tw/media/7230/SKL602-01.png', N'3540')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7231', N'product_images', N'81184', N'https://buy.sakura.com.tw/media/7231/SKL605-01-01.jpg', N'3541')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7232', N'product_images', N'81175', N'https://buy.sakura.com.tw/media/7232/SKL166-01.jpg', N'3542')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7233', N'product_images', N'81176', N'https://buy.sakura.com.tw/media/7233/SKL101BA-01.jpg', N'3543')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7332', N'型錄', N'81199', N'https://buy.sakura.com.tw/files/7332/SN1282單張型錄.jpg', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7334', N'使用手冊', N'1006', N'https://buy.sakura.com.tw/files/7334/Q7596AML_instruction.pdf', N'3624')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7343', N'使用手冊', N'939', N'https://buy.sakura.com.tw/files/7343/200811_R_instruction.pdf', N'3629')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7344', N'使用手冊', N'921', N'https://buy.sakura.com.tw/files/7344/200811_R_instruction.pdf', N'3630')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7345', N'使用手冊', N'1013', N'https://buy.sakura.com.tw/files/7345/200811_R_instruction.pdf', N'3631')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7346', N'使用手冊', N'1012', N'https://buy.sakura.com.tw/files/7346/200811_R_instruction.pdf', N'3632')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7394', N'product_images', N'81207', N'https://buy.sakura.com.tw/media/7394/SE0305&SE0505.png', N'3671')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7395', N'使用手冊', N'81207', N'https://buy.sakura.com.tw/media/7395/SE0305.0505 instruction.pdf', N'3672')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7399', N'型錄', N'81207', N'https://buy.sakura.com.tw/files/7399/SE 0305.0505 DM.jpg', N'3676')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7400', N'product_images', N'81208', N'https://buy.sakura.com.tw/media/7400/SE0305&SE0505.png', N'3677')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7401', N'使用手冊', N'81208', N'https://buy.sakura.com.tw/media/7401/SE0305.0505 instruction.pdf', N'3678')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7402', N'型錄', N'81208', N'https://buy.sakura.com.tw/files/7402/SE 0305.0505 DM.jpg', N'3679')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7411', N'RoHS', N'81199', N'https://buy.sakura.com.tw/files/7411/SN1282.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7514', N'使用手冊', N'946', N'https://buy.sakura.com.tw/files/7514/R905&R605_instruction.pdf', N'3786')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7515', N'型錄', N'81036', N'https://buy.sakura.com.tw/files/7515/sakura solar water heaters_DM.jpg', N'3787')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7610', N'型錄', N'80945', N'https://buy.sakura.com.tw/files/7610/SVAGO_2019 感應爐系列雙面型錄201006_compressed.pdf', N'3077')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7611', N'型錄', N'80946', N'https://buy.sakura.com.tw/files/7611/SVAGO_2019 感應爐系列雙面型錄201006_compressed.pdf', N'3874')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7612', N'型錄', N'81083', N'https://buy.sakura.com.tw/files/7612/SVAGO_2019 感應爐系列雙面型錄201006_compressed.pdf', N'3875')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7613', N'型錄', N'81086', N'https://buy.sakura.com.tw/files/7613/SVAGO_2019 感應爐系列雙面型錄201006_compressed.pdf', N'3876')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7614', N'型錄', N'81088', N'https://buy.sakura.com.tw/files/7614/SVAGO_2019 感應爐系列雙面型錄201006_compressed.pdf', N'3877')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7615', N'型錄', N'81089', N'https://buy.sakura.com.tw/files/7615/SVAGO_2019 感應爐系列雙面型錄201006_compressed.pdf', N'3878')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7625', N'RoHS', N'81282', N'https://buy.sakura.com.tw/files/7625/VR7150SXL_限用物質含有情況標示聲明書.pdf', N'3888')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7628', N'型錄', N'81283', N'https://buy.sakura.com.tw/media/7628/svago_SWD596A_A4 DM_修3.pdf', N'3891')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7631', N'RoHS', N'81283', N'https://buy.sakura.com.tw/files/7631/SWD596A ROHS標示.pdf', N'3894')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7645', N'使用手冊', N'81199', N'https://buy.sakura.com.tw/files/7645/SN1282說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7647', N'使用手冊', N'80146', N'https://buy.sakura.com.tw/files/7647/FDT1007A說明書.pdf', N'3905')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7671', N'使用手冊', N'81283', N'https://buy.sakura.com.tw/files/7671/SWD596A洗脫烘說明書201029.pdf', N'3928')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7672', N'使用手冊', N'81281', N'https://buy.sakura.com.tw/files/7672/SvagoVR7150排油煙機說明書201029.pdf', N'3929')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7673', N'使用手冊', N'81282', N'https://buy.sakura.com.tw/files/7673/SvagoVR7150排油煙機說明書201029.pdf', N'3930')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7674', N'product_images', N'81284', N'https://buy.sakura.com.tw/media/7674/DR7796_800.png', N'3931')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7686', N'使用手冊', N'932', N'https://buy.sakura.com.tw/files/7686/SH2690_instruction_2011.pdf', N'3943')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7687', N'使用手冊', N'993', N'https://buy.sakura.com.tw/files/7687/SH2291_instruction_2011.pdf', N'3944')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7692', N'product_images', N'81287', N'https://buy.sakura.com.tw/media/7692/F0190-正面-800x800.png', N'3949')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7693', N'product_images', N'81288', N'https://buy.sakura.com.tw/media/7693/EH2630S6.png', N'3950')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7695', N'使用手冊', N'81288', N'https://buy.sakura.com.tw/files/7695/EHXX30_instruction_2011.pdf', N'3952')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7717', N'使用手冊', N'80974', N'https://buy.sakura.com.tw/files/7717/R7765_instruction_2011.pdf', N'3974')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7727', N'型錄', N'955', N'https://buy.sakura.com.tw/files/7727/SH-123 _A4 DM_202012.png', N'3984')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7728', N'型錄', N'954', N'https://buy.sakura.com.tw/files/7728/SH-125_A4 DM_202012.png', N'3985')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7738', N'使用手冊', N'81284', N'https://buy.sakura.com.tw/files/7738/DR7796SXL_instruction_202101.pdf', N'3995')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7740', N'product_images', N'975', N'https://buy.sakura.com.tw/media/7740/GH1035-800x800px.png', N'3997')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7742', N'product_images', N'973', N'https://buy.sakura.com.tw/media/7742/GH1021-800x800px.png', N'3998')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7743', N'product_images', N'999', N'https://buy.sakura.com.tw/media/7743/GH1039-800x800px.png', N'3999')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7744', N'product_images', N'80365', N'https://buy.sakura.com.tw/media/7744/GH1005-800x800px.png', N'4000')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7746', N'product_images', N'976', N'https://buy.sakura.com.tw/media/7746/GH1235-800x800px.png', N'4002')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7747', N'product_images', N'974', N'https://buy.sakura.com.tw/media/7747/GH1221-800x800px.png', N'4003')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7753', N'product_images', N'159', N'https://buy.sakura.com.tw/media/7753/G251KE.png', N'4008')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7755', N'使用手冊', N'81303', N'https://buy.sakura.com.tw/files/7755/EH_instruction.pdf', N'4010')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7756', N'使用手冊', N'81302', N'https://buy.sakura.com.tw/files/7756/EH_instruction.pdf', N'4011')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7758', N'RoHS', N'81302', N'https://buy.sakura.com.tw/files/7758/RoHS_EH_2020.11.02.pdf', N'4013')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7759', N'RoHS', N'81303', N'https://buy.sakura.com.tw/files/7759/RoHS_EH_2020.11.02.pdf', N'4014')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7760', N'RoHS', N'81304', N'https://buy.sakura.com.tw/files/7760/RoHS_EH_2020.11.02.pdf', N'4015')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7761', N'使用手冊', N'81305', N'https://buy.sakura.com.tw/files/7761/EH_instruction.pdf', N'4016')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7762', N'RoHS', N'81305', N'https://buy.sakura.com.tw/files/7762/RoHS_EH_2020.11.02.pdf', N'4017')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7763', N'使用手冊', N'81306', N'https://buy.sakura.com.tw/files/7763/EH_instruction.pdf', N'4018')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7764', N'RoHS', N'81306', N'https://buy.sakura.com.tw/files/7764/RoHS_EH_2020.11.02.pdf', N'4019')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7765', N'使用手冊', N'81307', N'https://buy.sakura.com.tw/files/7765/EH_instruction.pdf', N'4020')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7766', N'RoHS', N'81307', N'https://buy.sakura.com.tw/files/7766/RoHS_EH_2020.11.02.pdf', N'4021')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7767', N'使用手冊', N'81308', N'https://buy.sakura.com.tw/files/7767/EH_instruction.pdf', N'4022')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7768', N'RoHS', N'81308', N'https://buy.sakura.com.tw/files/7768/RoHS_EH_2020.11.02.pdf', N'4023')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7769', N'product_images', N'81302', N'https://buy.sakura.com.tw/media/7769/EH3010S6.png', N'4024')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7770', N'product_images', N'81303', N'https://buy.sakura.com.tw/media/7770/EH2010S4.png', N'4025')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7774', N'使用手冊', N'81309', N'https://buy.sakura.com.tw/files/7774/R3750B_instruction.pdf', N'4029')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7775', N'product_images', N'81304', N'https://buy.sakura.com.tw/media/7775/EH5010S6.png', N'4030')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7776', N'product_images', N'81305', N'https://buy.sakura.com.tw/media/7776/EH1210S6.png', N'4031')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7777', N'product_images', N'81306', N'https://buy.sakura.com.tw/media/7777/EH1210LS4.png', N'4032')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7778', N'product_images', N'81307', N'https://buy.sakura.com.tw/media/7778/EH0810S6.png', N'4033')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7779', N'product_images', N'81308', N'https://buy.sakura.com.tw/media/7779/EH0810LS6.png', N'4034')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7780', N'使用手冊', N'926', N'https://buy.sakura.com.tw/files/7780/SH-186_instruction.pdf', N'4035')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7782', N'product_images', N'81309', N'https://buy.sakura.com.tw/media/7782/IMG_3209-1_800.png', N'4037')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7783', N'product_images', N'81309', N'https://buy.sakura.com.tw/media/7783/IMG_3235-1_800.png', N'4038')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7799', N'使用手冊', N'137', N'https://buy.sakura.com.tw/files/7799/台嵌爐說明書(官網下載).pdf', N'4051')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7800', N'使用手冊', N'892', N'https://buy.sakura.com.tw/files/7800/台嵌爐說明書(官網下載).pdf', N'4052')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7802', N'使用手冊', N'80625', N'https://buy.sakura.com.tw/files/7802/台嵌爐說明書(官網下載).pdf', N'4054')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7803', N'使用手冊', N'11', N'https://buy.sakura.com.tw/files/7803/台嵌爐說明書(官網下載).pdf', N'4055')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7804', N'使用手冊', N'940', N'https://buy.sakura.com.tw/files/7804/台嵌爐說明書(空燒機型)(官網下載).pdf', N'4056')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7805', N'使用手冊', N'952', N'https://buy.sakura.com.tw/files/7805/台嵌爐說明書(官網下載).pdf', N'4057')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7807', N'使用手冊', N'80627', N'https://buy.sakura.com.tw/files/7807/台嵌爐說明書(官網下載).pdf', N'4059')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7808', N'使用手冊', N'164', N'https://buy.sakura.com.tw/files/7808/台嵌爐說明書(官網下載).pdf', N'4060')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7809', N'使用手冊', N'941', N'https://buy.sakura.com.tw/files/7809/台嵌爐說明書(空燒機型)(官網下載).pdf', N'4061')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7810', N'使用手冊', N'953', N'https://buy.sakura.com.tw/files/7810/台嵌爐說明書(官網下載).pdf', N'4062')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7811', N'使用手冊', N'1027', N'https://buy.sakura.com.tw/files/7811/檯面爐A3說明書(官網下載).pdf', N'4063')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7812', N'使用手冊', N'1028', N'https://buy.sakura.com.tw/files/7812/檯面爐A3說明書(官網下載).pdf', N'4064')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7813', N'使用手冊', N'982', N'https://buy.sakura.com.tw/files/7813/檯面爐A3說明書(官網下載).pdf', N'4065')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7816', N'使用手冊', N'981', N'https://buy.sakura.com.tw/files/7816/檯面爐A3說明書(官網下載).pdf', N'4068')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7817', N'使用手冊', N'978', N'https://buy.sakura.com.tw/files/7817/檯面爐A3說明書(官網下載).pdf', N'4069')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7818', N'使用手冊', N'979', N'https://buy.sakura.com.tw/files/7818/檯面爐A3說明書(官網下載).pdf', N'4070')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7819', N'使用手冊', N'149', N'https://buy.sakura.com.tw/files/7819/檯面爐A3說明書(官網下載).pdf', N'4071')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7820', N'使用手冊', N'147', N'https://buy.sakura.com.tw/files/7820/檯面爐A3說明書(官網下載).pdf', N'4072')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7821', N'使用手冊', N'148', N'https://buy.sakura.com.tw/files/7821/檯面爐A3說明書(官網下載).pdf', N'4073')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7822', N'使用手冊', N'158', N'https://buy.sakura.com.tw/files/7822/檯面爐A3說明書(官網下載).pdf', N'4074')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7823', N'使用手冊', N'159', N'https://buy.sakura.com.tw/files/7823/檯面爐A3說明書(官網下載).pdf', N'4075')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7824', N'使用手冊', N'944', N'https://buy.sakura.com.tw/files/7824/檯面爐A3說明書(官網下載).pdf', N'4076')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7827', N'說明書', N'70015', N'https://buy.sakura.com.tw/files/7827/EHH3320NVK說明書.pdf', N'4079')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7828', N'說明書', N'70030', N'https://buy.sakura.com.tw/files/7828/EOB3400AAX說明書.pdf', N'4080')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7830', N'說明書', N'81125', N'https://buy.sakura.com.tw/files/7830/EOB8857AAX說明書.pdf', N'4082')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7838', N'說明書', N'70031', N'https://buy.sakura.com.tw/files/7838/EVY8740BAX說明書.pdf', N'4090')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7839', N'說明書', N'70027', N'https://buy.sakura.com.tw/files/7839/EVY9747AAX說明書.pdf', N'4091')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7840', N'說明書', N'81165', N'https://buy.sakura.com.tw/files/7840/EGT7828CK說明書.pdf', N'4092')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7841', N'說明書', N'81161', N'https://buy.sakura.com.tw/files/7841/EIT913說明書.pdf', N'4093')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7846', N'說明書', N'81128', N'https://buy.sakura.com.tw/files/7846/EWW1141AEWA說明書.pdf', N'4098')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7851', N'說明書', N'80928', N'https://buy.sakura.com.tw/files/7851/EHI7260BA說明書.pdf', N'4103')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7877', N'product_images', N'81361', N'https://buy.sakura.com.tw/media/7877/EG2231G_800.png', N'4127')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7878', N'型錄', N'81361', N'https://buy.sakura.com.tw/media/7878/EG2231&2331_DM.pdf', N'4128')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7880', N'RoHS', N'81361', N'https://buy.sakura.com.tw/files/7880/EG2231G 感應爐 RoHS.pdf', N'4130')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7881', N'product_images', N'81362', N'https://buy.sakura.com.tw/media/7881/EG2331G_800.png', N'4131')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7882', N'型錄', N'81362', N'https://buy.sakura.com.tw/files/7882/EG2231&2331_DM.pdf', N'4132')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7884', N'RoHS', N'81362', N'https://buy.sakura.com.tw/files/7884/EG2331G感應爐 RoHS.pdf', N'4134')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7887', N'RoHS', N'81288', N'https://buy.sakura.com.tw/files/7887/EH2630_Rohs.pdf', N'4135')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7906', N'使用手冊', N'81373', N'https://buy.sakura.com.tw/media/7906/P0782說明書-SQC雙管共用.pdf', N'4154')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7929', N'product_images', N'81374', N'https://buy.sakura.com.tw/media/7929/7300.png', N'4176')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7930', N'使用手冊', N'81374', N'https://buy.sakura.com.tw/media/7930/KECA7300L中文說明書.pdf', N'4177')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7934', N'使用手冊', N'81375', N'https://buy.sakura.com.tw/media/7934/KEZB9300L中文說明書.pdf', N'4181')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7937', N'使用手冊', N'81376', N'https://buy.sakura.com.tw/media/7937/KEZB9300L中文說明書.pdf', N'4184')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7939', N'product_images', N'81377', N'https://buy.sakura.com.tw/media/7939/48300.png', N'4186')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7940', N'使用手冊', N'81377', N'https://buy.sakura.com.tw/files/7940/EEM48300IX中文說明書.pdf', N'4187')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7944', N'product_images', N'81379', N'https://buy.sakura.com.tw/media/7944/EWW1142官網圖.jpg', N'4191')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7947', N'型錄', N'81379', N'https://buy.sakura.com.tw/files/7947/2021新品洗衣機型錄.pdf', N'4194')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7958', N'RoHS', N'81384', N'https://buy.sakura.com.tw/media/7958/VE6860&VE6660烤箱RoHS 檔案.pdf', N'4205')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7964', N'product_images', N'81384', N'https://buy.sakura.com.tw/media/7964/圖片2.jpg', N'4207')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7965', N'product_images', N'81385', N'https://buy.sakura.com.tw/media/7965/圖片3.jpg', N'4208')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7967', N'RoHS', N'81385', N'https://buy.sakura.com.tw/media/7967/VE6860&VE6660烤箱RoHS 檔案.pdf', N'4210')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7968', N'使用手冊', N'81385', N'https://buy.sakura.com.tw/media/7968/烤箱(VE6660&VE6860)說明書.pdf', N'4211')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7975', N'product_images', N'81283', N'https://buy.sakura.com.tw/media/7975/FotoJet (7).jpg', N'4216')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7978', N'product_images', N'81387', N'https://buy.sakura.com.tw/media/7978/P0121_800.png', N'4219')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'7980', N'使用手冊', N'81387', N'https://buy.sakura.com.tw/files/7980/p0121.pdf', N'4220')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8036', N'product_images', N'81376', N'https://buy.sakura.com.tw/media/8036/7200.png', N'4276')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8041', N'product_images', N'81421', N'https://buy.sakura.com.tw/media/8041/R7722B.png', N'4281')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8048', N'product_images', N'81422', N'https://buy.sakura.com.tw/media/8048/DR7786BSXL_800.png', N'4288')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8069', N'product_images', N'81430', N'https://buy.sakura.com.tw/media/8069/F0110-適用P0121.png', N'4309')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8070', N'product_images', N'81431', N'https://buy.sakura.com.tw/media/8070/F0130-適用P0121.png', N'4310')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8071', N'product_images', N'81432', N'https://buy.sakura.com.tw/media/8071/F0180-適用P0121.png', N'4311')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8072', N'product_images', N'81445', N'https://buy.sakura.com.tw/media/8072/F0150-適用P0121.png', N'4312')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8083', N'product_images', N'98', N'https://buy.sakura.com.tw/media/8083/0119.png', N'4320')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8084', N'product_images', N'112', N'https://buy.sakura.com.tw/media/8084/0128.png', N'4321')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8085', N'product_images', N'114', N'https://buy.sakura.com.tw/media/8085/0127_P.png', N'4322')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8086', N'product_images', N'95', N'https://buy.sakura.com.tw/media/8086/C65-0122_P.png', N'4323')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8087', N'product_images', N'94', N'https://buy.sakura.com.tw/media/8087/C65-0118_P.png', N'4324')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8093', N'product_images', N'81373', N'https://buy.sakura.com.tw/media/8093/P0782.png', N'4330')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8094', N'product_images', N'81142', N'https://buy.sakura.com.tw/media/8094/P0780.png', N'4331')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8097', N'product_images', N'81310', N'https://buy.sakura.com.tw/media/8097/P0672C.png', N'4334')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8100', N'product_images', N'81481', N'https://buy.sakura.com.tw/media/8100/F0232-適用P0782.png', N'4337')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8103', N'product_images', N'81034', N'https://buy.sakura.com.tw/media/8103/F0211適用P0680.png', N'4340')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8104', N'product_images', N'81031', N'https://buy.sakura.com.tw/media/8104/F0182適用P0231.png', N'4341')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8130', N'RoHS', N'81491', N'https://buy.sakura.com.tw/files/8130/VE8966 RoHS.pdf', N'4364')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8142', N'product_images', N'81497', N'https://buy.sakura.com.tw/media/8142/A49A5340-官網-800px.png', N'4374')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8143', N'product_images', N'81497', N'https://buy.sakura.com.tw/media/8143/A49A4255_2-800.png', N'4375')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8145', N'使用手冊', N'81497', N'https://buy.sakura.com.tw/files/8145/檯面爐A3說明書(官網下載).pdf', N'4377')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8153', N'RoHS', N'81500', N'https://buy.sakura.com.tw/files/8153/VE7750洗碗機 RoHS檔案 .pdf', N'4385')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8157', N'product_images', N'81491', N'https://buy.sakura.com.tw/media/8157/VE8966_官網-01.jpg', N'4388')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8159', N'product_images', N'81199', N'https://buy.sakura.com.tw/media/8159/SN1282_官網-01.jpg', N'4390')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8160', N'product_images', N'80083', N'https://buy.sakura.com.tw/media/8160/SK1664S_官網圖-01.jpg', N'4391')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8164', N'product_images', N'81544', N'https://buy.sakura.com.tw/media/8164/VE7650_官網用-02.png', N'4395')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8166', N'RoHS', N'81544', N'https://buy.sakura.com.tw/files/8166/VE7650洗碗機 RoHS檔案.pdf', N'4397')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8168', N'product_images', N'81545', N'https://buy.sakura.com.tw/media/8168/EG2250.png', N'4398')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8176', N'型錄', N'81545', N'https://buy.sakura.com.tw/files/8176/櫻花_高階IH爐_A4三頁ＤＭ_官網用O.pdf', N'4406')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8179', N'RoHS', N'81546', N'https://buy.sakura.com.tw/files/8179/EG2350G感應爐 RoHS.pdf', N'4409')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8181', N'RoHS', N'81545', N'https://buy.sakura.com.tw/files/8181/EG2250G_RoHS.pdf', N'4410')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8188', N'product_images', N'81547', N'https://buy.sakura.com.tw/media/8188/Q7650_website.png', N'4417')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8189', N'使用手冊', N'81304', N'https://buy.sakura.com.tw/files/8189/HBBGA076-L2X1.pdf', N'4418')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8190', N'product_images', N'81548', N'https://buy.sakura.com.tw/media/8190/VE8960_官網-01.jpg', N'4419')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8197', N'RoHS', N'81548', N'https://buy.sakura.com.tw/files/8197/VE8960 RoHS.pdf', N'4426')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8209', N'product_images', N'81550', N'https://buy.sakura.com.tw/media/8209/SF850A-01 (去背)800X800.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8216', N'product_images', N'81161', N'https://buy.sakura.com.tw/media/8216/EIT913導購系統上線圖_500x500px-01.jpg', N'4436')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8220', N'product_images', N'81551', N'https://buy.sakura.com.tw/media/8220/SF550A (去背)1200X1200.png', N'4440')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8228', N'product_images', N'81375', N'https://buy.sakura.com.tw/media/8228/9300導購系統上線圖_500x500px-01.jpg', N'4448')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8229', N'product_images', N'81128', N'https://buy.sakura.com.tw/media/8229/1141導購系統上線圖_500x500px-01.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8234', N'使用手冊', N'81554', N'https://buy.sakura.com.tw/files/8234/SvagoVR7151排油煙機說明書201029.pdf', N'4453')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8235', N'RoHS', N'81554', N'https://buy.sakura.com.tw/files/8235/VR7151SXL_限用物質含有情況標示聲明書.pdf', N'4454')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8242', N'RoHS', N'81582', N'https://buy.sakura.com.tw/files/8242/標準e省電-Rohas櫻花樣張及其標示.pdf', N'4459')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8244', N'RoHS', N'81584', N'https://buy.sakura.com.tw/files/8244/標準e省電-Rohas櫻花樣張及其標示.pdf', N'4461')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8247', N'使用手冊', N'81586', N'https://buy.sakura.com.tw/files/8247/流線系列說明書.pdf', N'4464')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8248', N'product_images', N'81586', N'https://buy.sakura.com.tw/media/8248/DR3882B_800x800.png', N'4465')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8249', N'product_images', N'81587', N'https://buy.sakura.com.tw/media/8249/DR3880B_800x800.png', N'4466')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8250', N'使用手冊', N'81587', N'https://buy.sakura.com.tw/media/8250/流線系列說明書.pdf', N'4467')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8254', N'product_images', N'81588', N'https://buy.sakura.com.tw/media/8254/DR7790B_800x800.png', N'4471')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8269', N'product_images', N'81591', N'https://buy.sakura.com.tw/media/8269/FotoJet (1).png', N'4486')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8270', N'使用手冊', N'81591', N'https://buy.sakura.com.tw/media/8270/KOAAS31X_說明書20210825.pdf', N'4487')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8284', N'product_images', N'81596', N'https://buy.sakura.com.tw/media/8284/EG2120GB_web.png', N'4498')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8288', N'使用手冊', N'80912', N'https://buy.sakura.com.tw/files/8288/EH白鐵系列說明書Final.pdf', N'4501')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8289', N'使用手冊', N'80924', N'https://buy.sakura.com.tw/files/8289/EH白鐵系列說明書Final.pdf', N'4502')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8290', N'使用手冊', N'80909', N'https://buy.sakura.com.tw/files/8290/EH白鐵系列說明書Final.pdf', N'4503')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8291', N'使用手冊', N'80914', N'https://buy.sakura.com.tw/files/8291/EH白鐵系列說明書Final.pdf', N'4504')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8294', N'RoHS', N'81596', N'https://buy.sakura.com.tw/files/8294/EG2120GB[限用物質含有情況標示聲明書].pdf', N'4507')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8295', N'型錄', N'81596', N'https://buy.sakura.com.tw/files/8295/2019 EG2120GB_for web.pdf', N'4508')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8360', N'product_images', N'81611', N'https://buy.sakura.com.tw/media/8360/F1191-適用P0121.png', N'4567')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8361', N'product_images', N'81612', N'https://buy.sakura.com.tw/media/8361/F1192-適用P0121.png', N'4568')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8376', N'RoHS', N'81615', N'https://buy.sakura.com.tw/media/8376/KODDP71XA-ROHS.pdf', N'4583')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8377', N'說明書', N'81615', N'https://buy.sakura.com.tw/media/8377/KODDP71XA說明書20210825.pdf', N'4584')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8379', N'型錄', N'81615', N'https://buy.sakura.com.tw/files/8379/2021年新品烤箱型錄電子檔.pdf', N'4586')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8381', N'RoHS', N'81616', N'https://buy.sakura.com.tw/media/8381/KOMGH60TXA-ROHS.pdf', N'4588')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8382', N'說明書', N'81616', N'https://buy.sakura.com.tw/media/8382/KOMGH60TXA說明書20210825.pdf', N'4589')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8385', N'RoHS', N'81618', N'https://buy.sakura.com.tw/files/8385/標準e省電-Rohas櫻花樣張及其標示.pdf', N'4592')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8386', N'型錄', N'81618', N'https://buy.sakura.com.tw/files/8386/e省電系列型錄.pdf', N'4593')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8388', N'型錄', N'81619', N'https://buy.sakura.com.tw/files/8388/e省電系列型錄.pdf', N'4595')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8389', N'RoHS', N'81619', N'https://buy.sakura.com.tw/files/8389/標準e省電-Rohas櫻花樣張及其標示.pdf', N'4596')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8392', N'型錄', N'81582', N'https://buy.sakura.com.tw/files/8392/e省電系列型錄.pdf', N'4599')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8398', N'product_images', N'81620', N'https://buy.sakura.com.tw/media/8398/JG45B.jpg', N'4604')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8399', N'使用手冊', N'81620', N'https://buy.sakura.com.tw/media/8399/JG45B說明書.pdf', N'4605')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8417', N'product_images', N'81582', N'https://buy.sakura.com.tw/media/8417/EH1210TS4_TS6+面板-800x800px.png', N'4623')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8418', N'product_images', N'81584', N'https://buy.sakura.com.tw/media/8418/EH1210LTS4+面板-800x800px.png', N'4624')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8419', N'product_images', N'81619', N'https://buy.sakura.com.tw/media/8419/EH2010TS4+面板-800x800px.png', N'4625')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8420', N'product_images', N'81618', N'https://buy.sakura.com.tw/media/8420/EH3010TS6_4+面板-800x800px.png', N'4626')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8422', N'product_images', N'81622', N'https://buy.sakura.com.tw/media/8422/9300導購系統上線圖_500x500px-01.jpg', N'4628')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8424', N'說明書', N'81622', N'https://buy.sakura.com.tw/files/8424/EEZB9410L 911434750-TW.pdf', N'4630')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8425', N'RoHS', N'81622', N'https://buy.sakura.com.tw/files/8425/rohs-declaration-EEEM9410L.pdf', N'4631')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8426', N'型錄', N'81622', N'https://buy.sakura.com.tw/files/8426/Care_DishWash_sakura_220+110V_更新版_compressed.pdf', N'4632')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8427', N'product_images', N'81623', N'https://buy.sakura.com.tw/media/8427/7200.png', N'4633')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8429', N'RoHS', N'81623', N'https://buy.sakura.com.tw/files/8429/rohs-declaration-EESB7310L.pdf', N'4635')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8430', N'說明書', N'81623', N'https://buy.sakura.com.tw/files/8430/EESB7310L 911434751-TW.pdf', N'4636')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8432', N'product_images', N'81624', N'https://buy.sakura.com.tw/media/8432/FotoJet.png', N'4638')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8433', N'RoHS', N'81624', N'https://buy.sakura.com.tw/media/8433/07-01--kvbas21wxROHS.pdf', N'4639')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8434', N'說明書', N'81624', N'https://buy.sakura.com.tw/media/8434/KVBAS21WX說明書20210825.pdf', N'4640')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8448', N'型錄', N'81624', N'https://buy.sakura.com.tw/files/8448/2021年新品烤箱型錄電子檔.pdf', N'4642')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8457', N'product_images', N'81616', N'https://buy.sakura.com.tw/media/8457/氣炸烤箱_500x500px-01-01.png', N'4643')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8458', N'product_images', N'81615', N'https://buy.sakura.com.tw/media/8458/KODDP71XA_500x500px-01.png', N'4644')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8459', N'product_images', N'81629', N'https://buy.sakura.com.tw/media/8459/EHI977BE_500x500px-01.png', N'4645')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8460', N'RoHS', N'81629', N'https://buy.sakura.com.tw/media/8460/rohs-declaration-ehi977be.pdf', N'4646')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8462', N'說明書', N'81629', N'https://buy.sakura.com.tw/files/8462/User manual_Induction hob_LION 3 IH_Taiwan_20220120.pdf', N'4648')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8463', N'product_images', N'81630', N'https://buy.sakura.com.tw/media/8463/EHI945BE_500x500px-01.png', N'4649')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8464', N'RoHS', N'81630', N'https://buy.sakura.com.tw/media/8464/rohs-declaration-ehi945be.pdf', N'4650')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8465', N'說明書', N'81630', N'https://buy.sakura.com.tw/media/8465/User manual_Induction hob_LION 3 IH_Taiwan_20220120.pdf', N'4651')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8470', N'product_images', N'81632', N'https://buy.sakura.com.tw/media/8470/EHI3251BE_500x500px-01.png', N'4653')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8471', N'RoHS', N'81632', N'https://buy.sakura.com.tw/media/8471/rohs-declaration-ehi3251be.pdf', N'4654')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8472', N'說明書', N'81632', N'https://buy.sakura.com.tw/media/8472/User manual_Induction hob_LION 3 IH_Taiwan_20220120.pdf', N'4655')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8474', N'型錄', N'80855', N'https://buy.sakura.com.tw/files/8474/P0553A-型錄.pdf', N'4657')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8476', N'product_images', N'81633', N'https://buy.sakura.com.tw/media/8476/G2921G_800x800.png', N'4658')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8477', N'使用手冊', N'81633', N'https://buy.sakura.com.tw/media/8477/檯面爐A3說明書(官網下載).pdf', N'4659')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8578', N'RoHS', N'81640', N'https://buy.sakura.com.tw/files/8578/VE7850 RoHS標示.pdf', N'4852')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8582', N'使用手冊', N'81548', N'https://buy.sakura.com.tw/files/8582/VE8960說明書_New_211210_compressed.pdf', N'4753')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8585', N'product_images', N'81309', N'https://buy.sakura.com.tw/media/8585/未命名-1_工作區域 1-05.png', N'4036')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8609', N'使用手冊', N'81544', N'https://buy.sakura.com.tw/files/8609/VE7650說明書_NEW_220614.pdf', N'4853')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8610', N'使用手冊', N'81500', N'https://buy.sakura.com.tw/files/8610/VE7750說明書_NEW_220614.pdf', N'4854')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8611', N'使用手冊', N'81640', N'https://buy.sakura.com.tw/files/8611/VE7850說明書_NEW_220614.pdf', N'4755')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8613', N'product_images', N'81679', N'https://buy.sakura.com.tw/media/8613/VE7545_洗碗機-官網用.jpg', N'4857')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8615', N'使用手冊', N'81679', N'https://buy.sakura.com.tw/files/8615/VE7545說明書_NEW_220614.pdf', N'4855')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8620', N'RoHS', N'80794', N'https://buy.sakura.com.tw/files/8620/R7600_v1.pdf', N'4861')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8652', N'product_images', N'81684', N'https://buy.sakura.com.tw/media/8652/G5611_800x800.png', N'4888')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8654', N'使用手冊', N'81684', N'https://buy.sakura.com.tw/files/8654/G5611&G6611_manual.pdf', N'4890')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8655', N'product_images', N'81685', N'https://buy.sakura.com.tw/media/8655/G6611_800x800.png', N'4891')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8657', N'使用手冊', N'81685', N'https://buy.sakura.com.tw/files/8657/G5611&G6611_manual.pdf', N'4893')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8698', N'型錄', N'912', N'https://buy.sakura.com.tw/files/8698/DM-Q7565-2022.06-03.jpg', N'4933')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8700', N'型錄', N'1010', N'https://buy.sakura.com.tw/files/8700/DM-Q7595ML-2022.06-03.jpg', N'4935')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8701', N'型錄', N'1006', N'https://buy.sakura.com.tw/files/8701/DM-Q7596A-2022.06-03.jpg', N'4936')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8703', N'型錄', N'1018', N'https://buy.sakura.com.tw/files/8703/DM-Q7690L-2022.06-03.jpg', N'4938')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8713', N'product_images', N'81687', N'https://buy.sakura.com.tw/media/8713/P0771pic.png', N'4948')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8722', N'product_images', N'81688', N'https://buy.sakura.com.tw/media/8722/P0772pic.png', N'4957')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8723', N'product_images', N'81689', N'https://buy.sakura.com.tw/media/8723/P0773pic.png', N'4958')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8731', N'product_images', N'81693', N'https://buy.sakura.com.tw/media/8731/IMG_9816_V2_800X800.png', N'4965')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8733', N'使用手冊', N'81693', N'https://buy.sakura.com.tw/files/8733/G2826manual.pdf', N'4967')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8739', N'product_images', N'81086', N'https://buy.sakura.com.tw/media/8739/TID3510_官網用-01.jpg', N'4969')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8751', N'product_images', N'81694', N'https://buy.sakura.com.tw/media/8751/SKL506A-03 800X800(導購).png', N'4974')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8752', N'product_images', N'81696', N'https://buy.sakura.com.tw/media/8752/SPDL-V08 -800X800(導購).png', N'4975')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8771', N'product_images', N'81699', N'https://buy.sakura.com.tw/media/8771/JB760(2)_800X800(導購).png', N'4993')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8802', N'product_images', N'81699', N'https://buy.sakura.com.tw/media/8802/JB760(1)_800X800(導購).png', N'5022')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8803', N'product_images', N'81699', N'https://buy.sakura.com.tw/media/8803/JB760 (3)_800X800(導購).png', N'5023')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8811', N'product_images', N'81500', N'https://buy.sakura.com.tw/media/8811/VE7750_官網圖-01.png', N'5029')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8840', N'RoHS', N'81702', N'https://buy.sakura.com.tw/files/8840/VEG2380 RoHS表.pdf', N'5056')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8843', N'RoHS', N'81709', N'https://buy.sakura.com.tw/files/8843/VEG2670 RoHS表.pdf', N'5060')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8849', N'product_images', N'81702', N'https://buy.sakura.com.tw/media/8849/VEG2380-01.png', N'5064')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8850', N'product_images', N'81709', N'https://buy.sakura.com.tw/media/8850/VEG2670-官網圖.png', N'5063')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8866', N'使用手冊', N'81422', N'https://buy.sakura.com.tw/files/8866/歐化油機說明書.pdf', N'5079')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8867', N'使用手冊', N'81588', N'https://buy.sakura.com.tw/files/8867/歐化油機說明書.pdf', N'5080')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8868', N'使用手冊', N'80794', N'https://buy.sakura.com.tw/files/8868/R7600_R7602說明書.pdf', N'5081')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8871', N'使用手冊', N'81088', N'https://buy.sakura.com.tw/files/8871/TID2310說明書.pdf', N'3183')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8872', N'使用手冊', N'81089', N'https://buy.sakura.com.tw/files/8872/TID2310說明書.pdf', N'3186')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8873', N'使用手冊', N'80945', N'https://buy.sakura.com.tw/files/8873/TID7040說明書.pdf', N'5084')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8874', N'使用手冊', N'80946', N'https://buy.sakura.com.tw/files/8874/TID3580說明書.pdf', N'5085')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8875', N'使用手冊', N'81083', N'https://buy.sakura.com.tw/files/8875/TID6516說明書.pdf', N'5086')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8876', N'使用手冊', N'81086', N'https://buy.sakura.com.tw/files/8876/TID3510說明書.pdf', N'5087')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8878', N'使用手冊', N'81709', N'https://buy.sakura.com.tw/files/8878/VEG2670說明書.pdf', N'5089')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8909', N'型錄', N'81709', N'https://buy.sakura.com.tw/files/8909/svago_VEG2670_A4 DM_web.pdf', N'5118')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8921', N'product_images', N'81643', N'https://buy.sakura.com.tw/media/8921/R7653_F_800x800.png', N'5130')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8926', N'使用手冊', N'70039', N'https://buy.sakura.com.tw/files/8926/ENC2858AOW說明書_一級能效_New.pdf', N'5135')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8928', N'product_images', N'70039', N'https://buy.sakura.com.tw/media/8928/ENC2858AOW產品圖(一級能效)_221017.jpg', N'5136')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8930', N'product_images', N'81716', N'https://buy.sakura.com.tw/media/8930/DH1695F_pic.png', N'5137')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8932', N'型錄', N'81716', N'https://buy.sakura.com.tw/files/8932/DM_DH1695F.pdf', N'5139')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8943', N'product_images', N'81717', N'https://buy.sakura.com.tw/media/8943/DH1693F_pic.png', N'5149')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8945', N'型錄', N'81717', N'https://buy.sakura.com.tw/files/8945/DM_DH1693F.pdf', N'5151')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8947', N'使用手冊', N'81718', N'https://buy.sakura.com.tw/files/8947/智慧水量_說明書(DH167X系列).pdf', N'5153')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8948', N'product_images', N'81718', N'https://buy.sakura.com.tw/media/8948/DH1672F_pic.png', N'5154')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8949', N'product_images', N'81719', N'https://buy.sakura.com.tw/media/8949/DH1670F_pic.png', N'5155')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8950', N'使用手冊', N'81719', N'https://buy.sakura.com.tw/files/8950/智慧水量_說明書(DH167X系列).pdf', N'5156')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8952', N'product_images', N'81720', N'https://buy.sakura.com.tw/media/8952/DH1638F_pic.png', N'5158')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8953', N'使用手冊', N'81720', N'https://buy.sakura.com.tw/files/8953/四季溫_說明書(DH163X系列).pdf', N'5159')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'8966', N'使用手冊', N'81379', N'https://buy.sakura.com.tw/files/8966/EWW1142ADWA_TW_07-Oct-21(new)_compressed.pdf', N'5172')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9014', N'使用手冊', N'929', N'https://buy.sakura.com.tw/files/9014/1331.pdf', N'2354')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9017', N'使用手冊', N'997', N'https://buy.sakura.com.tw/files/9017/1331.pdf', N'2401')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9037', N'product_images', N'81755', N'https://buy.sakura.com.tw/media/9037/IMG_8997_800X800.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9038', N'使用手冊', N'81755', N'https://buy.sakura.com.tw/files/9038/台嵌爐說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9040', N'product_images', N'81756', N'https://buy.sakura.com.tw/media/9040/IMG_7894.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9056', N'product_images', N'81757', N'https://buy.sakura.com.tw/media/9056/VE5060_web-01-01.jpg', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9068', N'使用手冊', N'81758', N'https://buy.sakura.com.tw/files/9068/VR7236中島油機說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9069', N'RoHS', N'81758', N'https://buy.sakura.com.tw/files/9069/VR7236中島油機RoHS網站用-SVAGO.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9076', N'product_images', N'81758', N'https://buy.sakura.com.tw/media/9076/VR7236-01.jpg-01.png', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9077', N'product_images', N'81759', N'https://buy.sakura.com.tw/media/9077/VR7236-01.jpg-01.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9078', N'使用手冊', N'81759', N'https://buy.sakura.com.tw/files/9078/VR7236中島油機說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9079', N'RoHS', N'81759', N'https://buy.sakura.com.tw/files/9079/VR7236中島油機RoHS網站用-SVAGO.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9083', N'RoHS', N'81281', N'https://buy.sakura.com.tw/files/9083/VR7150SXL_限用物質含有情況標示聲明書.pdf', N'3932')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9117', N'型錄', N'80794', N'https://buy.sakura.com.tw/files/9117/R7600XL-DM.pdf', N'5082')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9121', N'型錄', N'81643', N'https://buy.sakura.com.tw/files/9121/R7653-DM.pdf', N'5148')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9128', N'型錄', N'920', N'https://buy.sakura.com.tw/files/9128/SH1680_DM.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9130', N'型錄', N'930', N'https://buy.sakura.com.tw/files/9130/SH2470A_DM.pdf', N'2336')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9131', N'型錄', N'963', N'https://buy.sakura.com.tw/files/9131/SH2480_DM.pdf', N'2337')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9132', N'型錄', N'932', N'https://buy.sakura.com.tw/files/9132/SH2690_DM.pdf', N'3944')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9136', N'product_images', N'81760', N'https://buy.sakura.com.tw/media/9136/IMG_6342.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9139', N'RoHS', N'81760', N'https://buy.sakura.com.tw/files/9139/限用物質含有情況標示聲明書-吊掛烘碗機(Q7580B).pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9140', N'型錄', N'81760', N'https://buy.sakura.com.tw/files/9140/SAKURA_Q7580BS.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9152', N'product_images', N'892', N'https://buy.sakura.com.tw/media/9152/G6320KS_800x800pix.png', N'4053')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9153', N'RoHS', N'81756', N'https://buy.sakura.com.tw/files/9153/E5650A-RoHS標示.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9177', N'RoHS', N'81763', N'https://buy.sakura.com.tw/files/9177/VEG2520-RoHS表.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9178', N'product_images', N'81763', N'https://buy.sakura.com.tw/media/9178/VEG2520-01.png', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9179', N'使用手冊', N'81763', N'https://buy.sakura.com.tw/files/9179/VEG2520說明書(無框).pdf', N'8')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9182', N'product_images', N'981', N'https://buy.sakura.com.tw/media/9182/G2623S.png', N'4069')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9183', N'product_images', N'979', N'https://buy.sakura.com.tw/media/9183/G2633S.png', N'4071')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9184', N'product_images', N'80625', N'https://buy.sakura.com.tw/media/9184/G5513.png', N'4055')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9185', N'型錄', N'80625', N'https://buy.sakura.com.tw/files/9185/G5513S-G6513S.pdf', N'4056')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9189', N'product_images', N'952', N'https://buy.sakura.com.tw/media/9189/G5900S.png', N'4058')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9193', N'product_images', N'80627', N'https://buy.sakura.com.tw/media/9193/G6513.png', N'4060')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9194', N'型錄', N'80627', N'https://buy.sakura.com.tw/files/9194/G5513S-G6513S.pdf', N'4061')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9195', N'product_images', N'953', N'https://buy.sakura.com.tw/media/9195/G6900S.png', N'4063')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9203', N'型錄', N'981', N'https://buy.sakura.com.tw/files/9203/G2633S-G2623S.pdf', N'4070')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9219', N'product_images', N'1014', N'https://buy.sakura.com.tw/media/9219/O5O9464.jpg', N'2649')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9220', N'product_images', N'1014', N'https://buy.sakura.com.tw/media/9220/O5O9451.jpg', N'2650')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9221', N'product_images', N'1014', N'https://buy.sakura.com.tw/media/9221/Z800x800pix_96dpi_LED顯示面板.png', N'2651')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9222', N'product_images', N'1014', N'https://buy.sakura.com.tw/media/9222/Z2928A去背.png', N'2652')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9228', N'product_images', N'81196', N'https://buy.sakura.com.tw/media/9228/Q7697_官網-(1)-(3).png', N'4370')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9229', N'product_images', N'81196', N'https://buy.sakura.com.tw/media/9229/02.png', N'4371')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9230', N'product_images', N'81196', N'https://buy.sakura.com.tw/media/9230/03.png', N'4372')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9231', N'product_images', N'81196', N'https://buy.sakura.com.tw/media/9231/04.png', N'4373')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9244', N'product_images', N'81640', N'https://buy.sakura.com.tw/media/9244/VE7850_web_側-02.jpg', N'4860')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9245', N'product_images', N'81790', N'https://buy.sakura.com.tw/media/9245/EHI7280BE_web.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9246', N'使用手冊', N'81790', N'https://buy.sakura.com.tw/files/9246/User-manual_Induction-hob_LION-3-IH_Taiwan_20220120.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9248', N'RoHS', N'81790', N'https://buy.sakura.com.tw/files/9248/ehi7280be.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9250', N'型錄', N'81758', N'https://buy.sakura.com.tw/files/9250/Svago_VR7236-中島油機_DM_A3對折_221213更新_compressed.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9251', N'型錄', N'81759', N'https://buy.sakura.com.tw/files/9251/Svago_VR7236-中島油機_DM_A3對折_221213更新_compressed.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9255', N'product_images', N'81791', N'https://buy.sakura.com.tw/media/9255/EG2100G.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9259', N'RoHS', N'81791', N'https://buy.sakura.com.tw/files/9259/EG2100G-RoHS標示.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9260', N'product_images', N'81792', N'https://buy.sakura.com.tw/media/9260/EG2200G.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9263', N'RoHS', N'81792', N'https://buy.sakura.com.tw/files/9263/EG2200G-RoHS標示.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9271', N'型錄', N'81791', N'https://buy.sakura.com.tw/files/9271/櫻花_IH-感應爐EG2100_2200.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9272', N'型錄', N'81792', N'https://buy.sakura.com.tw/files/9272/櫻花_IH-感應爐EG2100_2200.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9394', N'product_images', N'81829', N'https://buy.sakura.com.tw/media/9394/VE7770_web-01.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9395', N'使用手冊', N'81829', N'https://buy.sakura.com.tw/files/9395/VE7770說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9398', N'RoHS', N'81829', N'https://buy.sakura.com.tw/files/9398/VE7770-RoHS標示.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9409', N'product_images', N'81830', N'https://buy.sakura.com.tw/media/9409/VE9960洗脫烘_web-01.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9412', N'RoHS', N'81830', N'https://buy.sakura.com.tw/files/9412/VE9960-RoHS標示.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9426', N'型錄', N'979', N'https://buy.sakura.com.tw/files/9426/G2633S-G2623S.pdf', N'4072')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9427', N'RoHS', N'81547', N'https://buy.sakura.com.tw/files/9427/限用物質含有情況標示聲明書-落地烘碗機-Q7650.docx', N'4938')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9428', N'RoHS', N'81196', N'https://buy.sakura.com.tw/files/9428/限用物質含有情況標示聲明書-落地烘碗機-Q7697L.docx', N'4374')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9429', N'product_images', N'81833', N'https://buy.sakura.com.tw/media/9429/EG2300G_800x800.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9431', N'型錄', N'81833', N'https://buy.sakura.com.tw/files/9431/櫻花_EG2300_A3對折DM_web.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9433', N'RoHS', N'81833', N'https://buy.sakura.com.tw/files/9433/EG2300G-RoHS聲明書.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9438', N'product_images', N'81834', N'https://buy.sakura.com.tw/media/9438/Q7650ML.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9441', N'RoHS', N'81834', N'https://buy.sakura.com.tw/files/9441/限用物質含有情況標示聲明書-落地烘碗機-Q7650ML.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9444', N'product_images', N'81835', N'https://buy.sakura.com.tw/media/9444/E7683.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9445', N'使用手冊', N'81835', N'https://buy.sakura.com.tw/files/9445/E7683-半嵌洗碗機說明書_compressed.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9448', N'使用手冊', N'81836', N'https://buy.sakura.com.tw/files/9448/E7783-全嵌洗碗機說明書_compressed.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9450', N'RoHS', N'81835', N'https://buy.sakura.com.tw/files/9450/E7683洗碗機-RoHS標示.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9451', N'RoHS', N'81836', N'https://buy.sakura.com.tw/files/9451/E7783洗碗機-RoHS標示.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9453', N'product_images', N'81281', N'https://buy.sakura.com.tw/media/9453/VR7150-01.jpg', N'3933')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9456', N'product_images', N'81282', N'https://buy.sakura.com.tw/media/9456/VR7150-01.jpg', N'3931')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9458', N'product_images', N'81554', N'https://buy.sakura.com.tw/media/9458/VR7151_web-01.jpg', N'4455')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9460', N'product_images', N'81690', N'https://buy.sakura.com.tw/media/9460/P0261.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9461', N'product_images', N'81691', N'https://buy.sakura.com.tw/media/9461/P0262.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9462', N'product_images', N'81692', N'https://buy.sakura.com.tw/media/9462/P0263.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9466', N'product_images', N'81640', N'https://buy.sakura.com.tw/media/9466/VE7850web-02.jpg', N'4861')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9467', N'product_images', N'81836', N'https://buy.sakura.com.tw/media/9467/IMG_2385-(2).png', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9470', N'使用手冊', N'81717', N'https://buy.sakura.com.tw/files/9470/渦輪增壓-說明書.pdf', N'5152')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9471', N'使用手冊', N'81716', N'https://buy.sakura.com.tw/files/9471/渦輪增壓-說明書.pdf', N'5140')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9472', N'RoHS', N'81643', N'https://buy.sakura.com.tw/files/9472/R7650-R7653-R7610-系列RoHS網站用-SAKURA.pdf', N'5149')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9473', N'使用手冊', N'81643', N'https://buy.sakura.com.tw/files/9473/R7615-R7610-R7650-R7653-R9650-說明書.pdf', N'5150')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9508', N'使用手冊', N'81421', N'https://buy.sakura.com.tw/files/9508/DR9786.R9722.R7722說明書.pdf', N'5079')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9513', N'RoHS', N'81838', N'https://buy.sakura.com.tw/files/9513/限用物質含有情況標示聲明書-落地烘碗機-Q7596B.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9531', N'使用手冊', N'81840', N'https://buy.sakura.com.tw/files/9531/流線系列說明書-(4).pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9534', N'product_images', N'81841', N'https://buy.sakura.com.tw/media/9534/IMG_5846.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9536', N'使用手冊', N'81841', N'https://buy.sakura.com.tw/files/9536/檯面爐A3說明書共用頁_2306.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9538', N'product_images', N'81840', N'https://buy.sakura.com.tw/media/9538/DR3885B.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9551', N'使用手冊', N'80844', N'https://buy.sakura.com.tw/files/9551/E8890說明書_230619.pdf', N'3940')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9569', N'使用手冊', N'81842', N'https://buy.sakura.com.tw/files/9569/VE8969說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9571', N'RoHS', N'81842', N'https://buy.sakura.com.tw/files/9571/VE8969-RoHS.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9574', N'product_images', N'81842', N'https://buy.sakura.com.tw/media/9574/VE8969-01.jpg', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9608', N'使用手冊', N'80365', N'https://buy.sakura.com.tw/files/9608/GH說明書003.pdf', N'4001')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9610', N'product_images', N'81845', N'https://buy.sakura.com.tw/media/9610/VEG2380W-官網圖-01-01.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9611', N'使用手冊', N'81845', N'https://buy.sakura.com.tw/files/9611/VEG2380W說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9613', N'RoHS', N'81845', N'https://buy.sakura.com.tw/files/9613/VEG2380W-RoHS.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9614', N'使用手冊', N'81702', N'https://buy.sakura.com.tw/files/9614/VEG2380W說明書.pdf', N'5118')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9621', N'使用手冊', N'974', N'https://buy.sakura.com.tw/files/9621/GH說明書003.pdf', N'4004')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9624', N'使用手冊', N'973', N'https://buy.sakura.com.tw/files/9624/GH說明書003.pdf', N'3999')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9625', N'使用手冊', N'998', N'https://buy.sakura.com.tw/files/9625/GH說明書003.pdf', N'767')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9626', N'使用手冊', N'999', N'https://buy.sakura.com.tw/files/9626/GH說明書003.pdf', N'4000')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9628', N'product_images', N'998', N'https://buy.sakura.com.tw/media/9628/GH1239pic.png', N'768')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9643', N'product_images', N'81838', N'https://buy.sakura.com.tw/media/9643/Q9596BL-800x800.png', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9654', N'product_images', N'81841', N'https://buy.sakura.com.tw/media/9654/G2522BG_W.png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9656', N'RoHS', N'81851', N'https://buy.sakura.com.tw/files/9656/EH1210A系列官網RoHS資料更新_0112.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9658', N'RoHS', N'81852', N'https://buy.sakura.com.tw/files/9658/EH1210A系列官網RoHS資料更新_0112.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9662', N'RoHS', N'81853', N'https://buy.sakura.com.tw/files/9662/EH1210A系列官網RoHS資料更新_0112.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9663', N'RoHS', N'81854', N'https://buy.sakura.com.tw/files/9663/EH1210A系列官網RoHS資料更新_0112.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9665', N'RoHS', N'81855', N'https://buy.sakura.com.tw/files/9665/EH1210A系列官網RoHS資料更新_0112.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9667', N'RoHS', N'81856', N'https://buy.sakura.com.tw/files/9667/EH1210A系列官網RoHS資料更新_0112.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9669', N'RoHS', N'81857', N'https://buy.sakura.com.tw/files/9669/EH1210A系列官網RoHS資料更新_0112.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9671', N'product_images', N'81856', N'https://buy.sakura.com.tw/media/9671/EH1810AL6_800x800.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9672', N'product_images', N'81857', N'https://buy.sakura.com.tw/media/9672/EH0810A6_800x800.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9673', N'product_images', N'81854', N'https://buy.sakura.com.tw/media/9673/EH1210AL4_800x800.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9675', N'product_images', N'81855', N'https://buy.sakura.com.tw/media/9675/EH1210A6_800x800.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9676', N'product_images', N'81853', N'https://buy.sakura.com.tw/media/9676/EH2010A4_800x800.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9677', N'product_images', N'81852', N'https://buy.sakura.com.tw/media/9677/EH3010A6_800x800.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9678', N'product_images', N'81851', N'https://buy.sakura.com.tw/media/9678/EH5010A6_800x800.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9680', N'product_images', N'81177', N'https://buy.sakura.com.tw/media/9680/SKL105FR_800X800.png', N'3471')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9683', N'型錄', N'81310', N'https://buy.sakura.com.tw/media/9683/P0672C-A4DM-修改2023.08.jpg', N'5053')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9685', N'product_images', N'932', N'https://buy.sakura.com.tw/media/9685/SH2690_三年保固.png', N'3945')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9693', N'使用手冊', N'80304', N'https://buy.sakura.com.tw/files/9693/E3621&E9621說明書.pdf', N'4928')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9697', N'product_images', N'81864', N'https://buy.sakura.com.tw/media/9697/IMG_4533.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9698', N'product_images', N'81864', N'https://buy.sakura.com.tw/media/9698/IMG_4653.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9699', N'使用手冊', N'81864', N'https://buy.sakura.com.tw/files/9699/檯面爐A3說明書(官網下載)2308.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9779', N'product_images', N'81869', N'https://buy.sakura.com.tw/media/9779/IBC-7322-S-產品圖_導購-01.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9780', N'使用手冊', N'81869', N'https://buy.sakura.com.tw/files/9780/IBC-7322-S&IBC-7320-D感應爐說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9781', N'RoHS', N'81869', N'https://buy.sakura.com.tw/files/9781/IBC-7320-D--感應爐RoHS.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9783', N'product_images', N'81870', N'https://buy.sakura.com.tw/media/9783/IBC-7320-D_產品圖導購-01.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9784', N'使用手冊', N'81870', N'https://buy.sakura.com.tw/files/9784/IBC-7322-S&IBC-7320-D感應爐說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9786', N'RoHS', N'81870', N'https://buy.sakura.com.tw/files/9786/IBC-7320-D--感應爐RoHS.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9788', N'product_images', N'81839', N'https://buy.sakura.com.tw/media/9788/DW8-57-SI-產品圖_導購-01.png', N'8')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9790', N'product_images', N'81858', N'https://buy.sakura.com.tw/media/9790/DW8-57-SI-產品圖_導購-01.png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9796', N'product_images', N'81873', N'https://buy.sakura.com.tw/media/9796/winecellar.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9830', N'使用手冊', N'81858', N'https://buy.sakura.com.tw/files/9830/DW8-57-SI-E01說明書-壓縮版.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9832', N'型錄', N'81858', N'https://buy.sakura.com.tw/files/9832/TEKA_DW8-57-SI-&-E01-洗碗機A3二摺頁DM.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9833', N'型錄', N'81839', N'https://buy.sakura.com.tw/files/9833/TEKA_DW8-57-SI-&-E01-洗碗機A3二摺頁DM.pdf', N'9')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9840', N'product_images', N'81078', N'https://buy.sakura.com.tw/media/9840/IMG_2851(亮燈).png', N'4935')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9841', N'product_images', N'81078', N'https://buy.sakura.com.tw/media/9841/IMG_2897.png', N'4936')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9842', N'product_images', N'81078', N'https://buy.sakura.com.tw/media/9842/IMG_2916(亮燈).png', N'4937')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9843', N'product_images', N'81078', N'https://buy.sakura.com.tw/media/9843/IMG_2916(亮燈).png', N'4938')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9854', N'product_images', N'81546', N'https://buy.sakura.com.tw/media/9854/EG2350GW_800x800.png', N'4414')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9855', N'product_images', N'81546', N'https://buy.sakura.com.tw/media/9855/EG2350-(1).png', N'4415')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9856', N'型錄', N'81546', N'https://buy.sakura.com.tw/files/9856/櫻花_雙口IH爐系列_DM_A3對折_231006v.pdf', N'4416')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9857', N'product_images', N'80304', N'https://buy.sakura.com.tw/media/9857/IMG_2951_V1.png', N'4934')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9867', N'RoHS', N'81888', N'https://buy.sakura.com.tw/files/9867/EH1230AR系列官網RoHS資料更新.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9869', N'RoHS', N'81890', N'https://buy.sakura.com.tw/files/9869/EH1230AR系列官網RoHS資料更新.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9870', N'RoHS', N'81891', N'https://buy.sakura.com.tw/files/9870/EH1230AR系列官網RoHS資料更新.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9872', N'RoHS', N'81893', N'https://buy.sakura.com.tw/files/9872/EH1230AR系列官網RoHS資料更新.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9875', N'RoHS', N'81896', N'https://buy.sakura.com.tw/files/9875/EH1230AR系列官網RoHS資料更新.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9876', N'RoHS', N'81897', N'https://buy.sakura.com.tw/files/9876/EH1230AR系列官網RoHS資料更新.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9877', N'RoHS', N'81898', N'https://buy.sakura.com.tw/files/9877/EH1230AR系列官網RoHS資料更新.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9878', N'RoHS', N'81899', N'https://buy.sakura.com.tw/files/9878/EH1230AR系列官網RoHS資料更新.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9881', N'RoHS', N'81902', N'https://buy.sakura.com.tw/files/9881/EH1230AR系列官網RoHS資料更新.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9882', N'型錄', N'81873', N'https://buy.sakura.com.tw/files/9882/TEKA_RVU-20046-GBK紅酒櫃_A4DM_Final.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9883', N'使用手冊', N'81873', N'https://buy.sakura.com.tw/files/9883/RVU-20046-GBK紅酒櫃說明書.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9895', N'product_images', N'81903', N'https://buy.sakura.com.tw/media/9895/P0230A.png', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9897', N'product_images', N'81904', N'https://buy.sakura.com.tw/media/9897/TEKA_水槽-01-01.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9898', N'product_images', N'81876', N'https://buy.sakura.com.tw/media/9898/TEKA_水槽-7240B-01.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9911', N'使用手冊', N'81839', N'https://buy.sakura.com.tw/files/9911/DW8-57-SI熱風烘洗碗機說明書_無框(改門片重量).pdf', N'10')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9912', N'product_images', N'81905', N'https://buy.sakura.com.tw/media/9912/TEKA_水槽-7240TGB-01.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9913', N'product_images', N'81906', N'https://buy.sakura.com.tw/media/9913/TEKA_水槽-7240TGA-01.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9914', N'product_images', N'81907', N'https://buy.sakura.com.tw/media/9914/TEKA_水槽-FOR5040TGAB-01.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9915', N'product_images', N'81908', N'https://buy.sakura.com.tw/media/9915/FOR5040TGAA-01.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9916', N'product_images', N'81909', N'https://buy.sakura.com.tw/media/9916/SQ5040TGB-01.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9917', N'product_images', N'81910', N'https://buy.sakura.com.tw/media/9917/SQ5040TGA-01.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9932', N'product_images', N'81911', N'https://buy.sakura.com.tw/media/9932/R7351bpic.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9935', N'product_images', N'81913', N'https://buy.sakura.com.tw/media/9935/P0233-800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9936', N'使用手冊', N'81913', N'https://buy.sakura.com.tw/files/9936/P0233A-說明書-官網.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9942', N'product_images', N'81912', N'https://buy.sakura.com.tw/media/9942/5.png', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9943', N'product_images', N'81912', N'https://buy.sakura.com.tw/media/9943/2.png', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9944', N'product_images', N'81912', N'https://buy.sakura.com.tw/media/9944/1.png', N'8')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9947', N'product_images', N'81912', N'https://buy.sakura.com.tw/media/9947/6.png', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9950', N'型錄', N'81866', N'https://buy.sakura.com.tw/files/9950/TEKA_牛排大師_A3摺頁DM_web.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9960', N'product_images', N'81876', N'https://buy.sakura.com.tw/media/9960/FORSQUARE-72-40-Drawing1.jpg', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9962', N'product_images', N'81876', N'https://buy.sakura.com.tw/media/9962/FORSQUARE-72-40-Drawing2.jpg', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9963', N'product_images', N'81904', N'https://buy.sakura.com.tw/media/9963/FORSQUARE-72-40-Drawing1.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9964', N'product_images', N'81904', N'https://buy.sakura.com.tw/media/9964/FORSQUARE-72-40-Drawing2.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9965', N'product_images', N'81907', N'https://buy.sakura.com.tw/media/9965/FORSQUARE-50-40-Drawing1.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9966', N'product_images', N'81907', N'https://buy.sakura.com.tw/media/9966/FORSQUARE-50-40-Drawing2.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9967', N'product_images', N'81908', N'https://buy.sakura.com.tw/media/9967/FORSQUARE-50-40-Drawing1.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9968', N'product_images', N'81908', N'https://buy.sakura.com.tw/media/9968/FORSQUARE-50-40-Drawing2.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9969', N'product_images', N'81905', N'https://buy.sakura.com.tw/media/9969/SQUARE-72-40-drawing1.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9970', N'product_images', N'81905', N'https://buy.sakura.com.tw/media/9970/SQUARE-72-40-drawing2.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9971', N'product_images', N'81906', N'https://buy.sakura.com.tw/media/9971/SQUARE-72-40-drawing1.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9972', N'product_images', N'81906', N'https://buy.sakura.com.tw/media/9972/SQUARE-72-40-drawing2.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9973', N'product_images', N'81909', N'https://buy.sakura.com.tw/media/9973/SQUARE-50-40-drawing1.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9974', N'product_images', N'81909', N'https://buy.sakura.com.tw/media/9974/SQUARE-50-40-drawing2.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9975', N'product_images', N'81910', N'https://buy.sakura.com.tw/media/9975/SQUARE-50-40-drawing1.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9976', N'product_images', N'81910', N'https://buy.sakura.com.tw/media/9976/SQUARE-50-40-drawing2.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9993', N'RoHS', N'81866', N'https://buy.sakura.com.tw/files/9993/STEAKMASTER-RoHS.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9995', N'說明書', N'81866', N'https://buy.sakura.com.tw/files/9995/STEAKMASTER說明書.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'9997', N'product_images', N'81866', N'https://buy.sakura.com.tw/media/9997/STEAKMASTER-800X800.png', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10013', N'product_images', N'81920', N'https://buy.sakura.com.tw/media/10013/BE-LINEA-RS15-71-40-view1.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10014', N'product_images', N'81920', N'https://buy.sakura.com.tw/media/10014/BE-LINEA-RS15-71-40產品尺寸.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10015', N'product_images', N'81920', N'https://buy.sakura.com.tw/media/10015/BE-LINEA-RS15-71-40-開孔尺寸.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10017', N'product_images', N'81921', N'https://buy.sakura.com.tw/media/10017/BE-LINEA-RS15-45-40-view1.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10018', N'product_images', N'81921', N'https://buy.sakura.com.tw/media/10018/BE-LINEA-RS15-45-產品尺寸.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10019', N'product_images', N'81921', N'https://buy.sakura.com.tw/media/10019/BE-LINEA-RS15-45-挖孔尺寸.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10030', N'product_images', N'81925', N'https://buy.sakura.com.tw/media/10030/G2523YG-1.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10031', N'product_images', N'81925', N'https://buy.sakura.com.tw/media/10031/G2523YG-2.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10033', N'product_images', N'81925', N'https://buy.sakura.com.tw/media/10033/G2523YG-3.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10034', N'使用手冊', N'81925', N'https://buy.sakura.com.tw/files/10034/檯面爐A3說明書(官網下載)2308.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10039', N'product_images', N'81926', N'https://buy.sakura.com.tw/media/10039/G633Y-2.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10040', N'product_images', N'81926', N'https://buy.sakura.com.tw/media/10040/G633Y-3.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10041', N'product_images', N'81926', N'https://buy.sakura.com.tw/media/10041/G633Y-1.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10042', N'使用手冊', N'81926', N'https://buy.sakura.com.tw/files/10042/台嵌爐說明書_F74-A261.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10045', N'product_images', N'81927', N'https://buy.sakura.com.tw/media/10045/G6330Y-2.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10046', N'product_images', N'81927', N'https://buy.sakura.com.tw/media/10046/G6330Y-3.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10048', N'使用手冊', N'81927', N'https://buy.sakura.com.tw/files/10048/台嵌爐說明書_F74-A261.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10050', N'product_images', N'81928', N'https://buy.sakura.com.tw/media/10050/G616Y-２.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10051', N'product_images', N'81928', N'https://buy.sakura.com.tw/media/10051/G616Y-3.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10052', N'product_images', N'81928', N'https://buy.sakura.com.tw/media/10052/G616Y-1.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10054', N'使用手冊', N'81928', N'https://buy.sakura.com.tw/files/10054/台嵌爐說明書_F74-A261.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10056', N'product_images', N'81929', N'https://buy.sakura.com.tw/media/10056/G6160Y-2.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10057', N'product_images', N'81929', N'https://buy.sakura.com.tw/media/10057/G6160Y-3.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10059', N'使用手冊', N'81929', N'https://buy.sakura.com.tw/files/10059/台嵌爐說明書_F74-A261.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10064', N'說明書', N'81930', N'https://buy.sakura.com.tw/files/10064/IBC-32930-TTC-說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10065', N'RoHS', N'81930', N'https://buy.sakura.com.tw/files/10065/IBS-32930-TTC感應爐-RoHS-標示.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10069', N'型錄', N'81718', N'https://buy.sakura.com.tw/files/10069/熱水器DM-DH1672F.pdf', N'5155')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10070', N'型錄', N'81719', N'https://buy.sakura.com.tw/files/10070/熱水器DM-DH1670F.pdf', N'5157')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10071', N'型錄', N'81720', N'https://buy.sakura.com.tw/files/10071/熱水器DM-DH1638F.pdf', N'5160')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10078', N'型錄', N'1022', N'https://buy.sakura.com.tw/files/10078/熱水器DM-DH1628.pdf', N'2485')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10089', N'product_images', N'81918', N'https://buy.sakura.com.tw/media/10089/ARQ7045_官網.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10090', N'product_images', N'81919', N'https://buy.sakura.com.tw/media/10090/ARQ5441_-官網.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10093', N'product_images', N'81918', N'https://buy.sakura.com.tw/media/10093/ARQ7045產品尺寸.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10094', N'product_images', N'81918', N'https://buy.sakura.com.tw/media/10094/ARQ7045開孔尺寸.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10095', N'product_images', N'81919', N'https://buy.sakura.com.tw/media/10095/ARQ5441產品尺寸.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10096', N'product_images', N'81919', N'https://buy.sakura.com.tw/media/10096/ARQ5441開孔尺寸.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10109', N'型錄', N'81588', N'https://buy.sakura.com.tw/files/10109/DR7790-7786-2024.01.pdf', N'5081')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10110', N'型錄', N'81422', N'https://buy.sakura.com.tw/files/10110/DR7790-7786-2024.01.pdf', N'5080')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10111', N'型錄', N'80974', N'https://buy.sakura.com.tw/files/10111/R7765SXL-DM-2024.01.pdf', N'3975')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10112', N'型錄', N'81421', N'https://buy.sakura.com.tw/files/10112/R7722-A4-DM-2024.01.pdf', N'5080')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10116', N'型錄', N'81309', N'https://buy.sakura.com.tw/files/10116/R3750-DM-2024.01.pdf', N'4039')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10117', N'型錄', N'81840', N'https://buy.sakura.com.tw/files/10117/DR3885B-2024.01.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10118', N'型錄', N'81586', N'https://buy.sakura.com.tw/files/10118/DR3882B-2024.01.pdf', N'4466')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10119', N'型錄', N'81587', N'https://buy.sakura.com.tw/files/10119/DR3880B-2024.01.pdf', N'4468')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10121', N'型錄', N'1027', N'https://buy.sakura.com.tw/files/10121/G2922AG.G2921G.G2932AG-2024.01.pdf', N'4064')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10122', N'型錄', N'81633', N'https://buy.sakura.com.tw/files/10122/G2922AG.G2921G.G2932AG-2024.01.pdf', N'4660')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10124', N'型錄', N'1028', N'https://buy.sakura.com.tw/files/10124/G2922AG.G2921G.G2932AG-2024.01.pdf', N'4065')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10126', N'型錄', N'81497', N'https://buy.sakura.com.tw/files/10126/G2522AG-G2623AG-2024.01.pdf', N'4378')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10129', N'型錄', N'81693', N'https://buy.sakura.com.tw/files/10129/G2826G-2024.01.pdf', N'4968')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10134', N'型錄', N'81755', N'https://buy.sakura.com.tw/files/10134/G6320A-A4-DM-2024.01.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10135', N'型錄', N'80801', N'https://buy.sakura.com.tw/files/10135/G615AS-G6150AS-DM-2024.01.pdf', N'2189')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10138', N'型錄', N'81196', N'https://buy.sakura.com.tw/files/10138/Q7697L-DM-2024.01.pdf', N'4375')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10139', N'型錄', N'81547', N'https://buy.sakura.com.tw/files/10139/Q7650-DM-2024.01.pdf', N'4939')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10140', N'型錄', N'81834', N'https://buy.sakura.com.tw/files/10140/SAKURA_Q7650ML烘碗機_A4DM_240131_web.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10141', N'型錄', N'81838', N'https://buy.sakura.com.tw/files/10141/SAKURA_Q7596B烘碗機_A4DM_240131_web.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10142', N'型錄', N'80844', N'https://buy.sakura.com.tw/files/10142/E8890-DM-2024.01.pdf', N'3941')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10145', N'型錄', N'80823', N'https://buy.sakura.com.tw/files/10145/E8692-DM-2024.01.pdf', N'4934')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10146', N'型錄', N'81756', N'https://buy.sakura.com.tw/files/10146/E5650A-DM-2024.01.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10151', N'型錄', N'81835', N'https://buy.sakura.com.tw/files/10151/E7683-E7783-DM-2024.01.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10152', N'型錄', N'81836', N'https://buy.sakura.com.tw/files/10152/E7683-E7783-DM-2024.01.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10155', N'型錄', N'80304', N'https://buy.sakura.com.tw/files/10155/E3621_電器櫃_A4DM_240131_web.pdf', N'4935')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10159', N'product_images', N'81902', N'https://buy.sakura.com.tw/media/10159/EH1830A6-800x800px.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10161', N'product_images', N'81898', N'https://buy.sakura.com.tw/media/10161/EH1230A6-800x800px.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10163', N'product_images', N'81896', N'https://buy.sakura.com.tw/media/10163/EH1230AL6-800x800px.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10165', N'product_images', N'81893', N'https://buy.sakura.com.tw/media/10165/EH0630A6-800x800px.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10167', N'product_images', N'81891', N'https://buy.sakura.com.tw/media/10167/EH0630AL6-800x800px.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10169', N'product_images', N'81932', N'https://buy.sakura.com.tw/media/10169/2022_12_21_9916-1.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10170', N'使用手冊', N'81932', N'https://buy.sakura.com.tw/files/10170/R7615說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10172', N'RoHS', N'81932', N'https://buy.sakura.com.tw/files/10172/R7650XL-系列RoHS網站用-SAKURA.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10173', N'product_images', N'81932', N'https://buy.sakura.com.tw/media/10173/2022_12_21_9918-1.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10181', N'型錄', N'81870', N'https://buy.sakura.com.tw/files/10181/TEKA_雙口感應IH爐7320D_7322S_A4DM_web.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10182', N'型錄', N'81869', N'https://buy.sakura.com.tw/files/10182/TEKA_雙口感應IH爐7320D_7322S_A4DM_web.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10191', N'product_images', N'81933', N'https://buy.sakura.com.tw/media/10191/DH1605A_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10192', N'使用手冊', N'81933', N'https://buy.sakura.com.tw/files/10192/說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10195', N'型錄', N'81640', N'https://buy.sakura.com.tw/files/10195/svago_VE7850_A4-DM_web.pdf', N'4862')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10196', N'型錄', N'81842', N'https://buy.sakura.com.tw/files/10196/Svago_VE8969_DM.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10199', N'使用手冊', N'81384', N'https://buy.sakura.com.tw/files/10199/VE6860說明書.pdf', N'4696')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10200', N'product_images', N'81033', N'https://buy.sakura.com.tw/media/10200/F0231_pic.png', N'2925')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10201', N'product_images', N'81035', N'https://buy.sakura.com.tw/media/10201/F0221_pic24321.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10202', N'product_images', N'81935', N'https://buy.sakura.com.tw/media/10202/VE7190_web.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10212', N'product_images', N'81936', N'https://buy.sakura.com.tw/media/10212/IZF-88700-BK-MST_web.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10213', N'RoHS', N'81936', N'https://buy.sakura.com.tw/files/10213/IZF-88700-MST-RoHS.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10214', N'product_images', N'81937', N'https://buy.sakura.com.tw/media/10214/IZC-93320-MST-BK_web.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10215', N'RoHS', N'81937', N'https://buy.sakura.com.tw/files/10215/IZC-93320-MST感應爐RoHS標示.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10216', N'product_images', N'81938', N'https://buy.sakura.com.tw/media/10216/IZF-65320-BK_web.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10217', N'RoHS', N'81938', N'https://buy.sakura.com.tw/files/10217/IZF-65320-MSP感應爐RoHS標示.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10218', N'product_images', N'81939', N'https://buy.sakura.com.tw/media/10218/IZS-34700-MST_web.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10219', N'RoHS', N'81939', N'https://buy.sakura.com.tw/files/10219/IZS-34700-MST-RoHS-標示.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10220', N'product_images', N'81930', N'https://buy.sakura.com.tw/media/10220/IBS-32930-TTC_web.jpg', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10226', N'使用手冊', N'81936', N'https://buy.sakura.com.tw/files/10226/IZF-88770-MST-說明書.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10227', N'使用手冊', N'81939', N'https://buy.sakura.com.tw/files/10227/IZS-34700-MST說明書.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10228', N'使用手冊', N'81938', N'https://buy.sakura.com.tw/files/10228/IZF-65320-MSP-說明書.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10229', N'使用手冊', N'81937', N'https://buy.sakura.com.tw/files/10229/IZC-93320-MST-說明書.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10230', N'product_images', N'920', N'https://buy.sakura.com.tw/media/10230/SH1680.png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10254', N'型錄', N'81932', N'https://buy.sakura.com.tw/files/10254/櫻花近吸式油機-R7615-DM-網路用-(2).pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10258', N'product_images', N'81915', N'https://buy.sakura.com.tw/media/10258/P0585合成-1-官網800x800px.png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10278', N'product_images', N'81943', N'https://buy.sakura.com.tw/media/10278/VEG2220_官網.JPG', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10280', N'使用手冊', N'81943', N'https://buy.sakura.com.tw/files/10280/VEG2220-說明書.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10281', N'RoHS', N'81943', N'https://buy.sakura.com.tw/files/10281/VEG2220_RoHs.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10283', N'product_images', N'81942', N'https://buy.sakura.com.tw/media/10283/VR7010S_官網.JPG', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10284', N'product_images', N'81942', N'https://buy.sakura.com.tw/media/10284/VR7010S_官網1.JPG', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10289', N'使用手冊', N'81942', N'https://buy.sakura.com.tw/files/10289/VR7010說明書.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10290', N'product_images', N'81942', N'https://buy.sakura.com.tw/media/10290/VR7010示意圖.JPG', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10291', N'product_images', N'81944', N'https://buy.sakura.com.tw/media/10291/VR7010SXL_官網.JPG', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10292', N'product_images', N'81944', N'https://buy.sakura.com.tw/media/10292/VR7010S_官網1.JPG', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10293', N'product_images', N'81944', N'https://buy.sakura.com.tw/media/10293/VR7010示意圖.JPG', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10295', N'使用手冊', N'81944', N'https://buy.sakura.com.tw/files/10295/VR7010說明書.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10298', N'RoHS', N'81944', N'https://buy.sakura.com.tw/files/10298/VR7010系列RoHs.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10299', N'RoHS', N'81942', N'https://buy.sakura.com.tw/files/10299/VR7010系列RoHs.pdf', N'9')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10340', N'product_images', N'81947', N'https://buy.sakura.com.tw/media/10340/1713943776321.jpg', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10341', N'product_images', N'81947', N'https://buy.sakura.com.tw/media/10341/1713943720106.jpg', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10342', N'product_images', N'81948', N'https://buy.sakura.com.tw/media/10342/1713944066538.jpg', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10343', N'product_images', N'81948', N'https://buy.sakura.com.tw/media/10343/1713943776321.jpg', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10344', N'product_images', N'81948', N'https://buy.sakura.com.tw/media/10344/1713943720106.jpg', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10362', N'product_images', N'81952', N'https://buy.sakura.com.tw/media/10362/1713945904120.jpg', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10363', N'product_images', N'81952', N'https://buy.sakura.com.tw/media/10363/1713943776321.jpg', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10364', N'product_images', N'81952', N'https://buy.sakura.com.tw/media/10364/1713943720106.jpg', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10372', N'型錄', N'81911', N'https://buy.sakura.com.tw/files/10372/櫻花_近吸隱藏油機R7352-7351_A3對折.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10373', N'型錄', N'81912', N'https://buy.sakura.com.tw/files/10373/櫻花_近吸隱藏油機R7352-7351_A3對折.pdf', N'10')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10383', N'product_images', N'81954', N'https://buy.sakura.com.tw/media/10383/排序一-IMG_4460-(1).png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10384', N'product_images', N'81954', N'https://buy.sakura.com.tw/media/10384/排序二-IMG_5801_V1.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10385', N'product_images', N'81954', N'https://buy.sakura.com.tw/media/10385/排序三-IMG_4612_V2.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10386', N'product_images', N'81954', N'https://buy.sakura.com.tw/media/10386/排序四-IMG_4806_V1.png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10387', N'RoHS', N'81954', N'https://buy.sakura.com.tw/files/10387/E8891-RoHS-標示.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10389', N'型錄', N'81954', N'https://buy.sakura.com.tw/files/10389/櫻花_E8891蒸烤箱_A4DM_web_240509.pdf', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10403', N'型錄', N'993', N'https://buy.sakura.com.tw/files/10403/SH2291-2024.05.pdf', N'3945')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10404', N'型錄', N'1023', N'https://buy.sakura.com.tw/files/10404/DH2460-2024.05.pdf', N'2486')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10406', N'使用手冊', N'81361', N'https://buy.sakura.com.tw/files/10406/IH單口直_雙口說明書_240522.pdf', N'4229')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10407', N'使用手冊', N'81362', N'https://buy.sakura.com.tw/files/10407/IH單口直_雙口說明書_240522.pdf', N'4228')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10408', N'使用手冊', N'81545', N'https://buy.sakura.com.tw/files/10408/IH單口直_雙口說明書_240522.pdf', N'4411')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10411', N'使用手冊', N'81792', N'https://buy.sakura.com.tw/files/10411/IH單口直_雙口說明書_240522.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10412', N'使用手冊', N'81833', N'https://buy.sakura.com.tw/files/10412/EG2300G說明書.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10418', N'product_images', N'81957', N'https://buy.sakura.com.tw/media/10418/P9870_800x800.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10423', N'product_images', N'81958', N'https://buy.sakura.com.tw/media/10423/EHF6220_800x800.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10450', N'product_images', N'81698', N'https://buy.sakura.com.tw/media/10450/JB650-白.jpg', N'4992')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10451', N'型錄', N'81933', N'https://buy.sakura.com.tw/files/10451/DH1605A-A4DM-修改2024.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10460', N'product_images', N'80662', N'https://buy.sakura.com.tw/media/10460/JB780G_03.png', N'2806')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10461', N'product_images', N'80663', N'https://buy.sakura.com.tw/media/10461/JB880B_03.png', N'2807')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10462', N'型錄', N'81702', N'https://buy.sakura.com.tw/files/10462/svago_VEG2380_A4DM_黑色.pdf', N'5119')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10463', N'型錄', N'81845', N'https://buy.sakura.com.tw/files/10463/svago_VEG2380W_A4DM_白色.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10467', N'product_images', N'81960', N'https://buy.sakura.com.tw/media/10467/P0531_800x800.png', N'100')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10477', N'product_images', N'81961', N'https://buy.sakura.com.tw/media/10477/P5530W產品圖_800x800.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10482', N'型錄', N'81961', N'https://buy.sakura.com.tw/files/10482/櫻花_檯面RO淨熱飲P5530W_A4摺頁DM設計.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10483', N'product_images', N'81962', N'https://buy.sakura.com.tw/media/10483/IMG_7454.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10484', N'product_images', N'81962', N'https://buy.sakura.com.tw/media/10484/IMG_7460.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10485', N'product_images', N'81962', N'https://buy.sakura.com.tw/media/10485/IMG_7600.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10486', N'product_images', N'81962', N'https://buy.sakura.com.tw/media/10486/IMG_7601.png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10489', N'product_images', N'81963', N'https://buy.sakura.com.tw/media/10489/IMG_0036.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10490', N'product_images', N'81963', N'https://buy.sakura.com.tw/media/10490/IMG_0084.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10491', N'product_images', N'81963', N'https://buy.sakura.com.tw/media/10491/IMG_0225.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10492', N'使用手冊', N'81963', N'https://buy.sakura.com.tw/files/10492/DR7788說明書_20240604.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10502', N'product_images', N'81964', N'https://buy.sakura.com.tw/media/10502/IMG_4263.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10503', N'使用手冊', N'81964', N'https://buy.sakura.com.tw/files/10503/F74-A482-001-(A4x7)--112.6.16-校稿.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10508', N'使用手冊', N'80141', N'https://buy.sakura.com.tw/files/10508/MW7711產品說明書_20240619.pdf', N'3267')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10509', N'使用手冊', N'80142', N'https://buy.sakura.com.tw/files/10509/MW7709產品說明書_20240619.pdf', N'3266')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10514', N'型錄', N'81936', N'https://buy.sakura.com.tw/files/10514/TEKA_IH爐_2024.pdf.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10515', N'型錄', N'81939', N'https://buy.sakura.com.tw/files/10515/TEKA_IH爐_2024.pdf.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10516', N'型錄', N'81937', N'https://buy.sakura.com.tw/files/10516/TEKA_IH爐_2024.pdf.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10517', N'型錄', N'81938', N'https://buy.sakura.com.tw/files/10517/TEKA_IH爐_2024.pdf.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10520', N'使用手冊', N'81760', N'https://buy.sakura.com.tw/files/10520/P3KG0002-L30X0.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10521', N'使用手冊', N'912', N'https://buy.sakura.com.tw/files/10521/P3KG0002-L30X0.pdf', N'4934')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10522', N'使用手冊', N'942', N'https://buy.sakura.com.tw/files/10522/P3KG0002-L30X0.pdf', N'1013')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10532', N'RoHS', N'81935', N'https://buy.sakura.com.tw/files/10532/VE7190洗碗機[限用物質含有情況標示聲明書].pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10533', N'product_images', N'81935', N'https://buy.sakura.com.tw/media/10533/VE7190_側面.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10542', N'使用手冊', N'81965', N'https://buy.sakura.com.tw/files/10542/VEG2350說明書.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10544', N'RoHS', N'81965', N'https://buy.sakura.com.tw/files/10544/VEG2350-RoHS標示.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10546', N'product_images', N'81965', N'https://buy.sakura.com.tw/media/10546/VEG2350官網圖.JPG', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10548', N'使用手冊', N'81966', N'https://buy.sakura.com.tw/files/10548/VDR7191說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10556', N'使用手冊', N'81967', N'https://buy.sakura.com.tw/files/10556/VDR7191說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10559', N'product_images', N'81967', N'https://buy.sakura.com.tw/media/10559/VDR7191XXL官網圖.JPG', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10623', N'product_images', N'81949', N'https://buy.sakura.com.tw/media/10623/760-1.jpg', N'32')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10624', N'product_images', N'81949', N'https://buy.sakura.com.tw/media/10624/760-2.jpg', N'33')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10625', N'product_images', N'81949', N'https://buy.sakura.com.tw/media/10625/760-3.jpg', N'34')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10626', N'product_images', N'81949', N'https://buy.sakura.com.tw/media/10626/760-4.jpg', N'35')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10627', N'product_images', N'81949', N'https://buy.sakura.com.tw/media/10627/760-5.jpg', N'36')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10645', N'使用手冊', N'81757', N'https://buy.sakura.com.tw/files/10645/VE5060說明書.pdf', N'8')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10658', N'RoHS', N'81757', N'https://buy.sakura.com.tw/files/10658/VE5060-RoHS標示.pdf', N'10')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10662', N'product_images', N'81945', N'https://buy.sakura.com.tw/media/10662/VUS750.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10670', N'product_images', N'81969', N'https://buy.sakura.com.tw/media/10670/VUS850.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10683', N'RoHS', N'913', N'https://buy.sakura.com.tw/files/10683/限用物質含有情況標示聲明書-吊掛烘碗機-Q7583_Q9583系列.pdf', N'3721')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10684', N'使用手冊', N'913', N'https://buy.sakura.com.tw/files/10684/吊掛烘說明書_2407.pdf', N'3722')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10690', N'product_images', N'80795', N'https://buy.sakura.com.tw/media/10690/Q7692.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10691', N'product_images', N'80795', N'https://buy.sakura.com.tw/media/10691/Q7692_1.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10692', N'product_images', N'80795', N'https://buy.sakura.com.tw/media/10692/Q7692_2.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10696', N'RoHS', N'80795', N'https://buy.sakura.com.tw/files/10696/限用物質含有情況標示聲明書-落地烘碗機-Q7692_Q9692系列.pdf', N'4372')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10712', N'使用手冊', N'81687', N'https://buy.sakura.com.tw/files/10712/P0771_P0772_P0773_P9770說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10713', N'使用手冊', N'81688', N'https://buy.sakura.com.tw/files/10713/P0771_P0772_P0773_P9770說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10714', N'使用手冊', N'81689', N'https://buy.sakura.com.tw/files/10714/P0771_P0772_P0773_P9770說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10729', N'product_images', N'81949', N'https://buy.sakura.com.tw/media/10729/760-6-slide-1.jpg', N'40')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10730', N'product_images', N'81949', N'https://buy.sakura.com.tw/media/10730/760-7-slide-1.jpg', N'41')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10731', N'product_images', N'81949', N'https://buy.sakura.com.tw/media/10731/760-8-thumb.jpg', N'42')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10739', N'product_images', N'81973', N'https://buy.sakura.com.tw/media/10739/P0563-(1).png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10740', N'型錄', N'81973', N'https://buy.sakura.com.tw/files/10740/P0563-廚下熱飲機-電子型錄.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10741', N'使用手冊', N'81973', N'https://buy.sakura.com.tw/files/10741/P0563B說明書.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10752', N'型錄', N'81935', N'https://buy.sakura.com.tw/files/10752/svago_VE7190洗碗機.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10765', N'RoHS', N'81966', N'https://buy.sakura.com.tw/files/10765/限用物質含有情況標示聲明書-VDR7191.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10766', N'RoHS', N'81967', N'https://buy.sakura.com.tw/files/10766/限用物質含有情況標示聲明書-VDR7191.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10768', N'product_images', N'81980', N'https://buy.sakura.com.tw/media/10768/VEG2330官網圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10771', N'RoHS', N'81980', N'https://buy.sakura.com.tw/files/10771/VEG2330感應爐[限用物質含有情況標示聲明書].pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10779', N'product_images', N'81981', N'https://buy.sakura.com.tw/media/10779/VG2520官網圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10780', N'使用手冊', N'81981', N'https://buy.sakura.com.tw/files/10780/VG2520G說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10781', N'product_images', N'80999', N'https://buy.sakura.com.tw/media/10781/SAKURA靜音緩衝抽屜地櫃.gif', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10782', N'product_images', N'81982', N'https://buy.sakura.com.tw/media/10782/GRASS-ProONE靜音緩衝抽屜地櫃.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10785', N'product_images', N'80997', N'https://buy.sakura.com.tw/media/10785/轉角蝴蝶轉盤地櫃.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10791', N'product_images', N'81986', N'https://buy.sakura.com.tw/media/10791/收納矮梯地櫃.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10823', N'型錄', N'81962', N'https://buy.sakura.com.tw/files/10823/0702更-Ai-KITCHEN廚房電器i5型錄_A3雙面對折-N_compressed.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10824', N'型錄', N'81963', N'https://buy.sakura.com.tw/files/10824/0802-Ai-KITCHEN廚房電器i4型錄_A3雙面對折_compressed.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10828', N'product_images', N'81007', N'https://buy.sakura.com.tw/media/10828/座式緩衝ST側拉籃地櫃(20.30cm).jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10829', N'product_images', N'81992', N'https://buy.sakura.com.tw/media/10829/座式緩衝ST側拉籃地櫃(15cm).jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10830', N'product_images', N'81993', N'https://buy.sakura.com.tw/media/10830/座式緩衝ST側拉籃地櫃(20.30cm).jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10831', N'product_images', N'81994', N'https://buy.sakura.com.tw/media/10831/盤籃式側拉籃地櫃(進口五金).jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10832', N'product_images', N'81995', N'https://buy.sakura.com.tw/media/10832/座式緩衝塗裝拉籃地櫃.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10833', N'product_images', N'81996', N'https://buy.sakura.com.tw/media/10833/座式緩衝ST拉籃地櫃.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10834', N'product_images', N'81997', N'https://buy.sakura.com.tw/media/10834/鋼珠緩衝圍籃地櫃.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10836', N'product_images', N'80996', N'https://buy.sakura.com.tw/media/10836/進口轉角全展式盤籃地櫃.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10837', N'product_images', N'81998', N'https://buy.sakura.com.tw/media/10837/多功能收納盤籃式拉籃地櫃.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10839', N'product_images', N'82000', N'https://buy.sakura.com.tw/media/10839/盤籃式分類緩衝垃圾桶地櫃.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10840', N'product_images', N'82001', N'https://buy.sakura.com.tw/media/10840/電動升降瀝水吊櫃.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10846', N'product_images', N'82004', N'https://buy.sakura.com.tw/media/10846/嵌入式電器高櫃.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10847', N'線稿', N'82004', N'https://buy.sakura.com.tw/files/10847/35崁入式電器高櫃.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10848', N'product_images', N'82005', N'https://buy.sakura.com.tw/media/10848/平板抽電器高櫃.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10849', N'線稿', N'82005', N'https://buy.sakura.com.tw/files/10849/36平板抽電器高櫃.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10850', N'product_images', N'82006', N'https://buy.sakura.com.tw/media/10850/座式緩衝平板抽電器高櫃.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10851', N'線稿', N'82006', N'https://buy.sakura.com.tw/files/10851/37-座式緩衝平板抽電器高櫃.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10852', N'線稿', N'82007', N'https://buy.sakura.com.tw/files/10852/38多功能儲物高櫃.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10853', N'product_images', N'82007', N'https://buy.sakura.com.tw/media/10853/多功能儲物高櫃.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10854', N'product_images', N'82008', N'https://buy.sakura.com.tw/media/10854/多功能拉籃高櫃.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10855', N'線稿', N'82008', N'https://buy.sakura.com.tw/files/10855/39多功能拉籃高櫃.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10857', N'線稿', N'82009', N'https://buy.sakura.com.tw/files/10857/40盤籃式拉籃高櫃(進口五金).pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10858', N'product_images', N'82009', N'https://buy.sakura.com.tw/media/10858/盤籃式拉籃高櫃.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10859', N'線稿', N'82010', N'https://buy.sakura.com.tw/files/10859/41圍籃高櫃.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10860', N'product_images', N'82010', N'https://buy.sakura.com.tw/media/10860/圍籃高櫃.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10861', N'product_images', N'82011', N'https://buy.sakura.com.tw/media/10861/多功能拉籃半高櫃.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10862', N'線稿', N'82011', N'https://buy.sakura.com.tw/files/10862/43多功能拉籃半高櫃.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10863', N'線稿', N'82012', N'https://buy.sakura.com.tw/files/10863/44多功能儲物半高櫃.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10864', N'product_images', N'82012', N'https://buy.sakura.com.tw/media/10864/多功能儲物半高櫃.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10866', N'線稿', N'82013', N'https://buy.sakura.com.tw/files/10866/46圍籃半高櫃.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10868', N'product_images', N'82014', N'https://buy.sakura.com.tw/media/10868/鋁質捲門半高櫃.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10869', N'線稿', N'82014', N'https://buy.sakura.com.tw/files/10869/47鋁質捲門半高櫃.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10870', N'線稿', N'82015', N'https://buy.sakura.com.tw/files/10870/51鋁框玻璃門按壓抽高櫃(有色桶身)_含LED鋁條嵌燈.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10872', N'product_images', N'82015', N'https://buy.sakura.com.tw/media/10872/鋁框玻璃門按壓抽高櫃.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10873', N'product_images', N'82016', N'https://buy.sakura.com.tw/media/10873/鋁框玻璃門疊櫃.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10874', N'線稿', N'82016', N'https://buy.sakura.com.tw/files/10874/52鋁框玻璃門疊櫃(有色桶身)_含LED鋁條嵌燈.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10875', N'線稿', N'82017', N'https://buy.sakura.com.tw/files/10875/53鋁框玻璃門吊櫃(有色桶身)_含LED鋁條嵌燈.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10876', N'product_images', N'82017', N'https://buy.sakura.com.tw/media/10876/鋁框玻璃門吊櫃.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10877', N'product_images', N'82018', N'https://buy.sakura.com.tw/media/10877/吊櫃銑LED溝槽.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10879', N'線稿', N'82019', N'https://buy.sakura.com.tw/files/10879/55-2門隔板高櫃_含LED鋁條嵌燈.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10880', N'product_images', N'82019', N'https://buy.sakura.com.tw/media/10880/2小3高內抽高櫃.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10881', N'product_images', N'82020', N'https://buy.sakura.com.tw/media/10881/IMG_6280_V1.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10882', N'product_images', N'82020', N'https://buy.sakura.com.tw/media/10882/IMG_6305_V1-(1).png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10883', N'product_images', N'82020', N'https://buy.sakura.com.tw/media/10883/IMG_6333.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10884', N'product_images', N'82020', N'https://buy.sakura.com.tw/media/10884/IMG_6348.png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10885', N'product_images', N'82020', N'https://buy.sakura.com.tw/media/10885/IMG_6365.png', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10886', N'使用手冊', N'82020', N'https://buy.sakura.com.tw/files/10886/檯面爐說明書_20240809.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10893', N'product_images', N'81890', N'https://buy.sakura.com.tw/media/10893/EH2651A6-800x800px.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10895', N'product_images', N'81888', N'https://buy.sakura.com.tw/media/10895/EH1851A6-800x800px.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10897', N'product_images', N'81899', N'https://buy.sakura.com.tw/media/10897/EH1251A6-800x800px.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10899', N'product_images', N'81897', N'https://buy.sakura.com.tw/media/10899/EH1251AL6-800x800px.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10901', N'product_images', N'82022', N'https://buy.sakura.com.tw/media/10901/accessories-(1)-thumb.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10902', N'線稿', N'82022', N'https://buy.sakura.com.tw/files/10902/45對開大型儲物半高櫃_0701更新.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10904', N'product_images', N'82023', N'https://buy.sakura.com.tw/media/10904/LED鋁條嵌燈部品.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10905', N'線稿', N'81711', N'https://buy.sakura.com.tw/files/10905/58活動摺疊桌地櫃.pdf', N'5094')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10906', N'線稿', N'81986', N'https://buy.sakura.com.tw/files/10906/57收納矮梯地櫃.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10907', N'線稿', N'81014', N'https://buy.sakura.com.tw/files/10907/59抽中抽地櫃.pdf', N'2627')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10908', N'線稿', N'82024', N'https://buy.sakura.com.tw/files/10908/60鋁方管活動推車.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10909', N'product_images', N'82024', N'https://buy.sakura.com.tw/media/10909/鋁方管活動推車.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10910', N'product_images', N'82025', N'https://buy.sakura.com.tw/media/10910/鋁方管層架吊櫃.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10911', N'線稿', N'82025', N'https://buy.sakura.com.tw/files/10911/61鋁方管層架吊櫃.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10913', N'product_images', N'82026', N'https://buy.sakura.com.tw/media/10913/鋁方管中島吊掛架-雙層.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10914', N'product_images', N'82027', N'https://buy.sakura.com.tw/media/10914/鋁方管中島吊掛架-單層.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10915', N'線稿', N'82027', N'https://buy.sakura.com.tw/files/10915/62鋁方管中島吊掛架-1300單層.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10916', N'線稿', N'82028', N'https://buy.sakura.com.tw/files/10916/63鋁方管旋轉桌.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10917', N'product_images', N'82028', N'https://buy.sakura.com.tw/media/10917/鋁方管旋轉桌.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10918', N'product_images', N'81017', N'https://buy.sakura.com.tw/media/10918/摺疊矮梯.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10919', N'product_images', N'81009', N'https://buy.sakura.com.tw/media/10919/犀利鉤黃金地段掛件組.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10920', N'product_images', N'82029', N'https://buy.sakura.com.tw/media/10920/巧易鉤LED燈掛件組.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10921', N'product_images', N'81010', N'https://buy.sakura.com.tw/media/10921/KESSEBOHMER黃金地段五金.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10922', N'product_images', N'82030', N'https://buy.sakura.com.tw/media/10922/霧黑易利鉤黃金地段掛件組.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10923', N'product_images', N'82031', N'https://buy.sakura.com.tw/media/10923/VOLPATO鋁層架組.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10924', N'線稿', N'80999', N'https://buy.sakura.com.tw/files/10924/1-SAKURA靜音緩衝抽屜地櫃.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10925', N'線稿', N'81191', N'https://buy.sakura.com.tw/files/10925/2-GRASS-SCALA靜音緩衝抽屜地櫃.pdf', N'3586')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10927', N'線稿', N'82032', N'https://buy.sakura.com.tw/files/10927/5-開放木抽地櫃.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10928', N'product_images', N'82032', N'https://buy.sakura.com.tw/media/10928/開放木抽地櫃.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10929', N'線稿', N'81992', N'https://buy.sakura.com.tw/files/10929/6-座式緩衝ST側拉籃地櫃(15cm).pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10932', N'線稿', N'81993', N'https://buy.sakura.com.tw/files/10932/7-座式緩衝ST側拉籃地櫃-(20、30cm)-D400.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10933', N'線稿', N'81993', N'https://buy.sakura.com.tw/files/10933/7-座式緩衝ST側拉籃地櫃-(20、30cm)-D500.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10934', N'線稿', N'81007', N'https://buy.sakura.com.tw/files/10934/8-座式緩衝塗裝側拉籃地櫃(20、30cm)-D400.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10935', N'線稿', N'81007', N'https://buy.sakura.com.tw/files/10935/8-座式緩衝塗裝側拉籃地櫃(20、30cm)-D500.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10936', N'線稿', N'81994', N'https://buy.sakura.com.tw/files/10936/9-盤籃式側拉籃地櫃(進口五金)PEKA.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10937', N'線稿', N'81995', N'https://buy.sakura.com.tw/files/10937/10-座式緩衝塗裝拉籃地櫃.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10938', N'線稿', N'81996', N'https://buy.sakura.com.tw/files/10938/11--座式緩衝ST拉籃地櫃.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10939', N'線稿', N'82033', N'https://buy.sakura.com.tw/files/10939/12--座式緩衝塗裝圍籃地櫃.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10940', N'product_images', N'82033', N'https://buy.sakura.com.tw/media/10940/座式緩衝塗裝圍籃地櫃.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10941', N'product_images', N'82034', N'https://buy.sakura.com.tw/media/10941/座式緩衝ST圍籃地櫃.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10942', N'線稿', N'82034', N'https://buy.sakura.com.tw/files/10942/13-座式緩衝ST圍籃地櫃.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10943', N'線稿', N'81997', N'https://buy.sakura.com.tw/files/10943/14-鋼珠緩衝圍籃地櫃.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10944', N'線稿', N'81008', N'https://buy.sakura.com.tw/files/10944/清潔圍籃地櫃-線圖.pdf', N'2604')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10945', N'線稿', N'80998', N'https://buy.sakura.com.tw/files/10945/16-轉角連桿功能地櫃.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10946', N'product_images', N'80998', N'https://buy.sakura.com.tw/media/10946/轉角連桿功能地櫃.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10948', N'線稿', N'80997', N'https://buy.sakura.com.tw/files/10948/17-轉角蝴蝶轉盤地櫃(進口五金).pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10949', N'線稿', N'80996', N'https://buy.sakura.com.tw/files/10949/18-轉角全展式盤籃地櫃(進口五金).pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10950', N'線稿', N'81998', N'https://buy.sakura.com.tw/files/10950/19--多功能收納盤籃式拉籃地櫃(進口五金).pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10952', N'線稿', N'81013', N'https://buy.sakura.com.tw/files/10952/20-多功能連動收納盤籃地櫃(進口五金).pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10953', N'線稿', N'82000', N'https://buy.sakura.com.tw/files/10953/21-籃盤式分類緩衝垃圾桶地櫃(進口五金).pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10954', N'線稿', N'82002', N'https://buy.sakura.com.tw/files/10954/22上掀門吊櫃-重.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10955', N'線稿', N'82002', N'https://buy.sakura.com.tw/files/10955/22上掀門吊櫃-輕.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10956', N'線稿', N'82035', N'https://buy.sakura.com.tw/files/10956/23斜掀門吊櫃.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10957', N'product_images', N'82035', N'https://buy.sakura.com.tw/media/10957/斜掀門吊櫃.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10958', N'線稿', N'80991', N'https://buy.sakura.com.tw/files/10958/24玻璃門板吊櫃.pdf', N'2611')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10959', N'線稿', N'80994', N'https://buy.sakura.com.tw/files/10959/26電動上掀吊櫃.pdf', N'2614')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10960', N'線稿', N'80990', N'https://buy.sakura.com.tw/files/10960/27電動上下摺門吊櫃.pdf', N'2610')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10961', N'product_images', N'80990', N'https://buy.sakura.com.tw/media/10961/電動上下摺門吊櫃.jpg', N'2611')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10962', N'線稿', N'82036', N'https://buy.sakura.com.tw/files/10962/28上下摺門吊櫃.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10963', N'product_images', N'82036', N'https://buy.sakura.com.tw/media/10963/上下摺門吊櫃.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10965', N'線稿', N'80988', N'https://buy.sakura.com.tw/files/10965/30下拉籃吊櫃.pdf', N'2608')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10966', N'product_images', N'80988', N'https://buy.sakura.com.tw/media/10966/下拉籃吊櫃.jpg', N'2609')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10967', N'product_images', N'80992', N'https://buy.sakura.com.tw/media/10967/電動升降吊櫃(A款).jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10968', N'線稿', N'80992', N'https://buy.sakura.com.tw/files/10968/31電動升降吊櫃(A款)(進口).pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10969', N'線稿', N'80993', N'https://buy.sakura.com.tw/files/10969/32電動升降吊櫃(B款)(進口).pdf', N'2613')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10970', N'product_images', N'80993', N'https://buy.sakura.com.tw/media/10970/電動升降吊櫃(B款).jpg', N'2614')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10971', N'線稿', N'82001', N'https://buy.sakura.com.tw/files/10971/34電動升降瀝水吊櫃.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10972', N'線稿', N'82037', N'https://buy.sakura.com.tw/files/10972/33電動升降收納吊櫃.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10973', N'product_images', N'82037', N'https://buy.sakura.com.tw/media/10973/電動升降收納吊櫃.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10974', N'線稿', N'82003', N'https://buy.sakura.com.tw/files/10974/42儲物盤籃高櫃(450進口五金).pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10975', N'線稿', N'82003', N'https://buy.sakura.com.tw/files/10975/42儲物盤籃高櫃(600進口五金).pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10977', N'線稿', N'82026', N'https://buy.sakura.com.tw/files/10977/62鋁方管中島吊掛架-2400雙層.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10978', N'線稿', N'82023', N'https://buy.sakura.com.tw/files/10978/LED鋁條嵌燈部品線稿.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10992', N'線稿', N'81982', N'https://buy.sakura.com.tw/files/10992/暫-GRASS-ProONE靜音緩衝抽屜地櫃.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10996', N'線稿', N'80100', N'https://buy.sakura.com.tw/files/10996/PDS880-牌價表線圖-32.pdf', N'1280')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'10997', N'線稿', N'80102', N'https://buy.sakura.com.tw/files/10997/PDS850W-牌價表線圖-33.pdf', N'1284')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11002', N'型錄', N'81913', N'https://buy.sakura.com.tw/files/11002/P0233A&P0235A-DM.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11017', N'product_images', N'82003', N'https://buy.sakura.com.tw/media/11017/圖片2.jpg', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11022', N'product_images', N'81191', N'https://buy.sakura.com.tw/media/11022/圖片3.jpg', N'3587')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11024', N'product_images', N'82042', N'https://buy.sakura.com.tw/media/11024/01.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11025', N'product_images', N'82042', N'https://buy.sakura.com.tw/media/11025/02.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11026', N'product_images', N'82042', N'https://buy.sakura.com.tw/media/11026/03.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11027', N'RoHS', N'82042', N'https://buy.sakura.com.tw/files/11027/E7881洗碗機[限用物質含有情況標示聲明書].pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11028', N'使用手冊', N'82042', N'https://buy.sakura.com.tw/files/11028/E7881說明書_240819_compressed-compressed-(1).pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11034', N'型錄', N'81687', N'https://buy.sakura.com.tw/media/11034/P0771生飲淨水器-A3DM.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11035', N'型錄', N'81688', N'https://buy.sakura.com.tw/media/11035/P0772生飲淨水器-A3DM.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11036', N'型錄', N'81689', N'https://buy.sakura.com.tw/media/11036/P0773生飲淨水器-A3DM.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11037', N'型錄', N'81142', N'https://buy.sakura.com.tw/files/11037/P0780_DM.pdf', N'5048')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11039', N'型錄', N'81373', N'https://buy.sakura.com.tw/files/11039/SAKURA-Water-P0782-快捷高效淨水器-.pdf', N'4750')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11040', N'product_images', N'81013', N'https://buy.sakura.com.tw/media/11040/多功能連動收納盤籃地櫃(進口五金).jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11045', N'product_images', N'82023', N'https://buy.sakura.com.tw/media/11045/部品1.jpg', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11046', N'product_images', N'82023', N'https://buy.sakura.com.tw/media/11046/部品2.jpg', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11047', N'product_images', N'82023', N'https://buy.sakura.com.tw/media/11047/部品3.jpg', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11048', N'product_images', N'82023', N'https://buy.sakura.com.tw/media/11048/部品4.jpg', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11049', N'product_images', N'82002', N'https://buy.sakura.com.tw/media/11049/上掀門吊櫃.jpg', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11050', N'線稿', N'80989', N'https://buy.sakura.com.tw/files/11050/29左右摺門吊櫃.pdf', N'2609')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11051', N'線稿', N'82018', N'https://buy.sakura.com.tw/files/11051/54吊櫃_銑LED溝槽.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11052', N'product_images', N'81014', N'https://buy.sakura.com.tw/media/11052/1724721716445.jpg', N'2628')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11053', N'product_images', N'81711', N'https://buy.sakura.com.tw/media/11053/1724721705460.jpg', N'5099')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11054', N'product_images', N'81711', N'https://buy.sakura.com.tw/media/11054/Joyful系列_產品特點7_活動摺疊桌地櫃_800x800-thumb-thumb.jpg', N'5100')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11055', N'product_images', N'81711', N'https://buy.sakura.com.tw/media/11055/活動摺疊桌地櫃2_800x800-thumb-thumb.jpg', N'5101')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11056', N'product_images', N'81711', N'https://buy.sakura.com.tw/media/11056/活動摺疊桌地櫃3_800x800-thumb-thumb.jpg', N'5102')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11057', N'線稿', N'81017', N'https://buy.sakura.com.tw/files/11057/64.摺疊矮梯_dimd-04421955.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11060', N'product_images', N'81935', N'https://buy.sakura.com.tw/media/11060/VE7190_3.png', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11061', N'product_images', N'81935', N'https://buy.sakura.com.tw/media/11061/VE7190_4.png', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11062', N'product_images', N'81935', N'https://buy.sakura.com.tw/media/11062/VE7190_5.png', N'8')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11064', N'型錄', N'81915', N'https://buy.sakura.com.tw/files/11064/SAKURA-water-P0531-P0585DM-2024.08.14-.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11065', N'product_images', N'81549', N'https://buy.sakura.com.tw/media/11065/SF-750A-02_800X800(導購)-slide.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11066', N'product_images', N'81549', N'https://buy.sakura.com.tw/media/11066/SF-750A-01-砧板-(去背)_800X800-thumb.jpg', N'4430')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11067', N'product_images', N'81549', N'https://buy.sakura.com.tw/media/11067/SF-750A-01-瀝水籃-(去背)800X800-thumb.jpg', N'4431')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11068', N'product_images', N'81550', N'https://buy.sakura.com.tw/media/11068/SF-850A-02不鏽鋼單槽(手工方型)水槽組-slide.jpg', N'4435')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11069', N'product_images', N'81550', N'https://buy.sakura.com.tw/media/11069/SF-850A-01-砧板-(去背)_800X800-thumb.jpg', N'4436')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11070', N'product_images', N'81550', N'https://buy.sakura.com.tw/media/11070/SF-850A-01-瀝水籃-(去背)800X800-thumb.jpg', N'4437')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11072', N'product_images', N'80661', N'https://buy.sakura.com.tw/media/11072/C10-1001_0-slide.jpg', N'4986')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11073', N'product_images', N'80661', N'https://buy.sakura.com.tw/media/11073/1713946378035-thumb-1-thumb.jpg', N'4987')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11074', N'product_images', N'80659', N'https://buy.sakura.com.tw/media/11074/C01-5001-大碗-黑金-01_0-slide.jpg', N'4999')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11075', N'product_images', N'80659', N'https://buy.sakura.com.tw/media/11075/1713946378035-thumb-1-thumb.jpg', N'5000')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11076', N'product_images', N'81186', N'https://buy.sakura.com.tw/media/11076/C07-5001-03_0-slide.jpg', N'4998')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11077', N'product_images', N'81186', N'https://buy.sakura.com.tw/media/11077/1713946378035-thumb-2-thumb.jpg', N'4999')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11084', N'product_images', N'81977', N'https://buy.sakura.com.tw/media/11084/LF1103019BK.jpg', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11085', N'product_images', N'81977', N'https://buy.sakura.com.tw/media/11085/LF1103019BK-02.jpg', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11086', N'product_images', N'81976', N'https://buy.sakura.com.tw/media/11086/LF119011MB.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11087', N'product_images', N'81976', N'https://buy.sakura.com.tw/media/11087/LF119011MB-02.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11088', N'product_images', N'81978', N'https://buy.sakura.com.tw/media/11088/LF119012LG.jpg', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11089', N'product_images', N'81978', N'https://buy.sakura.com.tw/media/11089/LF119012LG-02.jpg', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11090', N'product_images', N'81979', N'https://buy.sakura.com.tw/media/11090/LF119211BG.jpg', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11091', N'product_images', N'81979', N'https://buy.sakura.com.tw/media/11091/LF119211BG-02.jpg', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11094', N'product_images', N'80906', N'https://buy.sakura.com.tw/media/11094/LFD-0211_2.jpg', N'2829')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11095', N'product_images', N'80906', N'https://buy.sakura.com.tw/media/11095/LFD-0211_2-02.jpg', N'2830')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11100', N'product_images', N'80104', N'https://buy.sakura.com.tw/media/11100/DS740T.jpg', N'1289')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11101', N'product_images', N'80103', N'https://buy.sakura.com.tw/media/11101/PRS840T.jpg', N'1287')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11102', N'product_images', N'80101', N'https://buy.sakura.com.tw/media/11102/PDS840.jpg', N'1283')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11106', N'線稿', N'81168', N'https://buy.sakura.com.tw/files/11106/SKL303-牌價表線圖-1.pdf', N'3536')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11108', N'線稿', N'81167', N'https://buy.sakura.com.tw/files/11108/SKL006B-牌價表線圖-2.pdf', N'3535')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11110', N'線稿', N'81694', N'https://buy.sakura.com.tw/files/11110/SKL506A-03-牌價表線圖-3.pdf', N'4975')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11112', N'線稿', N'81180', N'https://buy.sakura.com.tw/files/11112/SKL505AF-牌價表線圖-4.pdf', N'3537')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11114', N'線稿', N'81181', N'https://buy.sakura.com.tw/files/11114/SKL301F-牌價表線圖-5.pdf', N'3538')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11116', N'線稿', N'81169', N'https://buy.sakura.com.tw/files/11116/SKL104F-牌價表線圖-6.pdf', N'3540')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11120', N'線稿', N'81696', N'https://buy.sakura.com.tw/files/11120/SPDL-V08-牌價表線圖-8.pdf', N'5016')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11124', N'線稿', N'81175', N'https://buy.sakura.com.tw/files/11124/SKL166-牌價表線圖-11.pdf', N'3543')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11125', N'線稿', N'81175', N'https://buy.sakura.com.tw/files/11125/SKL166L-牌價表線圖-12.pdf', N'3544')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11127', N'線稿', N'80401', N'https://buy.sakura.com.tw/files/11127/SPDL-860-牌價表線圖-13.pdf', N'2798')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11129', N'線稿', N'81551', N'https://buy.sakura.com.tw/files/11129/SF-550A-牌價表線圖-14.pdf', N'4441')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11131', N'線稿', N'81549', N'https://buy.sakura.com.tw/files/11131/SF-750A-01-牌價表線圖-15.pdf', N'4432')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11133', N'線稿', N'81550', N'https://buy.sakura.com.tw/files/11133/SF-850A-01-牌價表線圖-16.pdf', N'4438')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11136', N'線稿', N'81184', N'https://buy.sakura.com.tw/files/11136/SKL605L-牌價表線圖-17.pdf', N'3542')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11137', N'線稿', N'81184', N'https://buy.sakura.com.tw/files/11137/SKL605R-牌價表線圖-18.pdf', N'3543')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11141', N'線稿', N'81183', N'https://buy.sakura.com.tw/files/11141/SKL602-牌價表線圖-20.pdf', N'3541')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11143', N'線稿', N'80104', N'https://buy.sakura.com.tw/files/11143/DS740T-牌價表線圖-29.pdf', N'1290')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11144', N'使用手冊', N'80104', N'https://buy.sakura.com.tw/files/11144/水槽使用手冊.pdf', N'1291')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11145', N'使用手冊', N'81168', N'https://buy.sakura.com.tw/files/11145/水槽使用手冊.pdf', N'3537')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11146', N'使用手冊', N'81167', N'https://buy.sakura.com.tw/files/11146/水槽使用手冊.pdf', N'3536')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11147', N'使用手冊', N'81694', N'https://buy.sakura.com.tw/files/11147/水槽使用手冊.pdf', N'4976')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11148', N'使用手冊', N'81180', N'https://buy.sakura.com.tw/files/11148/水槽使用手冊.pdf', N'3538')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11149', N'使用手冊', N'81181', N'https://buy.sakura.com.tw/files/11149/水槽使用手冊.pdf', N'3539')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11150', N'使用手冊', N'81169', N'https://buy.sakura.com.tw/files/11150/水槽使用手冊.pdf', N'3541')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11152', N'使用手冊', N'81696', N'https://buy.sakura.com.tw/files/11152/水槽使用手冊.pdf', N'5017')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11154', N'使用手冊', N'81175', N'https://buy.sakura.com.tw/files/11154/水槽使用手冊.pdf', N'3545')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11155', N'使用手冊', N'80401', N'https://buy.sakura.com.tw/files/11155/水槽使用手冊.pdf', N'2799')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11156', N'使用手冊', N'81551', N'https://buy.sakura.com.tw/files/11156/水槽使用手冊.pdf', N'4442')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11157', N'使用手冊', N'81549', N'https://buy.sakura.com.tw/files/11157/水槽使用手冊.pdf', N'4433')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11158', N'使用手冊', N'81550', N'https://buy.sakura.com.tw/files/11158/水槽使用手冊.pdf', N'4439')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11159', N'使用手冊', N'81184', N'https://buy.sakura.com.tw/files/11159/水槽使用手冊.pdf', N'3544')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11161', N'使用手冊', N'81183', N'https://buy.sakura.com.tw/files/11161/水槽使用手冊.pdf', N'3542')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11162', N'線稿', N'80103', N'https://buy.sakura.com.tw/files/11162/PRS840T-牌價表線圖-30.pdf', N'1288')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11163', N'使用手冊', N'80103', N'https://buy.sakura.com.tw/files/11163/水槽使用手冊.pdf', N'1289')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11164', N'線稿', N'80101', N'https://buy.sakura.com.tw/files/11164/PDS840-牌價表線圖-31.pdf', N'1284')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11165', N'使用手冊', N'80101', N'https://buy.sakura.com.tw/files/11165/水槽使用手冊.pdf', N'1285')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11166', N'使用手冊', N'80100', N'https://buy.sakura.com.tw/files/11166/水槽使用手冊.pdf', N'1282')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11167', N'使用手冊', N'80102', N'https://buy.sakura.com.tw/files/11167/水槽使用手冊.pdf', N'1286')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11168', N'線稿', N'80660', N'https://buy.sakura.com.tw/files/11168/JB450W-牌價表線圖-21.pdf', N'2805')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11169', N'使用手冊', N'80660', N'https://buy.sakura.com.tw/files/11169/水槽使用手冊.pdf', N'2806')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11170', N'線稿', N'80662', N'https://buy.sakura.com.tw/files/11170/JB780W-牌價表線圖-22.pdf', N'2807')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11171', N'使用手冊', N'80662', N'https://buy.sakura.com.tw/files/11171/水槽使用手冊.pdf', N'2808')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11172', N'線稿', N'80663', N'https://buy.sakura.com.tw/files/11172/JB880W-牌價表線圖-23.pdf', N'2808')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11173', N'使用手冊', N'80663', N'https://buy.sakura.com.tw/files/11173/水槽使用手冊.pdf', N'2809')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11174', N'線稿', N'81698', N'https://buy.sakura.com.tw/files/11174/JB650B-牌價表線圖-24.pdf', N'4993')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11175', N'使用手冊', N'81698', N'https://buy.sakura.com.tw/files/11175/水槽使用手冊.pdf', N'4994')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11176', N'線稿', N'81699', N'https://buy.sakura.com.tw/files/11176/JB760B-牌價表線圖-25.pdf', N'5024')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11177', N'使用手冊', N'81699', N'https://buy.sakura.com.tw/files/11177/水槽使用手冊.pdf', N'5025')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11178', N'線稿', N'81952', N'https://buy.sakura.com.tw/files/11178/SA-2860-1-8-牌價表線圖-50.pdf', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11179', N'使用手冊', N'81952', N'https://buy.sakura.com.tw/files/11179/水槽使用手冊.pdf', N'8')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11180', N'線稿', N'81947', N'https://buy.sakura.com.tw/files/11180/SA-460-1-8-牌價表線圖-45.pdf', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11181', N'使用手冊', N'81947', N'https://buy.sakura.com.tw/files/11181/水槽使用手冊.pdf', N'8')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11182', N'線稿', N'81948', N'https://buy.sakura.com.tw/files/11182/SA-660-1-8-牌價表線圖-46.pdf', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11183', N'使用手冊', N'81948', N'https://buy.sakura.com.tw/files/11183/水槽使用手冊.pdf', N'8')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11184', N'線稿', N'81949', N'https://buy.sakura.com.tw/files/11184/SA-760-1-8-牌價表線圖-48.pdf', N'43')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11185', N'使用手冊', N'81949', N'https://buy.sakura.com.tw/files/11185/水槽使用手冊.pdf', N'44')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11186', N'線稿', N'81950', N'https://buy.sakura.com.tw/files/11186/SA-770-1-8-牌價表線圖-47.pdf', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11187', N'使用手冊', N'81950', N'https://buy.sakura.com.tw/files/11187/水槽使用手冊.pdf', N'8')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11188', N'線稿', N'81951', N'https://buy.sakura.com.tw/files/11188/SA-860-1-8-牌價表線圖-49.pdf', N'9')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11189', N'使用手冊', N'81951', N'https://buy.sakura.com.tw/files/11189/水槽使用手冊.pdf', N'10')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11190', N'線稿', N'80661', N'https://buy.sakura.com.tw/files/11190/C10-1001-牌價表線圖-26.pdf', N'4988')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11191', N'使用手冊', N'80661', N'https://buy.sakura.com.tw/files/11191/水槽使用手冊.pdf', N'4989')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11192', N'線稿', N'80659', N'https://buy.sakura.com.tw/files/11192/C01-1001-牌價表線圖-27.pdf', N'5001')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11193', N'使用手冊', N'80659', N'https://buy.sakura.com.tw/files/11193/水槽使用手冊.pdf', N'5002')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11194', N'線稿', N'81186', N'https://buy.sakura.com.tw/files/11194/C07-1001-牌價表線圖-28.pdf', N'5000')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11195', N'使用手冊', N'81186', N'https://buy.sakura.com.tw/files/11195/水槽使用手冊.pdf', N'5001')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11196', N'product_images', N'81951', N'https://buy.sakura.com.tw/media/11196/SA-860.jpg', N'11')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11197', N'product_images', N'81951', N'https://buy.sakura.com.tw/media/11197/1713943776321-thumb.jpg', N'12')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11198', N'product_images', N'81951', N'https://buy.sakura.com.tw/media/11198/1713943720106-thumb.jpg', N'13')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11199', N'product_images', N'81950', N'https://buy.sakura.com.tw/media/11199/SA-770.jpg', N'9')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11200', N'product_images', N'81950', N'https://buy.sakura.com.tw/media/11200/1713943776321-thumb.jpg', N'10')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11201', N'product_images', N'81950', N'https://buy.sakura.com.tw/media/11201/1713943720106-thumb.jpg', N'11')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11202', N'線稿', N'81177', N'https://buy.sakura.com.tw/files/11202/9.SKL105FL／R.pdf', N'3474')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11203', N'使用手冊', N'81177', N'https://buy.sakura.com.tw/files/11203/水槽使用手冊.pdf', N'3475')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11206', N'線稿', N'80893', N'https://buy.sakura.com.tw/files/11206/8.LFD_6033.pdf', N'2819')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11207', N'使用手冊', N'80893', N'https://buy.sakura.com.tw/files/11207/180803-水龍頭電子使用手冊.pdf', N'2820')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11208', N'線稿', N'80905', N'https://buy.sakura.com.tw/files/11208/9.LFD_0222_2.pdf', N'2795')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11209', N'使用手冊', N'80905', N'https://buy.sakura.com.tw/files/11209/180803-水龍頭電子使用手冊.pdf', N'2796')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11210', N'線稿', N'80833', N'https://buy.sakura.com.tw/files/11210/10.LF3036.pdf', N'2270')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11211', N'使用手冊', N'80833', N'https://buy.sakura.com.tw/files/11211/180803-水龍頭電子使用手冊.pdf', N'2271')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11212', N'線稿', N'80839', N'https://buy.sakura.com.tw/files/11212/11.LFD_3033.pdf', N'2815')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11213', N'使用手冊', N'80839', N'https://buy.sakura.com.tw/files/11213/180803-水龍頭電子使用手冊.pdf', N'2816')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11216', N'線稿', N'81778', N'https://buy.sakura.com.tw/files/11216/13.LF119022.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11217', N'使用手冊', N'81778', N'https://buy.sakura.com.tw/files/11217/180803-水龍頭電子使用手冊.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11220', N'使用手冊', N'81977', N'https://buy.sakura.com.tw/files/11220/180803-水龍頭電子使用手冊.pdf', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11221', N'使用手冊', N'81976', N'https://buy.sakura.com.tw/files/11221/180803-水龍頭電子使用手冊.pdf', N'10')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11222', N'使用手冊', N'81978', N'https://buy.sakura.com.tw/files/11222/180803-水龍頭電子使用手冊.pdf', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11223', N'使用手冊', N'81979', N'https://buy.sakura.com.tw/files/11223/180803-水龍頭電子使用手冊.pdf', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11224', N'線稿', N'80894', N'https://buy.sakura.com.tw/files/11224/14.LF5090.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11225', N'使用手冊', N'80894', N'https://buy.sakura.com.tw/files/11225/180803-水龍頭電子使用手冊.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11226', N'線稿', N'80906', N'https://buy.sakura.com.tw/files/11226/15.LFD_0211_2.pdf', N'2831')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11227', N'使用手冊', N'80906', N'https://buy.sakura.com.tw/files/11227/180803-水龍頭電子使用手冊.pdf', N'2832')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11232', N'線稿', N'80898', N'https://buy.sakura.com.tw/files/11232/2.LFD_3022.pdf', N'2792')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11235', N'線稿', N'80897', N'https://buy.sakura.com.tw/files/11235/4.LFD_2022.pdf', N'2389')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11236', N'使用手冊', N'80897', N'https://buy.sakura.com.tw/files/11236/180803-水龍頭電子使用手冊.pdf', N'2390')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11237', N'線稿', N'80899', N'https://buy.sakura.com.tw/files/11237/5.LFD_6022.pdf', N'2793')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11238', N'使用手冊', N'80899', N'https://buy.sakura.com.tw/files/11238/180803-水龍頭電子使用手冊.pdf', N'2794')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11239', N'線稿', N'80896', N'https://buy.sakura.com.tw/files/11239/6.LFD_0233_2.pdf', N'2790')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11240', N'使用手冊', N'80896', N'https://buy.sakura.com.tw/files/11240/180803-水龍頭電子使用手冊.pdf', N'2791')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11241', N'線稿', N'81779', N'https://buy.sakura.com.tw/files/11241/7.LF119033.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11242', N'使用手冊', N'81779', N'https://buy.sakura.com.tw/files/11242/180803-水龍頭電子使用手冊.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11243', N'product_images', N'81008', N'https://buy.sakura.com.tw/media/11243/清潔圍籃地櫃.jpg', N'2605')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11244', N'線稿', N'81003', N'https://buy.sakura.com.tw/files/11244/BLUM電動抽屜地櫃線圖.pdf', N'2597')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11245', N'線稿', N'82040', N'https://buy.sakura.com.tw/files/11245/F0252線圖.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11246', N'使用手冊', N'82040', N'https://buy.sakura.com.tw/files/11246/180803-水龍頭電子使用手冊.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11281', N'product_images', N'82057', N'https://buy.sakura.com.tw/media/11281/MWE-258-FI-800X800.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11282', N'說明書', N'82057', N'https://buy.sakura.com.tw/files/11282/MWE-258-FI-BK說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11283', N'RoHS', N'82057', N'https://buy.sakura.com.tw/files/11283/MWE-258-FI-BK-RoHS標示.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11285', N'product_images', N'81872', N'https://buy.sakura.com.tw/media/11285/CNL-6815-PLUS_800x800.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11288', N'product_images', N'82058', N'https://buy.sakura.com.tw/media/11288/CNL-9815-PLUS_800x800.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11293', N'product_images', N'82059', N'https://buy.sakura.com.tw/media/11293/SteamBox_800x800.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11294', N'product_images', N'82060', N'https://buy.sakura.com.tw/media/11294/DFI-76950_800x800.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11295', N'product_images', N'82061', N'https://buy.sakura.com.tw/media/11295/HLB-8550-SC_800x800.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11297', N'說明書', N'82061', N'https://buy.sakura.com.tw/files/11297/HLB-8550-SC說明書.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11298', N'product_images', N'82062', N'https://buy.sakura.com.tw/media/11298/HLC-8470-SC_800x800.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11302', N'說明書', N'82062', N'https://buy.sakura.com.tw/files/11302/HLC-8470-SC蒸烤箱_說明書.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11305', N'product_images', N'82063', N'https://buy.sakura.com.tw/media/11305/CLC-855-GM_800x800.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11312', N'說明書', N'81868', N'https://buy.sakura.com.tw/files/11312/CP-150-GS說明書.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11313', N'說明書', N'82063', N'https://buy.sakura.com.tw/files/11313/CLC-855-GM咖啡機-說明書.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11314', N'product_images', N'81868', N'https://buy.sakura.com.tw/media/11314/CP_152_GS_NIGHT_RIVER_BLACK-view3-(1).png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11315', N'型錄', N'81841', N'https://buy.sakura.com.tw/media/11315/櫻花_G2522BG_A4_DM_240827.jpg', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11316', N'使用手冊', N'82059', N'https://buy.sakura.com.tw/files/11316/The-SteamBox_cooking-book.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11317', N'型錄', N'81857', N'https://buy.sakura.com.tw/files/11317/EH櫻花儲熱式電熱水器_(標準款).pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11318', N'型錄', N'81856', N'https://buy.sakura.com.tw/files/11318/EH櫻花儲熱式電熱水器_(標準款).pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11319', N'型錄', N'81855', N'https://buy.sakura.com.tw/files/11319/EH櫻花儲熱式電熱水器_(標準款).pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11320', N'型錄', N'81854', N'https://buy.sakura.com.tw/files/11320/EH櫻花儲熱式電熱水器_(標準款).pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11321', N'型錄', N'81853', N'https://buy.sakura.com.tw/files/11321/EH櫻花儲熱式電熱水器_(標準款).pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11322', N'型錄', N'81852', N'https://buy.sakura.com.tw/files/11322/EH櫻花儲熱式電熱水器_(標準款).pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11323', N'型錄', N'81851', N'https://buy.sakura.com.tw/files/11323/EH櫻花儲熱式電熱水器_(標準款).pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11324', N'RoHS', N'81868', N'https://buy.sakura.com.tw/files/11324/CP-150-GS_RoHS.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11325', N'RoHS', N'82063', N'https://buy.sakura.com.tw/files/11325/CLC-855-GM_RoHS.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11326', N'RoHS', N'82062', N'https://buy.sakura.com.tw/files/11326/HLC-8470-SC_RoHS.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11327', N'RoHS', N'82061', N'https://buy.sakura.com.tw/files/11327/HLB-8550-SC_RoHS.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11328', N'使用手冊', N'81078', N'https://buy.sakura.com.tw/files/11328/E3625說明書0927.pdf', N'4939')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11329', N'product_images', N'83', N'https://buy.sakura.com.tw/media/11329/油網配件包_正面_20240918.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11330', N'product_images', N'82068', N'https://buy.sakura.com.tw/media/11330/油網配件包_正面_20240918-(1).png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11332', N'product_images', N'82070', N'https://buy.sakura.com.tw/media/11332/PP油網_正面_20240918.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11334', N'說明書', N'81872', N'https://buy.sakura.com.tw/files/11334/CNL-9815-&-CNL-6815-PLUS-油機說明書.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11335', N'說明書', N'82058', N'https://buy.sakura.com.tw/files/11335/CNL-9815-&-CNL-6815-PLUS-油機說明書.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11336', N'型錄', N'81964', N'https://buy.sakura.com.tw/files/11336/櫻花_G2929G精控爐_DM_241025.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11337', N'product_images', N'82069', N'https://buy.sakura.com.tw/media/11337/RA-008.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11338', N'型錄', N'82042', N'https://buy.sakura.com.tw/files/11338/櫻花_洗碗機系列_摺頁DM_240730.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11341', N'型錄', N'81387', N'https://buy.sakura.com.tw/media/11341/A4DM-2024.08.14.jpg', N'5038')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11343', N'型錄', N'81960', N'https://buy.sakura.com.tw/files/11343/SAKURA-water-P0531廚下RO雙溫淨熱飲-三折DM-2024.06-3.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11345', N'型錄', N'81679', N'https://buy.sakura.com.tw/files/11345/svago_VE7545.pdf', N'4858')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11346', N'型錄', N'81966', N'https://buy.sakura.com.tw/files/11346/svago_VDR7191油煙機.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11347', N'型錄', N'81967', N'https://buy.sakura.com.tw/files/11347/svago_VDR7191油煙機.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11348', N'型錄', N'81281', N'https://buy.sakura.com.tw/files/11348/svago_VR7150S_A4-DM.pdf', N'3934')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11350', N'型錄', N'81282', N'https://buy.sakura.com.tw/files/11350/svago_VR7150S_A4-DM.pdf', N'3932')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11395', N'使用手冊', N'81911', N'https://buy.sakura.com.tw/files/11395/R7351.R7352.R9351.R9352說明書2024.12.10.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11397', N'使用手冊', N'81912', N'https://buy.sakura.com.tw/files/11397/R7351.R7352.R9351.R9352說明書2024.12.10.pdf', N'11')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11399', N'使用手冊', N'81962', N'https://buy.sakura.com.tw/files/11399/DR7396(H).DR9396(H)說明書2024.12.10.pdf', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11403', N'線稿', N'80402', N'https://buy.sakura.com.tw/files/11403/16.SKL668NW.pdf', N'3517')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11404', N'使用手冊', N'80402', N'https://buy.sakura.com.tw/files/11404/水槽使用手冊.pdf', N'3518')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11407', N'線稿', N'81176', N'https://buy.sakura.com.tw/files/11407/7.SKL101BA_240820更新.pdf', N'3548')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11408', N'使用手冊', N'81176', N'https://buy.sakura.com.tw/files/11408/水槽使用手冊.pdf', N'3549')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11415', N'使用手冊', N'81834', N'https://buy.sakura.com.tw/files/11415/落地嵌門Q說明書_20241220.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11417', N'使用手冊', N'81838', N'https://buy.sakura.com.tw/files/11417/落地嵌門Q說明書_20241220.pdf', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11418', N'使用手冊', N'81196', N'https://buy.sakura.com.tw/files/11418/落地嵌門Q說明書_20241220.pdf', N'4376')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11419', N'使用手冊', N'1019', N'https://buy.sakura.com.tw/files/11419/落地嵌門Q說明書_20241220.pdf', N'2520')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11420', N'使用手冊', N'80795', N'https://buy.sakura.com.tw/files/11420/落地嵌門Q說明書_20241220.pdf', N'4373')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11421', N'使用手冊', N'1018', N'https://buy.sakura.com.tw/files/11421/落地嵌門Q說明書_20241220.pdf', N'4939')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11422', N'使用手冊', N'80351', N'https://buy.sakura.com.tw/files/11422/落地嵌門Q說明書_20241220.pdf', N'2526')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11423', N'使用手冊', N'81547', N'https://buy.sakura.com.tw/files/11423/落地嵌門Q說明書_20241220.pdf', N'4940')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11424', N'使用手冊', N'1010', N'https://buy.sakura.com.tw/files/11424/落地嵌門Q說明書_20241220.pdf', N'4936')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11434', N'使用手冊', N'82085', N'https://buy.sakura.com.tw/files/11434/VG2528G瓦斯爐說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11435', N'product_images', N'82085', N'https://buy.sakura.com.tw/media/11435/VG2528官網圖.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11440', N'使用手冊', N'82086', N'https://buy.sakura.com.tw/files/11440/說明書_P0775_P9775_FA.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11450', N'product_images', N'82088', N'https://buy.sakura.com.tw/media/11450/20241231_櫻花淨水_P0261機體+龍頭_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11451', N'product_images', N'82088', N'https://buy.sakura.com.tw/media/11451/20241231_櫻花淨水_P0261龍頭_左側面_800x800px.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11454', N'product_images', N'82089', N'https://buy.sakura.com.tw/media/11454/20241231_櫻花淨水_P0262機體+龍頭_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11455', N'product_images', N'82089', N'https://buy.sakura.com.tw/media/11455/20241231_櫻花淨水_P0262龍頭_右側面_800x800px.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11457', N'product_images', N'82090', N'https://buy.sakura.com.tw/media/11457/20241231_櫻花淨水_P0265機體+龍頭_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11458', N'product_images', N'82090', N'https://buy.sakura.com.tw/media/11458/20241231_櫻花淨水_P0265龍頭_左側面_800x800px.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11460', N'product_images', N'82091', N'https://buy.sakura.com.tw/media/11460/20241231_櫻花淨水_P0266機體+龍頭_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11461', N'product_images', N'82091', N'https://buy.sakura.com.tw/media/11461/20241231_櫻花淨水_P0266龍頭_右側面_800x800px.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11463', N'product_images', N'82086', N'https://buy.sakura.com.tw/media/11463/20241231_櫻花淨水_P0775機體+龍頭_460x460px.png', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11477', N'product_images', N'82096', N'https://buy.sakura.com.tw/media/11477/VEG2320官網圖.jpeg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11478', N'使用手冊', N'82096', N'https://buy.sakura.com.tw/files/11478/VEG2320橫式雙口感應爐說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11480', N'RoHS', N'82096', N'https://buy.sakura.com.tw/files/11480/VEG2320-限用物質含有情況標示聲明書.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11482', N'使用手冊', N'81961', N'https://buy.sakura.com.tw/files/11482/P5530說明書_0121.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11484', N'型錄', N'82086', N'https://buy.sakura.com.tw/files/11484/P0775_DM.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11488', N'型錄', N'82088', N'https://buy.sakura.com.tw/files/11488/P0261_P0262_DM-s.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11491', N'型錄', N'82089', N'https://buy.sakura.com.tw/files/11491/P0261_P0262_DM-s.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11494', N'product_images', N'82040', N'https://buy.sakura.com.tw/media/11494/給皂器_1_re.jpg', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11495', N'product_images', N'82040', N'https://buy.sakura.com.tw/media/11495/給皂器_2_re.jpg', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11496', N'product_images', N'80894', N'https://buy.sakura.com.tw/media/11496/伸縮_廚房無鉛伸縮龍頭_LF5090_部件_re.jpg', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11499', N'product_images', N'80906', N'https://buy.sakura.com.tw/media/11499/伸縮_無鉛伸縮龍頭_LFD-0211_1_re.jpg', N'2833')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11500', N'product_images', N'80906', N'https://buy.sakura.com.tw/media/11500/伸縮_無鉛伸縮龍頭_LFD-0211_部件_re.jpg', N'2834')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11503', N'product_images', N'81977', N'https://buy.sakura.com.tw/media/11503/伸縮_不鏽鋼無鉛伸縮龍頭_LF1103019BK_1_re.jpg', N'8')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11505', N'product_images', N'81979', N'https://buy.sakura.com.tw/media/11505/伸縮_不鏽鋼無鉛伸縮龍頭_LF119211BG_1_re.jpg', N'8')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11506', N'product_images', N'81979', N'https://buy.sakura.com.tw/media/11506/伸縮_不鏽鋼無鉛伸縮龍頭_LF119211BG_部件_re.jpg', N'9')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11508', N'product_images', N'81978', N'https://buy.sakura.com.tw/media/11508/伸縮_不鏽鋼無鉛伸縮龍頭_LF119012LG_部件_re.jpg', N'11')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11510', N'product_images', N'81976', N'https://buy.sakura.com.tw/media/11510/伸縮_不鏽鋼無鉛伸縮龍頭_LF119011MB_部件_re.jpg', N'14')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11511', N'product_images', N'80833', N'https://buy.sakura.com.tw/media/11511/立式_廚房無鉛立式龍頭_LF3036_1_re.jpg', N'2272')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11512', N'product_images', N'80833', N'https://buy.sakura.com.tw/media/11512/立式_廚房無鉛立式龍頭_LF3036_部件_re.jpg', N'2273')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11515', N'product_images', N'80905', N'https://buy.sakura.com.tw/media/11515/立式_無鉛立式龍頭_LFD-0222_1_re.jpg', N'2797')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11516', N'product_images', N'80905', N'https://buy.sakura.com.tw/media/11516/立式_無鉛立式龍頭_LFD-0222_部件_re.jpg', N'2798')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11517', N'product_images', N'80893', N'https://buy.sakura.com.tw/media/11517/立式_無鉛立式龍頭_LFD_6033_1_re.jpg', N'2821')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11518', N'product_images', N'80893', N'https://buy.sakura.com.tw/media/11518/立式_無鉛立式龍頭_LFD_6033_部件_re.jpg', N'2822')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11519', N'product_images', N'80839', N'https://buy.sakura.com.tw/media/11519/立式_無鉛立式龍頭_LFD_3033_1_re.jpg', N'2817')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11520', N'product_images', N'80839', N'https://buy.sakura.com.tw/media/11520/立式_無鉛立式龍頭_LFD_3033_部件_re.jpg', N'2818')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11522', N'product_images', N'81778', N'https://buy.sakura.com.tw/media/11522/立式_不鏽鋼無鉛立式龍頭_LF119022_部件_re.jpg', N'9')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11525', N'product_images', N'80896', N'https://buy.sakura.com.tw/media/11525/三用_無鉛三用龍頭_LFD-0233_1_re.jpg', N'2792')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11526', N'product_images', N'80896', N'https://buy.sakura.com.tw/media/11526/三用_無鉛三用龍頭_LFD-0233_部件_re.jpg', N'2793')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11527', N'product_images', N'80899', N'https://buy.sakura.com.tw/media/11527/三用_無鉛三用龍頭_LFD_6022_1_re.jpg', N'2795')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11528', N'product_images', N'80899', N'https://buy.sakura.com.tw/media/11528/三用_無鉛三用龍頭_LFD_6022_部件_re.jpg', N'2796')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11529', N'product_images', N'80898', N'https://buy.sakura.com.tw/media/11529/三用_無鉛三用龍頭_LFD_3022_1_re.jpg', N'2793')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11530', N'product_images', N'80898', N'https://buy.sakura.com.tw/media/11530/三用_無鉛三用龍頭_LFD_3022_部件_re.jpg', N'2794')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11531', N'product_images', N'80897', N'https://buy.sakura.com.tw/media/11531/三用_無鉛三用龍頭_LFD_2022_1_re.jpg', N'2391')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11532', N'product_images', N'80897', N'https://buy.sakura.com.tw/media/11532/三用_無鉛三用龍頭_LFD_2022_部件_re.jpg', N'2392')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11533', N'product_images', N'81779', N'https://buy.sakura.com.tw/media/11533/三用_不鏽鋼無鉛三用龍頭_LF119033_1_re.jpg', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11534', N'product_images', N'81779', N'https://buy.sakura.com.tw/media/11534/三用_不鏽鋼無鉛三用龍頭_LF119033_部件_re.jpg', N'8')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11535', N'使用手冊', N'81935', N'https://buy.sakura.com.tw/files/11535/VE7190-說明書_2025.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11536', N'product_images', N'80894', N'https://buy.sakura.com.tw/media/11536/伸縮_廚房無鉛伸縮龍頭_LF5090_1_re.jpg', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11543', N'使用手冊', N'1005', N'https://buy.sakura.com.tw/files/11543/E7682_E9682說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11546', N'使用手冊', N'1004', N'https://buy.sakura.com.tw/files/11546/E7782_E9782說明書-(1).pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11551', N'使用手冊', N'81857', N'https://buy.sakura.com.tw/files/11551/標準系列說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11552', N'使用手冊', N'81856', N'https://buy.sakura.com.tw/files/11552/標準系列說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11553', N'使用手冊', N'81855', N'https://buy.sakura.com.tw/files/11553/標準系列說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11554', N'使用手冊', N'81854', N'https://buy.sakura.com.tw/files/11554/標準系列說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11555', N'使用手冊', N'81853', N'https://buy.sakura.com.tw/files/11555/標準系列說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11556', N'使用手冊', N'81852', N'https://buy.sakura.com.tw/files/11556/標準系列說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11557', N'使用手冊', N'81851', N'https://buy.sakura.com.tw/files/11557/標準系列說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11560', N'product_images', N'82088', N'https://buy.sakura.com.tw/media/11560/20241231_櫻花淨水_P0261龍頭_正面_800x800px.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11561', N'使用手冊', N'81584', N'https://buy.sakura.com.tw/files/11561/E省電系列說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11563', N'型錄', N'81584', N'https://buy.sakura.com.tw/files/11563/e省電系列型錄.pdf', N'4625')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11564', N'使用手冊', N'81619', N'https://buy.sakura.com.tw/files/11564/E省電系列說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11566', N'使用手冊', N'81618', N'https://buy.sakura.com.tw/files/11566/E省電系列說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11567', N'使用手冊', N'81582', N'https://buy.sakura.com.tw/files/11567/E省電系列說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11568', N'使用手冊', N'81893', N'https://buy.sakura.com.tw/files/11568/倍容及倍容定溫系列說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11569', N'使用手冊', N'81891', N'https://buy.sakura.com.tw/files/11569/倍容及倍容定溫系列說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11570', N'使用手冊', N'81898', N'https://buy.sakura.com.tw/files/11570/倍容及倍容定溫系列說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11574', N'product_images', N'82088', N'https://buy.sakura.com.tw/media/11574/20241231_櫻花淨水_P0261龍頭_右側面_800x800px.png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11575', N'product_images', N'82088', N'https://buy.sakura.com.tw/media/11575/20241231_櫻花淨水_P0261機體_800x800px.png', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11576', N'使用手冊', N'81896', N'https://buy.sakura.com.tw/files/11576/倍容及倍容定溫系列說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11577', N'使用手冊', N'81902', N'https://buy.sakura.com.tw/files/11577/倍容及倍容定溫系列說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11580', N'使用手冊', N'81063', N'https://buy.sakura.com.tw/files/11580/倍容及倍容定溫系列說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11581', N'使用手冊', N'80917', N'https://buy.sakura.com.tw/files/11581/倍容及倍容定溫系列說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11582', N'product_images', N'82089', N'https://buy.sakura.com.tw/media/11582/20241231_櫻花淨水_P0262龍頭_左側面_800x800px.png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11583', N'product_images', N'82089', N'https://buy.sakura.com.tw/media/11583/20241231_櫻花淨水_P0262龍頭_正面_800x800px.png', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11584', N'使用手冊', N'81899', N'https://buy.sakura.com.tw/files/11584/倍容及倍容定溫系列說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11585', N'product_images', N'82089', N'https://buy.sakura.com.tw/media/11585/20241231_櫻花淨水_P0262機體_800x800px.png', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11586', N'使用手冊', N'81897', N'https://buy.sakura.com.tw/files/11586/倍容及倍容定溫系列說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11587', N'product_images', N'82090', N'https://buy.sakura.com.tw/media/11587/20241231_櫻花淨水_P0265龍頭_右側面_800x800px.png', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11588', N'product_images', N'82090', N'https://buy.sakura.com.tw/media/11588/20241231_櫻花淨水_P0265龍頭_正面_800x800px.png', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11589', N'使用手冊', N'81888', N'https://buy.sakura.com.tw/files/11589/倍容及倍容定溫系列說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11590', N'product_images', N'82090', N'https://buy.sakura.com.tw/media/11590/20241231_櫻花淨水_P0265機體_800x800px.png', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11591', N'使用手冊', N'81890', N'https://buy.sakura.com.tw/files/11591/倍容及倍容定溫系列說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11592', N'product_images', N'82091', N'https://buy.sakura.com.tw/media/11592/20241231_櫻花淨水_P0265龍頭_左側面_800x800px.png', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11593', N'product_images', N'82091', N'https://buy.sakura.com.tw/media/11593/20241231_櫻花淨水_P0265龍頭_正面_800x800px.png', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11594', N'product_images', N'82091', N'https://buy.sakura.com.tw/media/11594/20241231_櫻花淨水_P0265機體_800x800px.png', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11610', N'product_images', N'81976', N'https://buy.sakura.com.tw/media/11610/不鏽鋼無鉛伸縮龍頭_LF119011MB_re.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11611', N'product_images', N'81978', N'https://buy.sakura.com.tw/media/11611/不鏽鋼無鉛伸縮龍頭_LF119012LG_re.jpg', N'10')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11612', N'product_images', N'81977', N'https://buy.sakura.com.tw/media/11612/伸縮_不鏽鋼無鉛伸縮龍頭_LF1103019BK_感應器_re.jpg', N'9')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11626', N'使用手冊', N'82099', N'https://buy.sakura.com.tw/files/11626/E3621A說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11640', N'使用手冊', N'81491', N'https://buy.sakura.com.tw/files/11640/VE8966說明書_2025.pdf', N'4761')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11641', N'型錄', N'1005', N'https://buy.sakura.com.tw/files/11641/E7682_E7782-E9682_E9782-DM.pdf', N'4548')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11642', N'型錄', N'1004', N'https://buy.sakura.com.tw/files/11642/E7682_E7782-E9682_E9782-DM.pdf', N'4549')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11678', N'product_images', N'80659', N'https://buy.sakura.com.tw/media/11678/德國珂瑞_花崗岩單槽水槽組_C10、C01_小提籠_進口U排_有溢_RE.jpg', N'5003')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11679', N'product_images', N'81186', N'https://buy.sakura.com.tw/media/11679/德國珂瑞_花崗岩單槽水槽組_C07_小提籠_進口U排_無溢_RE.jpg', N'5002')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11682', N'product_images', N'80661', N'https://buy.sakura.com.tw/media/11682/德國珂瑞_花崗岩單槽水槽組_C10_小提籠_進口U排_有溢_RE.jpg', N'4990')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11688', N'product_images', N'81696', N'https://buy.sakura.com.tw/media/11688/不鏽鋼水槽_SPDL-V08、SPDL860、SF-550A、SF-750A-01、SF-850A-01-RE.jpg', N'5020')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11689', N'product_images', N'81696', N'https://buy.sakura.com.tw/media/11689/花崗岩單槽水槽組_SA-460-660-760-770-860_防蟑防臭排水管_RE.jpg', N'5021')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11690', N'product_images', N'80401', N'https://buy.sakura.com.tw/media/11690/不鏽鋼水槽_SPDL-V08、SPDL860、SF-550A、SF-750A-01、SF-850A-01-RE.jpg', N'2802')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11691', N'product_images', N'80401', N'https://buy.sakura.com.tw/media/11691/花崗岩單槽水槽組_SA-460-660-760-770-860_防蟑防臭排水管_RE.jpg', N'2803')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11692', N'product_images', N'81551', N'https://buy.sakura.com.tw/media/11692/不鏽鋼水槽_SPDL-V08、SPDL860、SF-550A、SF-750A-01、SF-850A-01-RE.jpg', N'4445')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11693', N'product_images', N'81551', N'https://buy.sakura.com.tw/media/11693/花崗岩單槽水槽組_SA-460-660-760-770-860_防蟑防臭排水管_RE.jpg', N'4446')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11694', N'product_images', N'81549', N'https://buy.sakura.com.tw/media/11694/不鏽鋼水槽_SPDL-V08、SPDL860、SF-550A、SF-750A-01、SF-850A-01-RE.jpg', N'4436')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11695', N'product_images', N'81549', N'https://buy.sakura.com.tw/media/11695/花崗岩單槽水槽組_SA-460-660-760-770-860_防蟑防臭排水管_RE.jpg', N'4437')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11696', N'product_images', N'81550', N'https://buy.sakura.com.tw/media/11696/不鏽鋼水槽_SPDL-V08、SPDL860、SF-550A、SF-750A-01、SF-850A-01-RE.jpg', N'4442')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11697', N'product_images', N'81550', N'https://buy.sakura.com.tw/media/11697/花崗岩單槽水槽組_SA-460-660-760-770-860_防蟑防臭排水管_RE.jpg', N'4443')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11698', N'product_images', N'81952', N'https://buy.sakura.com.tw/media/11698/花崗岩水槽_平蓋不鏽鋼下水器_RE.jpg', N'11')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11699', N'product_images', N'81952', N'https://buy.sakura.com.tw/media/11699/花崗岩雙槽水槽組_SA2860_防蟑防臭排水管_RE.jpg', N'12')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11700', N'product_images', N'81947', N'https://buy.sakura.com.tw/media/11700/花崗岩水槽_平蓋不鏽鋼下水器_RE.jpg', N'11')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11701', N'product_images', N'81947', N'https://buy.sakura.com.tw/media/11701/花崗岩單槽水槽組_SA-460-660-760-770-860_防蟑防臭排水管_RE.jpg', N'12')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11702', N'product_images', N'81948', N'https://buy.sakura.com.tw/media/11702/花崗岩水槽_平蓋不鏽鋼下水器_RE.jpg', N'11')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11703', N'product_images', N'81948', N'https://buy.sakura.com.tw/media/11703/花崗岩單槽水槽組_SA-460-660-760-770-860_防蟑防臭排水管_RE.jpg', N'12')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11704', N'product_images', N'81949', N'https://buy.sakura.com.tw/media/11704/花崗岩水槽_平蓋不鏽鋼下水器_RE.jpg', N'47')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11705', N'product_images', N'81949', N'https://buy.sakura.com.tw/media/11705/花崗岩單槽水槽組_SA-460-660-760-770-860_防蟑防臭排水管_RE.jpg', N'48')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11706', N'product_images', N'81950', N'https://buy.sakura.com.tw/media/11706/花崗岩水槽_平蓋不鏽鋼下水器_RE.jpg', N'14')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11707', N'product_images', N'81950', N'https://buy.sakura.com.tw/media/11707/花崗岩單槽水槽組_SA-460-660-760-770-860_防蟑防臭排水管_RE.jpg', N'15')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11708', N'product_images', N'81951', N'https://buy.sakura.com.tw/media/11708/花崗岩水槽_平蓋不鏽鋼下水器_RE.jpg', N'16')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11709', N'product_images', N'81951', N'https://buy.sakura.com.tw/media/11709/花崗岩單槽水槽組_SA-460-660-760-770-860_防蟑防臭排水管_RE.jpg', N'17')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11710', N'product_images', N'81032', N'https://buy.sakura.com.tw/media/11710/20250318_櫻花淨水_F0151官網適用濾心圖片_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11711', N'product_images', N'81029', N'https://buy.sakura.com.tw/media/11711/20250318_櫻花淨水_F0161官網適用濾心圖片_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11712', N'product_images', N'81427', N'https://buy.sakura.com.tw/media/11712/20250318_櫻花淨水_F0162官網適用濾心圖片_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11713', N'product_images', N'81030', N'https://buy.sakura.com.tw/media/11713/20250318_櫻花淨水_F0181官網適用濾心圖片_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11716', N'product_images', N'82092', N'https://buy.sakura.com.tw/media/11716/20250318_櫻花淨水_F0187官網適用濾心圖片_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11717', N'product_images', N'81968', N'https://buy.sakura.com.tw/media/11717/20250318_櫻花淨水_F3180官網適用濾心圖片_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11718', N'product_images', N'82087', N'https://buy.sakura.com.tw/media/11718/20250324_櫻花淨水_F0265官網適用濾心圖片_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11727', N'product_images', N'82099', N'https://buy.sakura.com.tw/media/11727/IMG_0932_800x800-2.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11747', N'product_images', N'81606', N'https://buy.sakura.com.tw/media/11747/20250318_櫻花淨水_F2192官網適用濾心圖片_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11748', N'product_images', N'81607', N'https://buy.sakura.com.tw/media/11748/20250318_櫻花淨水_F2193官網適用濾心圖片_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11749', N'product_images', N'82099', N'https://buy.sakura.com.tw/media/11749/IMG_1016s.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11751', N'product_images', N'81608', N'https://buy.sakura.com.tw/media/11751/20250318_櫻花淨水_F02194官網適用濾心圖片_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11752', N'product_images', N'82099', N'https://buy.sakura.com.tw/media/11752/IMG_1074-(1).png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11753', N'product_images', N'81609', N'https://buy.sakura.com.tw/media/11753/20250318_櫻花淨水_F2195官網適用濾心圖片_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11754', N'product_images', N'81610', N'https://buy.sakura.com.tw/media/11754/20250318_櫻花淨水_F02196官網適用濾心圖片_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11755', N'product_images', N'81859', N'https://buy.sakura.com.tw/media/11755/20250318_櫻花淨水_F9001官網適用濾心圖片_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11756', N'product_images', N'81860', N'https://buy.sakura.com.tw/media/11756/20250318_櫻花淨水_F9002官網適用濾心圖片_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11757', N'product_images', N'81861', N'https://buy.sakura.com.tw/media/11757/20250318_櫻花淨水_F9003官網適用濾心圖片_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11758', N'product_images', N'81863', N'https://buy.sakura.com.tw/media/11758/20250318_櫻花淨水_F9005官網適用濾心圖片_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11759', N'product_images', N'81100', N'https://buy.sakura.com.tw/media/11759/20250318_櫻花淨水_F0196官網適用濾心圖片_800x800px.png', N'3925')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11760', N'product_images', N'81099', N'https://buy.sakura.com.tw/media/11760/20250318_櫻花淨水_F0195官網適用濾心圖片_800x800px.png', N'3923')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11761', N'product_images', N'81098', N'https://buy.sakura.com.tw/media/11761/20250318_櫻花淨水_F0194官網適用濾心圖片_800x800px.png', N'3921')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11762', N'product_images', N'81097', N'https://buy.sakura.com.tw/media/11762/20250318_櫻花淨水_F0193官網適用濾心圖片_800x800px.png', N'3919')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11763', N'product_images', N'81096', N'https://buy.sakura.com.tw/media/11763/20250318_櫻花淨水_F0192官網適用濾心圖片_800x800px.png', N'3917')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11764', N'product_images', N'81095', N'https://buy.sakura.com.tw/media/11764/20250318_櫻花淨水_F0191官網適用濾心圖片_800x800px.png', N'3915')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11767', N'product_images', N'82101', N'https://buy.sakura.com.tw/media/11767/20250318_櫻花淨水_F2197官網適用濾心圖片_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11768', N'product_images', N'82102', N'https://buy.sakura.com.tw/media/11768/20250318_櫻花淨水_F0197官網適用濾心圖片_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11771', N'product_images', N'81167', N'https://buy.sakura.com.tw/media/11771/1_國產108mm小提籠_無溢_提籠合成圖_re.jpg', N'3539')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11772', N'product_images', N'81167', N'https://buy.sakura.com.tw/media/11772/1_單槽專用ST排水管組_120cm_re.jpg', N'3540')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11775', N'product_images', N'81168', N'https://buy.sakura.com.tw/media/11775/2_國產108mm小提籠_有溢_提籠合成圖_re.jpg', N'3540')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11776', N'product_images', N'81168', N'https://buy.sakura.com.tw/media/11776/2_單槽專用ST排水管組_120cm_re.jpg', N'3541')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11779', N'product_images', N'81694', N'https://buy.sakura.com.tw/media/11779/3_國產145mm中提籠_有溢_提籠合成圖_re.jpg', N'4979')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11780', N'product_images', N'81694', N'https://buy.sakura.com.tw/media/11780/3_單槽專用ST排水管組_120cm_re.jpg', N'4980')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11783', N'product_images', N'81181', N'https://buy.sakura.com.tw/media/11783/3_國產145mm中提籠_有溢_提籠合成圖_re.jpg', N'3542')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11784', N'product_images', N'81181', N'https://buy.sakura.com.tw/media/11784/3_單槽專用ST排水管組_120cm_re.jpg', N'3543')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11787', N'product_images', N'81169', N'https://buy.sakura.com.tw/media/11787/3_國產145mm中提籠_有溢_提籠合成圖_re.jpg', N'3544')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11788', N'product_images', N'81169', N'https://buy.sakura.com.tw/media/11788/3_單槽專用ST排水管組_120cm_re.jpg', N'3545')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11795', N'product_images', N'81176', N'https://buy.sakura.com.tw/media/11795/4_國產180mm大提籠_無溢_提籠合成圖_re.jpg', N'3552')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11796', N'product_images', N'81176', N'https://buy.sakura.com.tw/media/11796/4_單槽專用ST排水管組_120cm_re.jpg', N'3553')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11799', N'product_images', N'81180', N'https://buy.sakura.com.tw/media/11799/5_國產145mm中提籠_有溢_提籠合成圖_re.jpg', N'3541')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11800', N'product_images', N'81180', N'https://buy.sakura.com.tw/media/11800/5_單槽專用ST排水管組_re.jpg', N'3542')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11803', N'product_images', N'81177', N'https://buy.sakura.com.tw/media/11803/6_國產180mm大提籠_無溢_提籠合成圖_re.jpg', N'3478')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11804', N'product_images', N'81177', N'https://buy.sakura.com.tw/media/11804/6_單槽專用ST排水管組90cm_re.jpg', N'3479')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11807', N'product_images', N'81175', N'https://buy.sakura.com.tw/media/11807/6_國產180mm大提籠_無溢_提籠合成圖_re.jpg', N'3548')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11808', N'product_images', N'81175', N'https://buy.sakura.com.tw/media/11808/6_單槽專用ST排水管組90cm_re.jpg', N'3549')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11811', N'product_images', N'81184', N'https://buy.sakura.com.tw/media/11811/6_國產180mm大提籠_無溢_提籠合成圖_re.jpg', N'3547')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11812', N'product_images', N'81184', N'https://buy.sakura.com.tw/media/11812/6_單槽專用ST排水管組90cm_re.jpg', N'3548')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11816', N'product_images', N'80402', N'https://buy.sakura.com.tw/media/11816/6_國產180mm大提籠_無溢_提籠合成圖_re.jpg', N'3521')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11817', N'product_images', N'80402', N'https://buy.sakura.com.tw/media/11817/6_單槽專用ST排水管組90cm_re.jpg', N'3522')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11820', N'product_images', N'81183', N'https://buy.sakura.com.tw/media/11820/6_國產180mm大提籠_無溢_提籠合成圖_re.jpg', N'3545')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11821', N'product_images', N'81183', N'https://buy.sakura.com.tw/media/11821/6_單槽專用ST排水管組90cm_re.jpg', N'3546')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11824', N'product_images', N'80101', N'https://buy.sakura.com.tw/media/11824/7_中型有溢水孔_CN_提籠合成圖_re.jpg', N'1288')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11825', N'product_images', N'80101', N'https://buy.sakura.com.tw/media/11825/7_排水管_JS-TYPE_re.jpg', N'1289')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11828', N'product_images', N'80100', N'https://buy.sakura.com.tw/media/11828/7_中型有溢水孔_CN_提籠合成圖_re.jpg', N'1285')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11829', N'product_images', N'80100', N'https://buy.sakura.com.tw/media/11829/7_排水管_JS-TYPE_re.jpg', N'1286')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11832', N'product_images', N'80102', N'https://buy.sakura.com.tw/media/11832/7_中型有溢水孔_CN_提籠合成圖_re.jpg', N'1289')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11833', N'product_images', N'80102', N'https://buy.sakura.com.tw/media/11833/7_排水管_JS-TYPE_re.jpg', N'1290')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11836', N'product_images', N'80103', N'https://buy.sakura.com.tw/media/11836/7_中型有溢水孔_CN_提籠合成圖_re.jpg', N'1292')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11837', N'product_images', N'80103', N'https://buy.sakura.com.tw/media/11837/7_排水管_JS-TYPE_re.jpg', N'1293')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11840', N'product_images', N'80104', N'https://buy.sakura.com.tw/media/11840/8_中型溢水孔_CN_提籠合成圖_re.jpg', N'1294')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11841', N'product_images', N'80104', N'https://buy.sakura.com.tw/media/11841/8_排水管_JS-TYPE_re.jpg', N'1295')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11842', N'product_images', N'80660', N'https://buy.sakura.com.tw/media/11842/9_單槽專用ST排水管組_120cm_re.jpg', N'2807')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11843', N'product_images', N'80662', N'https://buy.sakura.com.tw/media/11843/9_單槽專用ST排水管組_120cm_re.jpg', N'2809')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11844', N'product_images', N'80663', N'https://buy.sakura.com.tw/media/11844/9_單槽專用ST排水管組_120cm_re.jpg', N'2810')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11845', N'product_images', N'81698', N'https://buy.sakura.com.tw/media/11845/10_人造石水槽_防蟑防臭排水管_re.jpg', N'4995')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11846', N'product_images', N'81699', N'https://buy.sakura.com.tw/media/11846/10_人造石水槽_防蟑防臭排水管_re.jpg', N'5026')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11858', N'使用手冊', N'81960', N'https://buy.sakura.com.tw/files/11858/P0531說明書_250331(web).pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11859', N'型錄', N'82061', N'https://buy.sakura.com.tw/files/11859/TEKA-蒸烤箱型錄.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11860', N'型錄', N'82062', N'https://buy.sakura.com.tw/files/11860/TEKA-蒸烤箱型錄.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11862', N'product_images', N'82103', N'https://buy.sakura.com.tw/media/11862/G5201S.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11866', N'product_images', N'82104', N'https://buy.sakura.com.tw/media/11866/G6201S.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11868', N'product_images', N'82105', N'https://buy.sakura.com.tw/media/11868/G2922S.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11869', N'型錄', N'82060', N'https://buy.sakura.com.tw/files/11869/TEKA-DFI76950-洗碗機型錄.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11889', N'product_images', N'81428', N'https://buy.sakura.com.tw/media/11889/F0185增加型號.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11892', N'使用手冊', N'82106', N'https://buy.sakura.com.tw/files/11892/E3625A說明書_無圖框20250521.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11902', N'使用手冊', N'82103', N'https://buy.sakura.com.tw/files/11902/Sakura_說明書(台嵌共用板)無框_2505.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11903', N'使用手冊', N'82104', N'https://buy.sakura.com.tw/files/11903/Sakura_說明書(台嵌共用板)無框_2505.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11915', N'product_images', N'82110', N'https://buy.sakura.com.tw/media/11915/G2527G_V2.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11921', N'product_images', N'82111', N'https://buy.sakura.com.tw/media/11921/IMG_5416.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11923', N'product_images', N'82112', N'https://buy.sakura.com.tw/media/11923/VD6111_洗碗機-官網用.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11924', N'使用手冊', N'82112', N'https://buy.sakura.com.tw/files/11924/VD6111半嵌洗碗機說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11926', N'RoHS', N'82112', N'https://buy.sakura.com.tw/files/11926/VD6111洗碗機RoHS.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11927', N'型錄', N'82112', N'https://buy.sakura.com.tw/files/11927/Svago_VD6111洗碗機_A4DM_250520_web.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11928', N'product_images', N'82113', N'https://buy.sakura.com.tw/media/11928/VEG2510產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11929', N'RoHS', N'82113', N'https://buy.sakura.com.tw/files/11929/VEG2510-RoHs.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11930', N'使用手冊', N'82113', N'https://buy.sakura.com.tw/files/11930/VEG2510橫式三口感應爐說明書.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11933', N'product_images', N'82114', N'https://buy.sakura.com.tw/media/11933/1.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11934', N'product_images', N'82114', N'https://buy.sakura.com.tw/media/11934/2.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11935', N'product_images', N'82114', N'https://buy.sakura.com.tw/media/11935/3.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11936', N'product_images', N'82114', N'https://buy.sakura.com.tw/media/11936/4.png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11937', N'使用手冊', N'82114', N'https://buy.sakura.com.tw/files/11937/Q680說明書-已壓縮.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11964', N'product_images', N'82118', N'https://buy.sakura.com.tw/media/11964/20250218_櫻花_IH爐_EG2120AG_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11965', N'RoHS', N'82118', N'https://buy.sakura.com.tw/files/11965/單口IH爐-RoHS.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11968', N'product_images', N'82119', N'https://buy.sakura.com.tw/media/11968/20250218_櫻花_IH爐_EG2331AG_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11969', N'RoHS', N'82119', N'https://buy.sakura.com.tw/files/11969/雙口IH爐-RoHS.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11971', N'product_images', N'82120', N'https://buy.sakura.com.tw/media/11971/20250218_櫻花_IH爐_EG2200AG_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11972', N'RoHS', N'82120', N'https://buy.sakura.com.tw/files/11972/雙口IH爐-RoHS.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11974', N'使用手冊', N'81756', N'https://buy.sakura.com.tw/files/11974/E5650A_E9650A-說明書.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11975', N'使用手冊', N'80823', N'https://buy.sakura.com.tw/files/11975/E8692-說明書.pdf', N'4935')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11976', N'使用手冊', N'1015', N'https://buy.sakura.com.tw/files/11976/E6672-說明書.pdf', N'1090')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11977', N'使用手冊', N'81954', N'https://buy.sakura.com.tw/files/11977/E8891_E9891-說明書.pdf', N'8')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11981', N'product_images', N'82121', N'https://buy.sakura.com.tw/media/11981/1.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11982', N'product_images', N'82121', N'https://buy.sakura.com.tw/media/11982/2.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11984', N'使用手冊', N'82121', N'https://buy.sakura.com.tw/files/11984/Q7585說明書_250522.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11986', N'RoHS', N'82121', N'https://buy.sakura.com.tw/files/11986/RoHS-吊掛烘碗機-Q7585系列.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11987', N'型錄', N'81864', N'https://buy.sakura.com.tw/files/11987/G2922BG-DM-2025.05.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11996', N'product_images', N'82121', N'https://buy.sakura.com.tw/media/11996/4.png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'11997', N'product_images', N'82121', N'https://buy.sakura.com.tw/media/11997/6.png', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12014', N'product_images', N'82122', N'https://buy.sakura.com.tw/media/12014/3.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12015', N'使用手冊', N'82122', N'https://buy.sakura.com.tw/files/12015/Q7585說明書_250522.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12017', N'RoHS', N'82122', N'https://buy.sakura.com.tw/files/12017/RoHS-吊掛烘碗機-Q7585系列.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12023', N'product_images', N'82122', N'https://buy.sakura.com.tw/media/12023/1.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12055', N'product_images', N'82129', N'https://buy.sakura.com.tw/media/12055/20250109_櫻花_DH9166H_正面_800x800px.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12056', N'product_images', N'82129', N'https://buy.sakura.com.tw/media/12056/20250109_櫻花_DH1638H_側面_800x800px.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12057', N'product_images', N'82129', N'https://buy.sakura.com.tw/media/12057/20250508_櫻花_DH1638H_產品特色cut1_1000x1000px.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12058', N'product_images', N'82129', N'https://buy.sakura.com.tw/media/12058/20250508_櫻花_DH1638H_產品特色cut2_1000x1000px.jpg', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12059', N'product_images', N'82129', N'https://buy.sakura.com.tw/media/12059/20250508_櫻花_DH1638H_產品特色cut3_1000x1000px.jpg', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12077', N'product_images', N'82131', N'https://buy.sakura.com.tw/media/12077/IMG_3568.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12078', N'product_images', N'82131', N'https://buy.sakura.com.tw/media/12078/IMG_3573.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12079', N'product_images', N'82131', N'https://buy.sakura.com.tw/media/12079/IMG_3621.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12080', N'product_images', N'82131', N'https://buy.sakura.com.tw/media/12080/IMG_3627.png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12081', N'使用手冊', N'82131', N'https://buy.sakura.com.tw/files/12081/DR7397說明書FA.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12091', N'product_images', N'82132', N'https://buy.sakura.com.tw/media/12091/IMG_5078.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12092', N'使用手冊', N'82132', N'https://buy.sakura.com.tw/files/12092/EG2351G說明書_0610.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12093', N'RoHS', N'82132', N'https://buy.sakura.com.tw/files/12093/EG2351G-ROHS標示.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12105', N'product_images', N'82106', N'https://buy.sakura.com.tw/media/12105/1.png', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12106', N'product_images', N'82106', N'https://buy.sakura.com.tw/media/12106/2.png', N'8')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12107', N'product_images', N'82106', N'https://buy.sakura.com.tw/media/12107/3.png', N'9')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12108', N'product_images', N'82106', N'https://buy.sakura.com.tw/media/12108/4.png', N'10')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12109', N'product_images', N'82133', N'https://buy.sakura.com.tw/media/12109/IMG_4570.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12110', N'product_images', N'82133', N'https://buy.sakura.com.tw/media/12110/IMG_4601.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12111', N'product_images', N'82133', N'https://buy.sakura.com.tw/media/12111/IMG_4664.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12112', N'product_images', N'82133', N'https://buy.sakura.com.tw/media/12112/IMG_4679.png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12113', N'使用手冊', N'82133', N'https://buy.sakura.com.tw/files/12113/智能款隱藏小宅說明書.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12116', N'product_images', N'82134', N'https://buy.sakura.com.tw/media/12116/01.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12117', N'product_images', N'82134', N'https://buy.sakura.com.tw/media/12117/02.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12118', N'使用手冊', N'82134', N'https://buy.sakura.com.tw/files/12118/智能款隱藏小宅說明書.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12126', N'RoHS', N'82114', N'https://buy.sakura.com.tw/files/12126/Q680-限用物質含有情況標示聲明書.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12127', N'使用手冊', N'82105', N'https://buy.sakura.com.tw/files/12127/Sakura_說明書(檯面爐)無框_2505.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12134', N'RoHS', N'81962', N'https://buy.sakura.com.tw/files/12134/DR7396RoHS.pdf', N'8')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12135', N'RoHS', N'82131', N'https://buy.sakura.com.tw/files/12135/DR7397RoHS.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12136', N'使用手冊', N'82110', N'https://buy.sakura.com.tw/files/12136/G2527_G2627G-說明書-補充頁合併.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12137', N'使用手冊', N'82111', N'https://buy.sakura.com.tw/files/12137/G2527_G2627G-說明書-補充頁合併.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12150', N'RoHS', N'81912', N'https://buy.sakura.com.tw/files/12150/R7351A-RoHS.pdf', N'12')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12151', N'RoHS', N'81911', N'https://buy.sakura.com.tw/files/12151/R7351A-RoHS.pdf', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12158', N'RoHS', N'82137', N'https://buy.sakura.com.tw/media/12158/DFI26700洗碗機_RoHS.JPG', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12160', N'product_images', N'82137', N'https://buy.sakura.com.tw/media/12160/DFI-26700.png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12161', N'product_images', N'82138', N'https://buy.sakura.com.tw/media/12161/DSI-26700.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12163', N'RoHS', N'82138', N'https://buy.sakura.com.tw/media/12163/DSI26700洗碗機_RoHS.JPG', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12168', N'使用手冊', N'81596', N'https://buy.sakura.com.tw/files/12168/EG2120GB說明書.pdf', N'4509')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12169', N'使用手冊', N'81791', N'https://buy.sakura.com.tw/files/12169/Z1AGA839-X13.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12170', N'使用手冊', N'81546', N'https://buy.sakura.com.tw/files/12170/Z1AGA839-X13.pdf', N'4417')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12171', N'使用手冊', N'82118', N'https://buy.sakura.com.tw/files/12171/EG2120AG_EG2331AG_EG2200AG-說明書.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12172', N'使用手冊', N'82119', N'https://buy.sakura.com.tw/files/12172/EG2120AG_EG2331AG_EG2200AG-說明書.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12173', N'使用手冊', N'82120', N'https://buy.sakura.com.tw/files/12173/EG2120AG_EG2331AG_EG2200AG-說明書.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12174', N'使用手冊', N'1025', N'https://buy.sakura.com.tw/files/12174/EG2330GB說明書.pdf', N'1109')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12186', N'product_images', N'82139', N'https://buy.sakura.com.tw/media/12186/VEG2382.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12187', N'使用手冊', N'82139', N'https://buy.sakura.com.tw/files/12187/VEG2382說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12197', N'使用手冊', N'82140', N'https://buy.sakura.com.tw/files/12197/VR7152SXL說明書.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12200', N'product_images', N'82140', N'https://buy.sakura.com.tw/media/12200/VR7152SXL官網圖.png', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12201', N'RoHS', N'82140', N'https://buy.sakura.com.tw/files/12201/VR7152SXL-RoHs.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12202', N'RoHS', N'82139', N'https://buy.sakura.com.tw/files/12202/VEG2382-ROHS標示.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12207', N'product_images', N'82143', N'https://buy.sakura.com.tw/media/12207/EG2501G.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12208', N'RoHS', N'82143', N'https://buy.sakura.com.tw/files/12208/EG2501GRoHS.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12209', N'使用手冊', N'82143', N'https://buy.sakura.com.tw/files/12209/EG2501G說明書0703.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12230', N'型錄', N'82139', N'https://buy.sakura.com.tw/files/12230/svago_AI連動_DM.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12231', N'型錄', N'82140', N'https://buy.sakura.com.tw/files/12231/svago_AI連動_DM.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12253', N'使用手冊', N'81980', N'https://buy.sakura.com.tw/files/12253/VEG2330說明書.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12254', N'product_images', N'82162', N'https://buy.sakura.com.tw/media/12254/DH1670H_1.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12255', N'product_images', N'82162', N'https://buy.sakura.com.tw/media/12255/DH1670H_2.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12256', N'使用手冊', N'81915', N'https://buy.sakura.com.tw/files/12256/P0585-說明書-20250821.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12258', N'product_images', N'81429', N'https://buy.sakura.com.tw/media/12258/F0186-20250821.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12265', N'使用手冊', N'81830', N'https://buy.sakura.com.tw/files/12265/VE9960說明書.pdf', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12268', N'使用手冊', N'81903', N'https://buy.sakura.com.tw/files/12268/P0230A-說明書-官網.pdf', N'9')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12269', N'型錄', N'81903', N'https://buy.sakura.com.tw/files/12269/P0230A.P0231-DM_0903update.pdf', N'10')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12271', N'型錄', N'81024', N'https://buy.sakura.com.tw/files/12271/P0230A.P0231-DM_0903update.pdf', N'5044')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12272', N'使用手冊', N'81024', N'https://buy.sakura.com.tw/files/12272/P0231-RO淨水器說明書(網頁).pdf', N'5045')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12277', N'product_images', N'82163', N'https://buy.sakura.com.tw/media/12277/VR7015H官網圖.jpeg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12278', N'使用手冊', N'82163', N'https://buy.sakura.com.tw/files/12278/VR7015H說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12279', N'product_images', N'82163', N'https://buy.sakura.com.tw/media/12279/VR7015H官網圖2.jpeg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12281', N'product_images', N'80102', N'https://buy.sakura.com.tw/media/12281/PDS850W-resize.jpg', N'1288')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12287', N'product_images', N'82164', N'https://buy.sakura.com.tw/media/12287/VE7770A_web-01.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12288', N'使用手冊', N'82164', N'https://buy.sakura.com.tw/files/12288/VE7770A說明.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12290', N'RoHS', N'82164', N'https://buy.sakura.com.tw/files/12290/VE7770A-RoHS標示.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12294', N'product_images', N'82165', N'https://buy.sakura.com.tw/media/12294/LF119012NB_1_re.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12295', N'product_images', N'82165', N'https://buy.sakura.com.tw/media/12295/LF119012NB_2_re.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12296', N'product_images', N'82165', N'https://buy.sakura.com.tw/media/12296/LF119012NB_3_re.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12297', N'product_images', N'82165', N'https://buy.sakura.com.tw/media/12297/LF119012NB_4_re.jpg', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12301', N'product_images', N'81877', N'https://buy.sakura.com.tw/media/12301/R7301A_全隱藏.png', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12302', N'使用手冊', N'81877', N'https://buy.sakura.com.tw/files/12302/R7301AR7302A說明書20241210.pdf', N'8')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12303', N'型錄', N'81877', N'https://buy.sakura.com.tw/files/12303/櫻花DM_近吸隱藏油機R7352_A3對折_改版241230_v3.pdf', N'9')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12304', N'RoHS', N'81877', N'https://buy.sakura.com.tw/files/12304/R7301AXL系列RoHS網站用-SAKURA.pdf', N'10')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12306', N'使用手冊', N'81878', N'https://buy.sakura.com.tw/files/12306/R7301AR7302A說明書20241210.pdf', N'9')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12307', N'型錄', N'81878', N'https://buy.sakura.com.tw/files/12307/櫻花DM_近吸隱藏油機R7352_A3對折_改版241230_v3.pdf', N'10')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12308', N'RoHS', N'81878', N'https://buy.sakura.com.tw/files/12308/R7301AXL系列RoHS網站用-SAKURA.pdf', N'11')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12309', N'product_images', N'82169', N'https://buy.sakura.com.tw/media/12309/VEG2512.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12310', N'使用手冊', N'82169', N'https://buy.sakura.com.tw/files/12310/VEG2512說明書.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12312', N'RoHS', N'82169', N'https://buy.sakura.com.tw/files/12312/VEG2512-RoHS-表格.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12314', N'型錄', N'81284', N'https://buy.sakura.com.tw/files/12314/Ai-KITCHEN廚房電器i6型錄_A3雙面對折-N-修改2025.10.09.pdf', N'3996')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12315', N'product_images', N'82143', N'https://buy.sakura.com.tw/media/12315/EG2501GC-_更新面板.png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12316', N'使用手冊', N'82088', N'https://buy.sakura.com.tw/files/12316/P0261-P0262-說明書-.pdf', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12317', N'使用手冊', N'82089', N'https://buy.sakura.com.tw/files/12317/P0261-P0262-說明書-.pdf', N'8')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12318', N'使用手冊', N'82090', N'https://buy.sakura.com.tw/files/12318/P0265-P0266-說明書.pdf', N'9')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12319', N'使用手冊', N'82091', N'https://buy.sakura.com.tw/files/12319/P0265-P0266-說明書.pdf', N'9')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12326', N'product_images', N'82170', N'https://buy.sakura.com.tw/media/12326/DLH-982-T.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12328', N'說明書', N'82170', N'https://buy.sakura.com.tw/files/12328/DLH-982-T說明書.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12330', N'RoHS', N'82170', N'https://buy.sakura.com.tw/files/12330/DLH-982-T_RoHS.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12331', N'product_images', N'82171', N'https://buy.sakura.com.tw/media/12331/GBC-76B2-2G-XBN_官網.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12333', N'說明書', N'82171', N'https://buy.sakura.com.tw/files/12333/GBC-76B2-2G-XBN-雙口定時瓦斯爐.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12340', N'型錄', N'82091', N'https://buy.sakura.com.tw/files/12340/RO系列-4折開門折DM-印刷用2025.11.pdf', N'10')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12341', N'型錄', N'82090', N'https://buy.sakura.com.tw/files/12341/RO系列-4折開門折DM-印刷用2025.11.pdf', N'10')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12342', N'product_images', N'82172', N'https://buy.sakura.com.tw/media/12342/VE9962.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12343', N'RoHS', N'82172', N'https://buy.sakura.com.tw/files/12343/VE9962-RoHS--標示.pdf', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12345', N'使用手冊', N'82172', N'https://buy.sakura.com.tw/files/12345/VE9962說明書.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12346', N'型錄', N'82172', N'https://buy.sakura.com.tw/files/12346/svago_VE9962洗脫烘衣機.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12350', N'線稿', N'82173', N'https://buy.sakura.com.tw/files/12350/附件2、LFV30201A產品線圖.pdf', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12351', N'product_images', N'82173', N'https://buy.sakura.com.tw/media/12351/LFV30201_1_resize.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12352', N'product_images', N'82173', N'https://buy.sakura.com.tw/media/12352/LFV30201_2_resize.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12353', N'product_images', N'82173', N'https://buy.sakura.com.tw/media/12353/LFV30201_3_resize.jpg', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12354', N'product_images', N'82173', N'https://buy.sakura.com.tw/media/12354/LFV30201_4_resize.jpg', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12355', N'使用手冊', N'82173', N'https://buy.sakura.com.tw/files/12355/180803-水龍頭電子使用手冊.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12356', N'說明書', N'82060', N'https://buy.sakura.com.tw/files/12356/DFI-76950說明書.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12362', N'使用手冊', N'82162', N'https://buy.sakura.com.tw/files/12362/DH1670H按裝使用說明書.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12364', N'使用手冊', N'82129', N'https://buy.sakura.com.tw/files/12364/DH163XH安裝使用說明書.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12371', N'型錄', N'80800', N'https://buy.sakura.com.tw/files/12371/櫻花_G615AS_G6150AS_A4_DM_251217.pdf', N'2188')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12372', N'型錄', N'81928', N'https://buy.sakura.com.tw/files/12372/G616Y.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12376', N'型錄', N'81925', N'https://buy.sakura.com.tw/files/12376/G2523YG--G633Y--G6330Y--G616Y--G6160Y.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12377', N'型錄', N'81927', N'https://buy.sakura.com.tw/files/12377/G2523YG--G633Y--G6330Y--G616Y--G6160Y.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12378', N'型錄', N'81929', N'https://buy.sakura.com.tw/files/12378/G2523YG--G633Y--G6330Y--G616Y--G6160Y.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12381', N'型錄', N'81926', N'https://buy.sakura.com.tw/files/12381/G2523YG--G633Y--G6330Y--G616Y--G6160Y.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12382', N'型錄', N'81684', N'https://buy.sakura.com.tw/files/12382/櫻花_G5611_G6611_A4_DM_251217.pdf', N'4891')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12383', N'型錄', N'81685', N'https://buy.sakura.com.tw/files/12383/櫻花_G5611_G6611_A4_DM_251217.pdf', N'4894')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12389', N'型錄', N'952', N'https://buy.sakura.com.tw/files/12389/櫻花_G5900_G6900_A4_DM_251217.pdf', N'4059')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12390', N'型錄', N'953', N'https://buy.sakura.com.tw/files/12390/櫻花_G5900_G6900_A4_DM_251217.pdf', N'4064')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12412', N'product_images', N'82321', N'https://buy.sakura.com.tw/media/12412/SAKURA-STONE石英石檯面-C5101-SV105-Pure-White-陶瓷白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12413', N'product_images', N'82321', N'https://buy.sakura.com.tw/media/12413/SAKURA-STONE石英石檯面-C5101-SV105-Pure-White-陶瓷白-大板圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12414', N'product_images', N'82322', N'https://buy.sakura.com.tw/media/12414/SAKURA-STONE石英石檯面-C5102-SV206-Ruby-櫻花雪-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12415', N'product_images', N'82322', N'https://buy.sakura.com.tw/media/12415/SAKURA-STONE石英石檯面-C5102-SV206-Ruby-櫻花雪-大板圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12416', N'product_images', N'82323', N'https://buy.sakura.com.tw/media/12416/SAKURA-STONE石英石檯面-C5102-SV207-Nero-黑耀晶-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12417', N'product_images', N'82323', N'https://buy.sakura.com.tw/media/12417/SAKURA-STONE石英石檯面-C5102-SV207-Nero-黑耀晶-大板圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12418', N'product_images', N'82324', N'https://buy.sakura.com.tw/media/12418/SAKURA-STONE石英石檯面-C5104-SV408-Adelina-月光岩-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12419', N'product_images', N'82324', N'https://buy.sakura.com.tw/media/12419/SAKURA-STONE石英石檯面-C5104-SV408-Adelina-月光岩-大板圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12421', N'product_images', N'82325', N'https://buy.sakura.com.tw/media/12421/SAKURA-STONE石英石檯面-C511P-SV016-Starry-Grey-星點灰-大板圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12422', N'product_images', N'82326', N'https://buy.sakura.com.tw/media/12422/SAKURA-STONE石英石檯面-C5105-SV509-Winterthur-冰川岩-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12423', N'product_images', N'82326', N'https://buy.sakura.com.tw/media/12423/SAKURA-STONE石英石檯面-C5105-SV509-Winterthur-冰川岩-大板圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12424', N'product_images', N'82328', N'https://buy.sakura.com.tw/media/12424/SAKURA-STONE石英石檯面-C5105-SV017--Sandstone-砂岩褐-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12425', N'product_images', N'82328', N'https://buy.sakura.com.tw/media/12425/SAKURA-STONE石英石檯面-C5105-SV017--Sandstone-砂岩褐-大板圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12426', N'product_images', N'82329', N'https://buy.sakura.com.tw/media/12426/SAKURA-STONE石英石檯面-C510P-SV001-Cyber-White-晶燦白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12427', N'product_images', N'82329', N'https://buy.sakura.com.tw/media/12427/SAKURA-STONE石英石檯面-C510P-SV001-Cyber-White-晶燦白-大板圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12428', N'product_images', N'82330', N'https://buy.sakura.com.tw/media/12428/SAKURA-STONE石英石檯面-C510P-SV002-Natalie-耶誕雪-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12429', N'product_images', N'82330', N'https://buy.sakura.com.tw/media/12429/SAKURA-STONE石英石檯面-C510P-SV002-Natalie-耶誕雪-大板圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12430', N'product_images', N'82331', N'https://buy.sakura.com.tw/media/12430/SAKURA-STONE石英石檯面-C510P-SV003-Cloud-璀璨白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12431', N'product_images', N'82331', N'https://buy.sakura.com.tw/media/12431/SAKURA-STONE石英石檯面-C510P-SV003-Cloud-璀璨白-大板圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12432', N'product_images', N'82333', N'https://buy.sakura.com.tw/media/12432/SAKURA-STONE石英石檯面-C510P-SV004-Bianca-綠耀晶-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12433', N'product_images', N'82333', N'https://buy.sakura.com.tw/media/12433/SAKURA-STONE石英石檯面-C510P-SV004-Bianca-綠耀晶-大板圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12434', N'product_images', N'82335', N'https://buy.sakura.com.tw/media/12434/SAKURA-STONE石英石檯面-C5112-SV9210-Nadurra-月河岩-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12435', N'product_images', N'82335', N'https://buy.sakura.com.tw/media/12435/SAKURA-STONE石英石檯面-C5112-SV9210-Nadurra-月河岩-大板圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12436', N'product_images', N'82336', N'https://buy.sakura.com.tw/media/12436/SAKURA-STONE石英石檯面-C5112-SV9211-Mariana-月牙灣-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12437', N'product_images', N'82336', N'https://buy.sakura.com.tw/media/12437/SAKURA-STONE石英石檯面-C5112-SV9211-Mariana-月牙灣-大板圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12438', N'product_images', N'82337', N'https://buy.sakura.com.tw/media/12438/SAKURA-STONE石英石檯面-C5112-SV9212-Dulce-蜜糖晶-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12439', N'product_images', N'82337', N'https://buy.sakura.com.tw/media/12439/SAKURA-STONE石英石檯面-C5112-SV9212-Dulce-蜜糖晶-大板圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12440', N'product_images', N'82339', N'https://buy.sakura.com.tw/media/12440/SAKURA-STONE石英石檯面-C5112-SV9213-Mystic-極影岩-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12441', N'product_images', N'82339', N'https://buy.sakura.com.tw/media/12441/SAKURA-STONE石英石檯面-C5112-SV9213-Mystic-極影岩-大板圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12442', N'product_images', N'82341', N'https://buy.sakura.com.tw/media/12442/SAKURA-STONE石英石檯面-C5113-SV9019--Golden-Vein-White-金縷白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12443', N'product_images', N'82341', N'https://buy.sakura.com.tw/media/12443/SAKURA-STONE石英石檯面-C5113-SV9019--Golden-Vein-White-金縷白-大板圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12444', N'product_images', N'82344', N'https://buy.sakura.com.tw/media/12444/SAKURA-STONE石英石檯面-C5113-SV9020-Calacatta-Gold-卡拉卡金-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12445', N'product_images', N'82344', N'https://buy.sakura.com.tw/media/12445/SAKURA-STONE石英石檯面-C5113-SV9020-Calacatta-Gold-卡拉卡金-大板圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12446', N'product_images', N'82347', N'https://buy.sakura.com.tw/media/12446/SAKURA-STONE石英石檯面-C5113-SV9021--Galaxy-Black-銀河黑-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12447', N'product_images', N'82347', N'https://buy.sakura.com.tw/media/12447/SAKURA-STONE石英石檯面-C5113-SV9021--Galaxy-Black-銀河黑-大板圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12448', N'product_images', N'81878', N'https://buy.sakura.com.tw/media/12448/R7302A.png', N'12')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12449', N'product_images', N'82438', N'https://buy.sakura.com.tw/media/12449/烤漆實木格子窗清玻璃門板-D4012-D4706-實木烤漆鋼刷木紋4706-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12450', N'product_images', N'82440', N'https://buy.sakura.com.tw/media/12450/烤漆實木格子窗清玻璃門板-D4013-D9717-實木烤漆鋼刷木紋9717-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12451', N'product_images', N'82428', N'https://buy.sakura.com.tw/media/12451/格柵門板-D9301,D9302-D0806MH-卵石灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12452', N'product_images', N'82429', N'https://buy.sakura.com.tw/media/12452/格柵門板-D9301,D9302-D6317H-斑駁灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12453', N'product_images', N'82430', N'https://buy.sakura.com.tw/media/12453/格柵門板-D9301,D9302-D7377MH-金砂之城-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12454', N'product_images', N'82431', N'https://buy.sakura.com.tw/media/12454/格柵門板-D9301,D9302-D7378MH-銀輝之城-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12455', N'product_images', N'82432', N'https://buy.sakura.com.tw/media/12455/格柵門板-D9301,D9302-D7383MH-金調暖灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12456', N'product_images', N'82433', N'https://buy.sakura.com.tw/media/12456/格柵門板-D9301,D9302-D8816K-璀璨金-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12457', N'product_images', N'82434', N'https://buy.sakura.com.tw/media/12457/格柵門板-D9301,D9302-D8832H-鏽蝕-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12458', N'product_images', N'82425', N'https://buy.sakura.com.tw/media/12458/原色實木門板-D4010-白荃木-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12459', N'product_images', N'82426', N'https://buy.sakura.com.tw/media/12459/原色實木門板-D4011-胡桃木-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12460', N'product_images', N'82415', N'https://buy.sakura.com.tw/media/12460/染色實木門板-D4009-EA01-經典白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12461', N'product_images', N'82416', N'https://buy.sakura.com.tw/media/12461/染色實木門板-D4009-EA02-雅致米-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12462', N'product_images', N'82417', N'https://buy.sakura.com.tw/media/12462/染色實木門板-D4009-EA06-天空藍-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12463', N'product_images', N'82418', N'https://buy.sakura.com.tw/media/12463/染色實木門板-D4009-EA07-海洋藍-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12464', N'product_images', N'82419', N'https://buy.sakura.com.tw/media/12464/染色實木門板-D4009-EA08-石木橡-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12465', N'product_images', N'82420', N'https://buy.sakura.com.tw/media/12465/染色實木門板-D4009-EA09-童話藍-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12466', N'product_images', N'82421', N'https://buy.sakura.com.tw/media/12466/染色實木門板-D4009-EA10-湖水綠-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12467', N'product_images', N'82422', N'https://buy.sakura.com.tw/media/12467/染色實木門板-D4009-EA11-森林綠-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12468', N'product_images', N'82423', N'https://buy.sakura.com.tw/media/12468/染色實木門板-D4009-EA12-田園黃-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12470', N'product_images', N'82406', N'https://buy.sakura.com.tw/media/12470/染色實木門板-D4008-EA01-經典白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12471', N'product_images', N'82407', N'https://buy.sakura.com.tw/media/12471/染色實木門板-D4008-EA02-雅致米-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12472', N'product_images', N'82408', N'https://buy.sakura.com.tw/media/12472/染色實木門板-D4008-EA06-天空藍-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12473', N'product_images', N'82409', N'https://buy.sakura.com.tw/media/12473/染色實木門板-D4008-EA07-海洋藍-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12474', N'product_images', N'82410', N'https://buy.sakura.com.tw/media/12474/染色實木門板-D4008-EA08-石木橡-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12475', N'product_images', N'82411', N'https://buy.sakura.com.tw/media/12475/染色實木門板-D4008-EA09-童話藍-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12476', N'product_images', N'82412', N'https://buy.sakura.com.tw/media/12476/染色實木門板-D4008-EA10-湖水綠-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12477', N'product_images', N'82413', N'https://buy.sakura.com.tw/media/12477/染色實木門板-D4008-EA11-森林綠-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12478', N'product_images', N'82414', N'https://buy.sakura.com.tw/media/12478/染色實木門板-D4008-EA12-田園黃-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12479', N'product_images', N'82405', N'https://buy.sakura.com.tw/media/12479/金色細鋁框玻璃門板-AIR(含垂直L型把手)-D7011-茶色玻璃-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12480', N'product_images', N'82404', N'https://buy.sakura.com.tw/media/12480/陶瓷塗裝格柵門板-類金屬色-D7210-D8419-馥麗金-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12489', N'product_images', N'82403', N'https://buy.sakura.com.tw/media/12489/陶瓷塗裝格柵門板-素色-D7209-D8418-石墨黑-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12490', N'product_images', N'82395', N'https://buy.sakura.com.tw/media/12490/陶瓷塗裝格柵門板-素色-D7209-D8410-雪絨白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12491', N'product_images', N'82396', N'https://buy.sakura.com.tw/media/12491/陶瓷塗裝格柵門板-素色-D7209-D8411-樺木灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12492', N'product_images', N'82397', N'https://buy.sakura.com.tw/media/12492/陶瓷塗裝格柵門板-素色-D7209-D8412-暖砂米-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12493', N'product_images', N'82398', N'https://buy.sakura.com.tw/media/12493/陶瓷塗裝格柵門板-素色-D7209-D8413-晨霧藍-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12494', N'product_images', N'82399', N'https://buy.sakura.com.tw/media/12494/陶瓷塗裝格柵門板-素色-D7209-D8414-磐石灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12495', N'product_images', N'82400', N'https://buy.sakura.com.tw/media/12495/陶瓷塗裝格柵門板-素色-D7209-D8415-摩卡棕-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12496', N'product_images', N'82401', N'https://buy.sakura.com.tw/media/12496/陶瓷塗裝格柵門板-素色-D7209-D8416-松針綠-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12497', N'product_images', N'82402', N'https://buy.sakura.com.tw/media/12497/陶瓷塗裝格柵門板-素色-D7209-D8417-赭岩紅-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12498', N'product_images', N'82386', N'https://buy.sakura.com.tw/media/12498/霧面塗裝門板(無造型)-D8589-D8511-晨霧白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12499', N'product_images', N'82387', N'https://buy.sakura.com.tw/media/12499/霧面塗裝門板(無造型)-D8589-D8512-柔霧米-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12500', N'product_images', N'82388', N'https://buy.sakura.com.tw/media/12500/霧面塗裝門板(無造型)-D8589-D8513-杏仁黃-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12501', N'product_images', N'82389', N'https://buy.sakura.com.tw/media/12501/霧面塗裝門板(無造型)-D8589-D8514-珊瑚橘-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12502', N'product_images', N'82390', N'https://buy.sakura.com.tw/media/12502/霧面塗裝門板(無造型)-D8589-D8515-暮色紅-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12503', N'product_images', N'82391', N'https://buy.sakura.com.tw/media/12503/霧面塗裝門板(無造型)-D8589-D8516-麥栗棕-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12504', N'product_images', N'82392', N'https://buy.sakura.com.tw/media/12504/霧面塗裝門板(無造型)-D8589-D8517-橄欖綠-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12505', N'product_images', N'82393', N'https://buy.sakura.com.tw/media/12505/霧面塗裝門板(無造型)-D8589-D8518-羅蘭紫-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12506', N'product_images', N'82394', N'https://buy.sakura.com.tw/media/12506/霧面塗裝門板(無造型)-D8589-D8519-石墨灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12507', N'product_images', N'82377', N'https://buy.sakura.com.tw/media/12507/鏡面塗裝門板-D9188-D9101-炭黑-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12508', N'product_images', N'82378', N'https://buy.sakura.com.tw/media/12508/鏡面塗裝門板-D9188-D9102-晶白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12509', N'product_images', N'82379', N'https://buy.sakura.com.tw/media/12509/鏡面塗裝門板-D9188-D9103-奶茶-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12510', N'product_images', N'82380', N'https://buy.sakura.com.tw/media/12510/鏡面塗裝門板-D9188-D9104-磚紅-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12511', N'product_images', N'82381', N'https://buy.sakura.com.tw/media/12511/鏡面塗裝門板-D9188-D9105-奶茶粉-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12512', N'product_images', N'82382', N'https://buy.sakura.com.tw/media/12512/鏡面塗裝門板-D9188-D9106-薄荷綠-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12513', N'product_images', N'82362', N'https://buy.sakura.com.tw/media/12513/ＨANEX人造石檯面-C5083(花色)-C-001-Cubic-White-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12514', N'product_images', N'82383', N'https://buy.sakura.com.tw/media/12514/鏡面塗裝門板-D9188-D9107-青蘋果綠-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12515', N'product_images', N'82384', N'https://buy.sakura.com.tw/media/12515/鏡面塗裝門板-D9188-D9108-嫩芽綠-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12516', N'product_images', N'82360', N'https://buy.sakura.com.tw/media/12516/ＨANEX人造石檯面-C5083(花色)-D-001-Sliverstone-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12517', N'product_images', N'82385', N'https://buy.sakura.com.tw/media/12517/鏡面塗裝門板-D9188-D9109-柔光藍-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12518', N'product_images', N'82355', N'https://buy.sakura.com.tw/media/12518/ＨANEX人造石檯面-C5083(花色)-D-024-Sliver-White-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12519', N'product_images', N'82367', N'https://buy.sakura.com.tw/media/12519/ＨANEX人造石檯面-C5083(花色)-D-028-Black-Beat-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12520', N'product_images', N'82370', N'https://buy.sakura.com.tw/media/12520/ＨANEX人造石檯面-C5083(花色)-P-004-Solaris-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12522', N'product_images', N'82358', N'https://buy.sakura.com.tw/media/12522/ＨANEX人造石檯面-C5083(花色)-T-089-Vocalise-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12523', N'product_images', N'82375', N'https://buy.sakura.com.tw/media/12523/黑色細鋁框玻璃門板-D7010-D7010A-清玻璃-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12524', N'product_images', N'82376', N'https://buy.sakura.com.tw/media/12524/黑色細鋁框玻璃門板-D7010-D7010C-茶色玻璃-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12525', N'product_images', N'82357', N'https://buy.sakura.com.tw/media/12525/黑色細鋁框玻璃門板-AIR(含垂直L型把手)-D7006-茶色玻璃-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12526', N'product_images', N'82179', N'https://buy.sakura.com.tw/media/12526/MFC四邊封門板-D1182-靜謐藍灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12527', N'product_images', N'82178', N'https://buy.sakura.com.tw/media/12527/MFC四邊封門板-D1181-輕甜粉漾-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12528', N'product_images', N'82177', N'https://buy.sakura.com.tw/media/12528/MFC四邊封門板-D1180-瓷釉綠-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12529', N'product_images', N'82176', N'https://buy.sakura.com.tw/media/12529/MFC四邊封門板-D1179-米布織-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12530', N'product_images', N'82348', N'https://buy.sakura.com.tw/media/12530/FENIX門板-D9201-D0032-科斯白BiancoKos-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12531', N'product_images', N'82175', N'https://buy.sakura.com.tw/media/12531/MFC四邊封門板-D1109-靜謐白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12532', N'product_images', N'82349', N'https://buy.sakura.com.tw/media/12532/FENIX門板-D9201-D0718-倫敦灰GrigioLondra-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12533', N'product_images', N'82351', N'https://buy.sakura.com.tw/media/12533/FENIX門板-D9201-D0720-亞光黑Nero-Lngo-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12534', N'product_images', N'82183', N'https://buy.sakura.com.tw/media/12534/MFC四邊封門板-D2503-天然橡木-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12535', N'product_images', N'82180', N'https://buy.sakura.com.tw/media/12535/MFC四邊封門板-D2510-銀灰清水模-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12536', N'product_images', N'82189', N'https://buy.sakura.com.tw/media/12536/MFC四邊封門板-D2512-晨霧木白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12537', N'product_images', N'82354', N'https://buy.sakura.com.tw/media/12537/FENIX門板-D9201-D0751-齋浦爾紅RossoJaipur-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12538', N'product_images', N'82353', N'https://buy.sakura.com.tw/media/12538/FENIX門板-D9201-D0750-湖水綠Verde-Comodoro-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12539', N'product_images', N'82184', N'https://buy.sakura.com.tw/media/12539/MFC四邊封門板-D2513-冰島白橡-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12540', N'product_images', N'82356', N'https://buy.sakura.com.tw/media/12540/FENIX門板-D9201-D0754-摩洛哥藍Blue-Fes-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12542', N'product_images', N'82190', N'https://buy.sakura.com.tw/media/12542/MFC四邊封門板-D2516-板岩栓木-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12543', N'product_images', N'82327', N'https://buy.sakura.com.tw/media/12543/陶瓷塗裝細邊框型門板-素色-D7207-D8410-雪絨白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12544', N'product_images', N'82332', N'https://buy.sakura.com.tw/media/12544/陶瓷塗裝細邊框型門板-素色-D7207-D8411-樺木灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12545', N'product_images', N'82191', N'https://buy.sakura.com.tw/media/12545/MFC四邊封門板-D2525-鈦絲銀-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12546', N'product_images', N'82334', N'https://buy.sakura.com.tw/media/12546/陶瓷塗裝細邊框型門板-素色-D7207-D8412-暖砂米-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12547', N'product_images', N'82338', N'https://buy.sakura.com.tw/media/12547/陶瓷塗裝細邊框型門板-素色-D7207-D8413-晨霧藍-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12548', N'product_images', N'82340', N'https://buy.sakura.com.tw/media/12548/陶瓷塗裝細邊框型門板-素色-D7207-D8414-磐石灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12549', N'product_images', N'82342', N'https://buy.sakura.com.tw/media/12549/陶瓷塗裝細邊框型門板-素色-D7207-D8415-摩卡棕-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12550', N'product_images', N'82343', N'https://buy.sakura.com.tw/media/12550/陶瓷塗裝細邊框型門板-素色-D7207-D8416-松針綠-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12551', N'product_images', N'82345', N'https://buy.sakura.com.tw/media/12551/陶瓷塗裝細邊框型門板-素色-D7207-D8417-赭岩紅-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12552', N'product_images', N'82346', N'https://buy.sakura.com.tw/media/12552/陶瓷塗裝細邊框型門板-素色-D7207-D8418-石墨黑-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12554', N'product_images', N'82185', N'https://buy.sakura.com.tw/media/12554/MFC四邊封門板-D2526-北歐櫸木-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12555', N'product_images', N'82192', N'https://buy.sakura.com.tw/media/12555/MFC四邊封門板-D2527-都會黑橡-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12556', N'product_images', N'82193', N'https://buy.sakura.com.tw/media/12556/MFC四邊封門板-D2528-霧鄉奶茶-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12557', N'product_images', N'82186', N'https://buy.sakura.com.tw/media/12557/MFC四邊封門板-D2529-自然胡桃木-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12558', N'product_images', N'82284', N'https://buy.sakura.com.tw/media/12558/陶瓷塗裝J型門板-素色-D7205-D8410-雪絨白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12559', N'product_images', N'82286', N'https://buy.sakura.com.tw/media/12559/陶瓷塗裝J型門板-素色-D7205-D8411-樺木灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12560', N'product_images', N'82194', N'https://buy.sakura.com.tw/media/12560/MFC四邊封門板-D2530-鈦絲金-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12561', N'product_images', N'82288', N'https://buy.sakura.com.tw/media/12561/陶瓷塗裝J型門板-素色-D7205-D8412-暖砂米-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12562', N'product_images', N'82289', N'https://buy.sakura.com.tw/media/12562/陶瓷塗裝J型門板-素色-D7205-D8413-晨霧藍-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12563', N'product_images', N'82195', N'https://buy.sakura.com.tw/media/12563/MFC四邊封門板-D2531-科技銀-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12564', N'product_images', N'82290', N'https://buy.sakura.com.tw/media/12564/陶瓷塗裝J型門板-素色-D7205-D8414-磐石灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12565', N'product_images', N'82196', N'https://buy.sakura.com.tw/media/12565/MFC四邊封門板-D2532-鎏金銅-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12566', N'product_images', N'82293', N'https://buy.sakura.com.tw/media/12566/陶瓷塗裝J型門板-素色-D7205-D8415-摩卡棕-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12567', N'product_images', N'82301', N'https://buy.sakura.com.tw/media/12567/陶瓷塗裝J型門板-素色-D7205-D8416-松針綠-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12568', N'product_images', N'82308', N'https://buy.sakura.com.tw/media/12568/陶瓷塗裝J型門板-素色-D7205-D8417-赭岩紅-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12569', N'product_images', N'82310', N'https://buy.sakura.com.tw/media/12569/陶瓷塗裝J型門板-素色-D7205-D8418-石墨黑-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12570', N'product_images', N'82281', N'https://buy.sakura.com.tw/media/12570/粗鋁框玻璃門板-D7009-D7009A-清玻璃-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12571', N'product_images', N'82283', N'https://buy.sakura.com.tw/media/12571/粗鋁框玻璃門板-D7009-D7009B-噴砂玻璃-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12572', N'product_images', N'82274', N'https://buy.sakura.com.tw/media/12572/膜壓門板(臻美)-D6111-D4706-雅緻白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12573', N'product_images', N'82275', N'https://buy.sakura.com.tw/media/12573/膜壓門板(臻美)-D6111-D9717-木紋白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12577', N'product_images', N'82272', N'https://buy.sakura.com.tw/media/12577/陶瓷塗裝門板-類金屬色-D7202-D8419-馥麗金-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12580', N'product_images', N'82249', N'https://buy.sakura.com.tw/media/12580/陶瓷塗裝門板-素色-D7201-D8410-雪絨白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12582', N'product_images', N'82251', N'https://buy.sakura.com.tw/media/12582/陶瓷塗裝門板-素色-D7201-D8412-暖砂米-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12583', N'product_images', N'82252', N'https://buy.sakura.com.tw/media/12583/陶瓷塗裝門板-素色-D7201-D8413-晨霧藍-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12585', N'product_images', N'82254', N'https://buy.sakura.com.tw/media/12585/陶瓷塗裝門板-素色-D7201-D8414-磐石灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12586', N'product_images', N'82255', N'https://buy.sakura.com.tw/media/12586/陶瓷塗裝門板-素色-D7201-D8415-摩卡棕-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12587', N'product_images', N'82256', N'https://buy.sakura.com.tw/media/12587/陶瓷塗裝門板-素色-D7201-D8416-松針綠-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12588', N'product_images', N'82257', N'https://buy.sakura.com.tw/media/12588/陶瓷塗裝門板-素色-D7201-D8417-赭岩紅-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12590', N'product_images', N'82259', N'https://buy.sakura.com.tw/media/12590/陶瓷塗裝門板-素色-D7201-D8418-石墨黑-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12591', N'product_images', N'82261', N'https://buy.sakura.com.tw/media/12591/陶瓷塗裝門板-素色-D7203-D8410-雪絨白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12592', N'product_images', N'82250', N'https://buy.sakura.com.tw/media/12592/陶瓷塗裝門板-素色-D7203-D8411-樺木灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12593', N'product_images', N'82271', N'https://buy.sakura.com.tw/media/12593/陶瓷塗裝門板-素色-D7203-D8418-石墨黑-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12594', N'product_images', N'82270', N'https://buy.sakura.com.tw/media/12594/陶瓷塗裝門板-素色-D7203-D8417-赭岩紅-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12595', N'product_images', N'82268', N'https://buy.sakura.com.tw/media/12595/陶瓷塗裝門板-素色-D7203-D8416-松針綠-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12596', N'product_images', N'82267', N'https://buy.sakura.com.tw/media/12596/陶瓷塗裝門板-素色-D7203-D8415-摩卡棕-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12597', N'product_images', N'82266', N'https://buy.sakura.com.tw/media/12597/陶瓷塗裝門板-素色-D7203-D8414-磐石灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12598', N'product_images', N'82262', N'https://buy.sakura.com.tw/media/12598/陶瓷塗裝門板-素色-D7203-D8411-樺木灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12599', N'product_images', N'82263', N'https://buy.sakura.com.tw/media/12599/陶瓷塗裝門板-素色-D7203-D8412-暖砂米-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12600', N'product_images', N'82264', N'https://buy.sakura.com.tw/media/12600/陶瓷塗裝門板-素色-D7203-D8413-晨霧藍-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12601', N'product_images', N'82466', N'https://buy.sakura.com.tw/media/12601/金屬門板-D1190-金屬拉絲銀-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12602', N'product_images', N'82467', N'https://buy.sakura.com.tw/media/12602/LFK87121JV-13A-導購800X800-slide.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12603', N'product_images', N'82467', N'https://buy.sakura.com.tw/media/12603/LFK87121JV-13A_1_re-slide.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12604', N'product_images', N'82467', N'https://buy.sakura.com.tw/media/12604/LFK87121JV-13A_部件_re-slide.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12605', N'線稿', N'82467', N'https://buy.sakura.com.tw/files/12605/附件2、LFK87121JV-13A線圖.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12606', N'使用手冊', N'82467', N'https://buy.sakura.com.tw/files/12606/附件3、水龍頭使用手冊.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12607', N'product_images', N'82187', N'https://buy.sakura.com.tw/media/12607/MFC四邊封門板-D2533-胭脂胡桃木-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12608', N'product_images', N'82197', N'https://buy.sakura.com.tw/media/12608/MFC四邊封門板-D2534-白曦杉木-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12609', N'product_images', N'82181', N'https://buy.sakura.com.tw/media/12609/MFC四邊封門板-D2535-暮光棕橡-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12610', N'product_images', N'82182', N'https://buy.sakura.com.tw/media/12610/MFC四邊封門板-D2537-曠野灰橡-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12611', N'product_images', N'82239', N'https://buy.sakura.com.tw/media/12611/霧感抗菌門板-D6310-M2572-卡其棕-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12612', N'product_images', N'82240', N'https://buy.sakura.com.tw/media/12612/霧感抗菌門板-D6310-M2573-淺石灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12613', N'product_images', N'82241', N'https://buy.sakura.com.tw/media/12613/霧感抗菌門板-D6310-M2575-蜜糖粉-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12614', N'product_images', N'82242', N'https://buy.sakura.com.tw/media/12614/霧感抗菌門板-D6310-M2576-薰衣紫-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12615', N'product_images', N'82198', N'https://buy.sakura.com.tw/media/12615/MFC四邊封門板-D3503-白雲岩-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12616', N'product_images', N'82243', N'https://buy.sakura.com.tw/media/12616/霧感抗菌門板-D6310-M2581-暖霧白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12617', N'product_images', N'82244', N'https://buy.sakura.com.tw/media/12617/霧感抗菌門板-D6310-M2581-暖霧白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12618', N'product_images', N'82245', N'https://buy.sakura.com.tw/media/12618/霧感抗菌門板-D6310-M2582-可可棕-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12619', N'product_images', N'82246', N'https://buy.sakura.com.tw/media/12619/霧感抗菌門板-D6310-M2583-質感灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12620', N'product_images', N'82247', N'https://buy.sakura.com.tw/media/12620/霧感抗菌門板-D6310-M2585-孔雀藍-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12621', N'product_images', N'82248', N'https://buy.sakura.com.tw/media/12621/霧感抗菌門板-D6310-M2587-暗夜黑-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12622', N'product_images', N'82237', N'https://buy.sakura.com.tw/media/12622/膜壓門板-D6109--038-霧光白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12623', N'product_images', N'82238', N'https://buy.sakura.com.tw/media/12623/膜壓門板-D6109--9717-木紋白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12624', N'product_images', N'82235', N'https://buy.sakura.com.tw/media/12624/銀線晶耀門板-D6195-DK01-雪白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12625', N'product_images', N'82236', N'https://buy.sakura.com.tw/media/12625/銀線晶耀門板-D6195-DK22-暖白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12626', N'product_images', N'82228', N'https://buy.sakura.com.tw/media/12626/Style風格門板-D6501-D0806MH-卵石灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12627', N'product_images', N'82229', N'https://buy.sakura.com.tw/media/12627/Style風格門板-D6501-D6317H-斑駁灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12628', N'product_images', N'82230', N'https://buy.sakura.com.tw/media/12628/Style風格門板-D6501-D7377MH-金砂之城-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12629', N'product_images', N'82231', N'https://buy.sakura.com.tw/media/12629/Style風格門板-D6501-D7378MH-銀輝之城-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12630', N'product_images', N'82232', N'https://buy.sakura.com.tw/media/12630/Style風格門板-D6501-D7383MH-金調暖灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12631', N'product_images', N'82233', N'https://buy.sakura.com.tw/media/12631/Style風格門板-D6501-D8816K-璀璨金-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12632', N'product_images', N'82234', N'https://buy.sakura.com.tw/media/12632/Style風格門板-D6501-D8832H-鏽蝕-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12633', N'product_images', N'82202', N'https://buy.sakura.com.tw/media/12633/絲絨門板-D4301-淺石灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12634', N'product_images', N'82203', N'https://buy.sakura.com.tw/media/12634/絲絨門板-D4302-月光白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12635', N'product_images', N'82204', N'https://buy.sakura.com.tw/media/12635/絲絨門板-D4303-深霧灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12637', N'product_images', N'82206', N'https://buy.sakura.com.tw/media/12637/絲絨門板-D4305-流砂米-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12638', N'product_images', N'82205', N'https://buy.sakura.com.tw/media/12638/絲絨門板-D4304-峽灣綠-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12639', N'product_images', N'82221', N'https://buy.sakura.com.tw/media/12639/極晶耀門板-D6190-D13W-暖白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12640', N'product_images', N'82222', N'https://buy.sakura.com.tw/media/12640/極晶耀門板-D6190-D17W-雪白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12641', N'product_images', N'82223', N'https://buy.sakura.com.tw/media/12641/極晶耀門板-D6190-D86GR-岩灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12642', N'product_images', N'82212', N'https://buy.sakura.com.tw/media/12642/晶耀門板-D6189-DSK16-溫柔沙Likable-Sand-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12643', N'product_images', N'82213', N'https://buy.sakura.com.tw/media/12643/晶耀門板-D6189-DSK23-海松卡其綠Khaki-Green-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12644', N'product_images', N'82214', N'https://buy.sakura.com.tw/media/12644/晶耀門板-D6189-DSK30-古典紳士灰Urbane-Bronze-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12645', N'product_images', N'82215', N'https://buy.sakura.com.tw/media/12645/晶耀門板-D6189-DSK33-繆思紗杏Muslin-Beige-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12646', N'product_images', N'82216', N'https://buy.sakura.com.tw/media/12646/晶耀門板-D6189-DSK04-河谷綠Wadi-Shab-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12647', N'product_images', N'82217', N'https://buy.sakura.com.tw/media/12647/晶耀門板-D6189-DSK09-芝加哥藍Chicago-Blue-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12648', N'product_images', N'82218', N'https://buy.sakura.com.tw/media/12648/晶耀門板-D6189-DSK12-緬梔黃Mellow-Yellow-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12649', N'product_images', N'82219', N'https://buy.sakura.com.tw/media/12649/晶耀門板-D6189-DSK15-寶石紅Red-Wine-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12650', N'product_images', N'82220', N'https://buy.sakura.com.tw/media/12650/晶耀門板-D6189-DSK21-深邃黑Deep-Black-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12651', N'product_images', N'82207', N'https://buy.sakura.com.tw/media/12651/框型四邊封門板-D4607-D143-珍珠白榆木-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12652', N'product_images', N'82208', N'https://buy.sakura.com.tw/media/12652/框型四邊封門板-D4607-DK5276-桑加洛榆木-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12653', N'product_images', N'82209', N'https://buy.sakura.com.tw/media/12653/框型四邊封門板-D4607-D570-陶瓷白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12654', N'product_images', N'82210', N'https://buy.sakura.com.tw/media/12654/框型四邊封門板-D4607-D575-迪亞曼特白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12655', N'product_images', N'82211', N'https://buy.sakura.com.tw/media/12655/框型四邊封門板-D4607-D769-蘇格蘭梣木-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12656', N'product_images', N'82200', N'https://buy.sakura.com.tw/media/12656/MFC四邊封門板-D3506-金色山脈-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12657', N'product_images', N'82201', N'https://buy.sakura.com.tw/media/12657/MFC四邊封門板-D3508-墨灰碩岩-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12658', N'product_images', N'82188', N'https://buy.sakura.com.tw/media/12658/MFC四邊封門板-D2536-可可橡木-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12659', N'product_images', N'82199', N'https://buy.sakura.com.tw/media/12659/MFC四邊封門板-D3504-泥灰岩-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12661', N'product_images', N'82468', N'https://buy.sakura.com.tw/media/12661/HKB-760-SC.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12664', N'RoHS', N'82468', N'https://buy.sakura.com.tw/files/12664/HKB-760-SC-RoHS表.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12665', N'型錄', N'82468', N'https://buy.sakura.com.tw/files/12665/HKB-760-SC-蒸烤箱_DM.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12671', N'說明書', N'82468', N'https://buy.sakura.com.tw/files/12671/HKB-760-SC說明書.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12673', N'product_images', N'82469', N'https://buy.sakura.com.tw/media/12673/陶瓷塗裝細邊框型門板-類金屬色-D7208-D8419-馥麗金-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12675', N'product_images', N'82276', N'https://buy.sakura.com.tw/media/12675/膜壓門板(臻美)-D6111-D41703-雲白橡木-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12676', N'product_images', N'82277', N'https://buy.sakura.com.tw/media/12676/膜壓門板(臻美)-D6111-D5712R-藍灰橡木-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12677', N'product_images', N'82278', N'https://buy.sakura.com.tw/media/12677/膜壓門板(臻美)-D6111-D7781R-灰調橡木-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12800', N'說明書', N'82138', N'https://buy.sakura.com.tw/files/12800/26700說明書.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12801', N'說明書', N'82137', N'https://buy.sakura.com.tw/files/12801/26700說明書.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12878', N'product_images', N'82445', N'https://buy.sakura.com.tw/media/12878/CORIAN人造石檯面-50SP-CW103-Cameo-White-奶白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12879', N'product_images', N'82446', N'https://buy.sakura.com.tw/media/12879/CORIAN人造石檯面-50SP-DV233-Dove-灰鴿-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12880', N'product_images', N'82447', N'https://buy.sakura.com.tw/media/12880/CORIAN人造石檯面-50SP-EV502-Everest-雪花白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12881', N'product_images', N'82448', N'https://buy.sakura.com.tw/media/12881/CORIAN人造石檯面-50SP-IS528-Salt-鹽白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12882', N'product_images', N'82449', N'https://buy.sakura.com.tw/media/12882/CORIAN人造石檯面-50SP-LN228-Linen-亞麻布-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12883', N'product_images', N'82450', N'https://buy.sakura.com.tw/media/12883/CORIAN人造石檯面-50SP-MT707-Antarctica-南極-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12884', N'product_images', N'82456', N'https://buy.sakura.com.tw/media/12884/CORIAN人造石檯面-50SP-HY2519-Deep-Night-Sky-深夜空-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12885', N'product_images', N'82451', N'https://buy.sakura.com.tw/media/12885/CORIAN人造石檯面-50SP-MS703-Sahara-沙褐-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12886', N'product_images', N'82452', N'https://buy.sakura.com.tw/media/12886/CORIAN人造石檯面-50SP-RP230-Rice-Paper-米紙-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12887', N'product_images', N'82453', N'https://buy.sakura.com.tw/media/12887/CORIAN人造石檯面-50SP-TW726-Arctic-北極-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12888', N'product_images', N'82454', N'https://buy.sakura.com.tw/media/12888/CORIAN人造石檯面-50SP-WJ229-White-Jasmine-茉莉-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12889', N'product_images', N'82455', N'https://buy.sakura.com.tw/media/12889/CORIAN人造石檯面-50SP-VW606-Venaro-White-暗紋白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12890', N'product_images', N'82443', N'https://buy.sakura.com.tw/media/12890/HANEX-BRIONNE遠紅外線人造石檯面-50PP-B-012-Oslo-White-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12891', N'product_images', N'82444', N'https://buy.sakura.com.tw/media/12891/HANEX-BRIONNE遠紅外線人造石檯面-50PP-B-031-Helsinki-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12892', N'product_images', N'82424', N'https://buy.sakura.com.tw/media/12892/HANEX-STRATUM火山石檯面-C5301-ST-101-Clara-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12893', N'product_images', N'82427', N'https://buy.sakura.com.tw/media/12893/HANEX-STRATUM火山石檯面-C5301-ST-102-Marelinho-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12894', N'product_images', N'82435', N'https://buy.sakura.com.tw/media/12894/HANEX-STRATUM火山石檯面-C5301-ST-103-Nubulado-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12895', N'product_images', N'82436', N'https://buy.sakura.com.tw/media/12895/HANEX-STRATUM火山石檯面-C5301-ST-104-Ardosia-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12896', N'product_images', N'82437', N'https://buy.sakura.com.tw/media/12896/HANEX-STRATUM火山石檯面-C5301-ST-105-Moreno-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12897', N'product_images', N'82439', N'https://buy.sakura.com.tw/media/12897/HANEX-STRATUM火山石檯面-C5301-ST-106-Grenicio-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12898', N'product_images', N'82441', N'https://buy.sakura.com.tw/media/12898/HANEX-STRATUM火山石檯面-C5301-ST-201-Romano-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12899', N'product_images', N'82442', N'https://buy.sakura.com.tw/media/12899/HANEX-STRATUM火山石檯面-C5301-ST-202-Caramel-Drizzle-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12900', N'product_images', N'82350', N'https://buy.sakura.com.tw/media/12900/ＨANEX人造石檯面-C5082(素色)-S-004-Ivory-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12901', N'product_images', N'82352', N'https://buy.sakura.com.tw/media/12901/ＨANEX人造石檯面-C5082(素色)-S-008-N-White-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12902', N'product_images', N'82359', N'https://buy.sakura.com.tw/media/12902/ＨANEX人造石檯面-C5083(花色)-T-021-Pure-Arctic-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12903', N'product_images', N'82374', N'https://buy.sakura.com.tw/media/12903/ＨANEX人造石檯面-C5083(花色)-M-007-Black-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12904', N'product_images', N'82373', N'https://buy.sakura.com.tw/media/12904/ＨANEX人造石檯面-C5083(花色)-M-003-Red-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12905', N'product_images', N'82372', N'https://buy.sakura.com.tw/media/12905/ＨANEX人造石檯面-C5083(花色)-T-204-Silk-Vivian-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12906', N'product_images', N'82371', N'https://buy.sakura.com.tw/media/12906/ＨANEX人造石檯面-C5083(花色)-D-012-Lightbrown-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12907', N'product_images', N'82369', N'https://buy.sakura.com.tw/media/12907/ＨANEX人造石檯面-C5083(花色)-C-004-Cubic-Transblanc-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12908', N'product_images', N'82368', N'https://buy.sakura.com.tw/media/12908/ＨANEX人造石檯面-C5083(花色)-D-003-Goldbrown-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12909', N'product_images', N'82366', N'https://buy.sakura.com.tw/media/12909/ＨANEX人造石檯面-C5083(花色)-T-025-Chestnut-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12910', N'product_images', N'82365', N'https://buy.sakura.com.tw/media/12910/ＨANEX人造石檯面-C5083(花色)-T-003-H-Ivory-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12911', N'product_images', N'82364', N'https://buy.sakura.com.tw/media/12911/ＨANEX人造石檯面-C5083(花色)-T-012-H-Elegance-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12912', N'product_images', N'82363', N'https://buy.sakura.com.tw/media/12912/ＨANEX人造石檯面-C5083(花色)-D-007-Mist-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12913', N'product_images', N'82361', N'https://buy.sakura.com.tw/media/12913/ＨANEX人造石檯面-C5083(花色)-D-025-Light-Sand-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12914', N'product_images', N'82312', N'https://buy.sakura.com.tw/media/12914/HANSTONE石英石檯面-C50H1-CL101-Aurora-Snow-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12915', N'product_images', N'82313', N'https://buy.sakura.com.tw/media/12915/HANSTONE石英石檯面-C50H1-CL105-Tiffany-Grey-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12916', N'product_images', N'82314', N'https://buy.sakura.com.tw/media/12916/HANSTONE石英石檯面-C50H2-BA201-Bianco-Canvas-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12917', N'product_images', N'82315', N'https://buy.sakura.com.tw/media/12917/HANSTONE石英石檯面-C50H2-RS314-Vanilla-Java-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12918', N'product_images', N'82316', N'https://buy.sakura.com.tw/media/12918/HANSTONE石英石檯面-C50H3-CT402-Specchio-White-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12919', N'product_images', N'82317', N'https://buy.sakura.com.tw/media/12919/HANSTONE石英石檯面-C50H3-BT354-Matier-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12920', N'product_images', N'82320', N'https://buy.sakura.com.tw/media/12920/HANSTONE石英石檯面-C50H4-RU601-Aspen-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12921', N'product_images', N'82318', N'https://buy.sakura.com.tw/media/12921/HANSTONE石英石檯面-C50H3-BA205-Royale-Blanc-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12923', N'product_images', N'82258', N'https://buy.sakura.com.tw/media/12923/SILESTONE賽麗石檯面-C506P-CS8102-Gris-Expo-20mm-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12924', N'product_images', N'82260', N'https://buy.sakura.com.tw/media/12924/SILESTONE賽麗石檯面-C5053-CS201-Blanco-Norte-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12925', N'product_images', N'82265', N'https://buy.sakura.com.tw/media/12925/SILESTONE賽麗石檯面-C5054-CS601-Blanco-Zeus-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12926', N'product_images', N'82269', N'https://buy.sakura.com.tw/media/12926/SILESTONE賽麗石檯面-C5054-CS602-Yukon-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12927', N'product_images', N'82279', N'https://buy.sakura.com.tw/media/12927/SILESTONE賽麗石檯面-C5054-CS604-Haiku-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12928', N'product_images', N'82280', N'https://buy.sakura.com.tw/media/12928/SILESTONE賽麗石檯面-C5054-CS606-Negro-Stellar-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12929', N'product_images', N'82282', N'https://buy.sakura.com.tw/media/12929/SILESTONE賽麗石檯面-C5054-CS611-Bianco-River-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12930', N'product_images', N'82285', N'https://buy.sakura.com.tw/media/12930/SILESTONE賽麗石檯面-C5054-CS612-Blanco-Maple-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12931', N'product_images', N'82287', N'https://buy.sakura.com.tw/media/12931/SILESTONE賽麗石檯面-C5054-CS614-Kensho-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12932', N'product_images', N'82291', N'https://buy.sakura.com.tw/media/12932/SILESTONE賽麗石檯面-C5054-CS621-Negro-Tebas-(皮紋面)-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12934', N'product_images', N'82471', N'https://buy.sakura.com.tw/media/12934/SILESTONE賽麗石檯面-C5054-CS623-Gris-Expo-(火燒面)-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12935', N'product_images', N'82296', N'https://buy.sakura.com.tw/media/12935/SILESTONE賽麗石檯面-C5055-CS504-Lyra-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12936', N'product_images', N'82297', N'https://buy.sakura.com.tw/media/12936/SILESTONE賽麗石檯面-C5054-CS623-Gris-Expo-(火燒面)-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12937', N'product_images', N'82298', N'https://buy.sakura.com.tw/media/12937/SILESTONE賽麗石檯面-C5055-CS509-Kensho-(火燒面)-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12938', N'product_images', N'82294', N'https://buy.sakura.com.tw/media/12938/SILESTONE賽麗石檯面-C5055-CS501-Alpina-White-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12939', N'product_images', N'82295', N'https://buy.sakura.com.tw/media/12939/SILESTONE賽麗石檯面-C5055-CS503-Blanco-Zeus-(皮紋面)-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12940', N'product_images', N'82299', N'https://buy.sakura.com.tw/media/12940/SILESTONE賽麗石檯面-C5058-CS8601-Blanco-Zeus-20mm-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12941', N'product_images', N'82300', N'https://buy.sakura.com.tw/media/12941/SILESTONE賽麗石檯面-C5058-CS8602-Yukon-20mm-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12942', N'product_images', N'82302', N'https://buy.sakura.com.tw/media/12942/SILESTONE賽麗石檯面-C5058-CS8603-Blanco-Stellar-20mm-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12943', N'product_images', N'82303', N'https://buy.sakura.com.tw/media/12943/SILESTONE賽麗石檯面-C5058-CS8606-Negro-Stellar-20mm-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12944', N'product_images', N'82304', N'https://buy.sakura.com.tw/media/12944/SILESTONE賽麗石檯面-C5058-CS8611-Bianco-River-20mm-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12945', N'product_images', N'82305', N'https://buy.sakura.com.tw/media/12945/SILESTONE賽麗石檯面-C5058-CS8612-Blanco-Maple-20mm-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12946', N'product_images', N'82306', N'https://buy.sakura.com.tw/media/12946/SILESTONE賽麗石檯面-C5059-CS8501-Alpina-White-20mm-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12947', N'product_images', N'82307', N'https://buy.sakura.com.tw/media/12947/SILESTONE賽麗石檯面-C5059-CS8503-Blanco-Zeus-Extra-(皮紋面)-20mm-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12948', N'product_images', N'82309', N'https://buy.sakura.com.tw/media/12948/SILESTONE賽麗石檯面-C506P-CS8102-Gris-Expo-20mm-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12949', N'product_images', N'82311', N'https://buy.sakura.com.tw/media/12949/SILESTONE賽麗石檯面-C506P-CS8201-Blanco-Norte-20mm-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12950', N'product_images', N'82457', N'https://buy.sakura.com.tw/media/12950/不鏽鋼檯面A型檯面-C38160-2102-不鏽鋼A型檯面-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12951', N'product_images', N'82458', N'https://buy.sakura.com.tw/media/12951/不鏽鋼檯面B型檯面-C39160-2102-不鏽鋼B型檯面-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12952', N'product_images', N'82174', N'https://buy.sakura.com.tw/media/12952/西班牙Coverlam卡沃石檯面-C5406-CL601-晨霧白-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12953', N'product_images', N'82224', N'https://buy.sakura.com.tw/media/12953/西班牙Coverlam卡沃石檯面-C5406-CL602-卡拉卡塔-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12954', N'product_images', N'82225', N'https://buy.sakura.com.tw/media/12954/西班牙Coverlam卡沃石檯面-C5406-CL603-清水模-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12955', N'product_images', N'82226', N'https://buy.sakura.com.tw/media/12955/西班牙Coverlam卡沃石檯面-C5407-CL704-古銅岩-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12956', N'product_images', N'82227', N'https://buy.sakura.com.tw/media/12956/西班牙Coverlam卡沃石檯面-C5407-CL705-鐵礦岩-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12957', N'product_images', N'82253', N'https://buy.sakura.com.tw/media/12957/西班牙Coverlam卡沃石檯面-C5407-CL706-黑金石-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12959', N'product_images', N'82459', N'https://buy.sakura.com.tw/media/12959/美耐板加厚檯面-風格-6317H-斑駁灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12960', N'product_images', N'82460', N'https://buy.sakura.com.tw/media/12960/美耐板加厚檯面-風格-7377MH-金砂之城-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12961', N'product_images', N'82461', N'https://buy.sakura.com.tw/media/12961/美耐板加厚檯面-風格-7378MH-銀輝之城-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12962', N'product_images', N'82462', N'https://buy.sakura.com.tw/media/12962/美耐板加厚檯面-風格-7383MH-金調暖灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12963', N'product_images', N'82463', N'https://buy.sakura.com.tw/media/12963/美耐板加厚檯面-風格-0806MH-卵石灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12965', N'product_images', N'82464', N'https://buy.sakura.com.tw/media/12965/美耐板加厚檯面-風格-8832H-鏽蝕-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12966', N'product_images', N'82465', N'https://buy.sakura.com.tw/media/12966/美耐板加厚檯面-風格-1541NT-玄炭松-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12970', N'product_images', N'82325', N'https://buy.sakura.com.tw/media/12970/SAKURA-STONE石英石檯面-C511P-SV016-Starry-Grey-星點灰-情境圖.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12972', N'product_images', N'82348', N'https://buy.sakura.com.tw/media/12972/FENIX門板-D9201-D0032-科斯白BiancoKos-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12973', N'product_images', N'82349', N'https://buy.sakura.com.tw/media/12973/FENIX門板-D9201-D0718-倫敦灰GrigioLondra-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12974', N'product_images', N'82351', N'https://buy.sakura.com.tw/media/12974/FENIX門板-D9201-D0720-亞光黑Nero-Lngo-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12975', N'product_images', N'82353', N'https://buy.sakura.com.tw/media/12975/FENIX門板-D9201-D0750-湖水綠Verde-Comodoro-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12976', N'product_images', N'82356', N'https://buy.sakura.com.tw/media/12976/FENIX門板-D9201-D0754-摩洛哥藍Blue-Fes-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12977', N'product_images', N'82354', N'https://buy.sakura.com.tw/media/12977/FENIX門板-D9201-D0751-齋浦爾紅RossoJaipur-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12978', N'product_images', N'82175', N'https://buy.sakura.com.tw/media/12978/MFC四邊封門板-D1109-靜謐白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12979', N'product_images', N'82176', N'https://buy.sakura.com.tw/media/12979/MFC四邊封門板-D1179-米布織-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12980', N'product_images', N'82177', N'https://buy.sakura.com.tw/media/12980/MFC四邊封門板-D1180-瓷釉綠-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12981', N'product_images', N'82178', N'https://buy.sakura.com.tw/media/12981/MFC四邊封門板-D1181-輕甜粉漾-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12982', N'product_images', N'82179', N'https://buy.sakura.com.tw/media/12982/MFC四邊封門板-D1182-靜謐藍灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12983', N'product_images', N'82180', N'https://buy.sakura.com.tw/media/12983/MFC四邊封門板-D2510-銀灰清水模-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12984', N'product_images', N'82181', N'https://buy.sakura.com.tw/media/12984/MFC四邊封門板-D2535-暮光棕橡-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12985', N'product_images', N'82182', N'https://buy.sakura.com.tw/media/12985/MFC四邊封門板-D2537-曠野灰橡-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12986', N'product_images', N'82183', N'https://buy.sakura.com.tw/media/12986/MFC四邊封門板-D2503-天然橡木-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12987', N'product_images', N'82184', N'https://buy.sakura.com.tw/media/12987/MFC四邊封門板-D2513-冰島白橡-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12988', N'product_images', N'82185', N'https://buy.sakura.com.tw/media/12988/MFC四邊封門板-D2526-北歐櫸木-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12989', N'product_images', N'82186', N'https://buy.sakura.com.tw/media/12989/MFC四邊封門板-D2529-自然胡桃木-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12990', N'product_images', N'82187', N'https://buy.sakura.com.tw/media/12990/MFC四邊封門板-D2533-胭脂胡桃木-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12991', N'product_images', N'82188', N'https://buy.sakura.com.tw/media/12991/MFC四邊封門板-D2536-可可橡木-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12992', N'product_images', N'82189', N'https://buy.sakura.com.tw/media/12992/MFC四邊封門板-D2512-晨霧木白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12993', N'product_images', N'82194', N'https://buy.sakura.com.tw/media/12993/MFC四邊封門板-D2530-鈦絲金-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12994', N'product_images', N'82193', N'https://buy.sakura.com.tw/media/12994/MFC四邊封門板-D2528-霧香奶茶-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12995', N'product_images', N'82192', N'https://buy.sakura.com.tw/media/12995/MFC四邊封門板-D2527-都會黑橡-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12996', N'product_images', N'82191', N'https://buy.sakura.com.tw/media/12996/MFC四邊封門板-D2525-鈦絲銀-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12997', N'product_images', N'82190', N'https://buy.sakura.com.tw/media/12997/MFC四邊封門板-D2516-板岩栓木-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12998', N'product_images', N'82195', N'https://buy.sakura.com.tw/media/12998/MFC四邊封門板-D2531-科技銀-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'12999', N'product_images', N'82196', N'https://buy.sakura.com.tw/media/12999/MFC四邊封門板-D2532-鎏金銅-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13000', N'product_images', N'82197', N'https://buy.sakura.com.tw/media/13000/MFC四邊封門板-D2534-白曦杉木-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13001', N'product_images', N'82197', N'https://buy.sakura.com.tw/media/13001/MFC四邊封門板-D2534-白曦杉木-情境圖.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13002', N'product_images', N'82198', N'https://buy.sakura.com.tw/media/13002/MFC四邊封門板-D3503-白雲岩-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13003', N'product_images', N'82199', N'https://buy.sakura.com.tw/media/13003/MFC四邊封門板-D3504-泥灰岩-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13004', N'product_images', N'82200', N'https://buy.sakura.com.tw/media/13004/MFC四邊封門板-D3506-金色山脈-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13005', N'product_images', N'82201', N'https://buy.sakura.com.tw/media/13005/MFC四邊封門板-D3508-默灰碩岩-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13013', N'product_images', N'82228', N'https://buy.sakura.com.tw/media/13013/Style風格門板-D6501-D0806MH-卵石灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13014', N'product_images', N'82229', N'https://buy.sakura.com.tw/media/13014/Style風格門板-D6501-D6317H-斑駁灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13015', N'product_images', N'82230', N'https://buy.sakura.com.tw/media/13015/Style風格門板-D6501-D7377MH-金砂之城-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13016', N'product_images', N'82231', N'https://buy.sakura.com.tw/media/13016/Style風格門板-D6501-D7378MH-銀輝之城-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13019', N'product_images', N'82234', N'https://buy.sakura.com.tw/media/13019/Style風格門板-D6501-D8832H-鏽蝕-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13022', N'RoHS', N'82472', N'https://buy.sakura.com.tw/files/13022/VD6561洗碗機RoHS.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13023', N'product_images', N'82233', N'https://buy.sakura.com.tw/media/13023/Style風格門板-D6501-D8816K-璀璨金-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13024', N'product_images', N'82232', N'https://buy.sakura.com.tw/media/13024/Style風格門板-D6501-D7383MH-金調暖灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13025', N'型錄', N'82472', N'https://buy.sakura.com.tw/files/13025/svago-VD6561型錄.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13026', N'product_images', N'82466', N'https://buy.sakura.com.tw/media/13026/金屬門板-D1190-金屬拉絲銀-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13027', N'product_images', N'82406', N'https://buy.sakura.com.tw/media/13027/染色實木門板-D4008-EA01-經典白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13028', N'product_images', N'82407', N'https://buy.sakura.com.tw/media/13028/染色實木門板-D4008-EA02-雅致米-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13029', N'product_images', N'82408', N'https://buy.sakura.com.tw/media/13029/染色實木門板-D4008-EA06-天空藍-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13030', N'product_images', N'82409', N'https://buy.sakura.com.tw/media/13030/染色實木門板-D4008-EA07-海洋藍-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13031', N'product_images', N'82410', N'https://buy.sakura.com.tw/media/13031/染色實木門板-D4008-EA08-石木橡-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13032', N'product_images', N'82411', N'https://buy.sakura.com.tw/media/13032/染色實木門板-D4008-EA09-童話藍-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13033', N'product_images', N'82412', N'https://buy.sakura.com.tw/media/13033/染色實木門板-D4008-EA10-湖水綠-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13034', N'product_images', N'82413', N'https://buy.sakura.com.tw/media/13034/染色實木門板-D4008-EA11-森林綠-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13035', N'product_images', N'82414', N'https://buy.sakura.com.tw/media/13035/染色實木門板-D4008-EA12-田園黃-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13046', N'product_images', N'82423', N'https://buy.sakura.com.tw/media/13046/染色實木格柵門板-D4009-EA12-田園黃-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13047', N'product_images', N'82422', N'https://buy.sakura.com.tw/media/13047/染色實木格柵門板-D4009-EA11-森林綠-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13048', N'product_images', N'82415', N'https://buy.sakura.com.tw/media/13048/染色實木格柵門板-D4009-EA01-經典白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13049', N'product_images', N'82416', N'https://buy.sakura.com.tw/media/13049/染色實木格柵門板-D4009-EA02-雅致米-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13050', N'product_images', N'82417', N'https://buy.sakura.com.tw/media/13050/染色實木格柵門板-D4009-EA06-天空藍-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13051', N'product_images', N'82419', N'https://buy.sakura.com.tw/media/13051/染色實木格柵門板-D4009-EA08-石木橡-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13052', N'product_images', N'82420', N'https://buy.sakura.com.tw/media/13052/染色實木格柵門板-D4009-EA09-童話藍-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13053', N'product_images', N'82418', N'https://buy.sakura.com.tw/media/13053/染色實木格柵門板-D4009-EA07-海洋藍-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13054', N'product_images', N'82421', N'https://buy.sakura.com.tw/media/13054/染色實木格柵門板-D4009-EA10-湖水綠-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13055', N'product_images', N'82425', N'https://buy.sakura.com.tw/media/13055/原色實木門板-D4010-白荃木-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13056', N'product_images', N'82426', N'https://buy.sakura.com.tw/media/13056/原色實木門板-D4011-胡桃木-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13057', N'product_images', N'82207', N'https://buy.sakura.com.tw/media/13057/框型四邊封門板-D4607-D143-珍珠白榆木-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13058', N'product_images', N'82208', N'https://buy.sakura.com.tw/media/13058/框型四邊封門板-D4607-DK5276-桑加洛榆木-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13059', N'product_images', N'82209', N'https://buy.sakura.com.tw/media/13059/框型四邊封門板-D4607-D570-陶瓷白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13060', N'product_images', N'82210', N'https://buy.sakura.com.tw/media/13060/框型四邊封門板-D4607-D575-迪亞曼特白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13061', N'product_images', N'82211', N'https://buy.sakura.com.tw/media/13061/框型四邊封門板-D4607-D769-蘇格蘭梣木-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13062', N'product_images', N'82438', N'https://buy.sakura.com.tw/media/13062/烤漆實木格子窗清玻璃門板-D4012-D4706-實木烤漆鋼刷木紋雅緻白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13063', N'product_images', N'82440', N'https://buy.sakura.com.tw/media/13063/烤漆實木格子窗清玻璃門板-D4013-D9717-實木烤漆鋼刷木紋白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13064', N'product_images', N'82284', N'https://buy.sakura.com.tw/media/13064/陶瓷塗裝J型門板-素色-D7205-D8410-雪絨白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13065', N'product_images', N'82286', N'https://buy.sakura.com.tw/media/13065/陶瓷塗裝J型門板-素色-D7205-D8411-樺木灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13067', N'product_images', N'82288', N'https://buy.sakura.com.tw/media/13067/陶瓷塗裝J型門板-素色-D7205-D8412-暖砂米-情境圖.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13068', N'product_images', N'82289', N'https://buy.sakura.com.tw/media/13068/陶瓷塗裝J型門板-素色-D7205-D8413-晨霧藍-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13069', N'product_images', N'82290', N'https://buy.sakura.com.tw/media/13069/陶瓷塗裝J型門板-素色-D7205-D8414-磐石灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13070', N'product_images', N'82293', N'https://buy.sakura.com.tw/media/13070/陶瓷塗裝J型門板-素色-D7205-D8415-摩卡棕-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13071', N'product_images', N'82301', N'https://buy.sakura.com.tw/media/13071/陶瓷塗裝J型門板-素色-D7205-D8416-松針綠-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13072', N'product_images', N'82308', N'https://buy.sakura.com.tw/media/13072/陶瓷塗裝J型門板-素色-D7205-D8417-赭岩紅-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13073', N'product_images', N'82310', N'https://buy.sakura.com.tw/media/13073/陶瓷塗裝J型門板-素色-D7205-D8418-石墨黑-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13074', N'product_images', N'82319', N'https://buy.sakura.com.tw/media/13074/陶瓷塗裝J型門板-類金屬色-D7206-D8419-馥麗金-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13076', N'product_images', N'82319', N'https://buy.sakura.com.tw/media/13076/陶瓷塗裝J型門板-類金屬色-D7206-D8419-馥麗金-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13078', N'product_images', N'82249', N'https://buy.sakura.com.tw/media/13078/陶瓷塗裝門板-素色-D7201-D8410-雪絨白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13079', N'product_images', N'82250', N'https://buy.sakura.com.tw/media/13079/陶瓷塗裝門板-素色-D7201-D8411-樺木灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13080', N'product_images', N'82251', N'https://buy.sakura.com.tw/media/13080/陶瓷塗裝門板-素色-D7201-D8412-暖砂米-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13082', N'product_images', N'82252', N'https://buy.sakura.com.tw/media/13082/陶瓷塗裝門板-素色-D7201-D8413-晨霧藍-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13083', N'product_images', N'82254', N'https://buy.sakura.com.tw/media/13083/陶瓷塗裝門板-素色-D7201-D8414-磐石灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13084', N'product_images', N'82255', N'https://buy.sakura.com.tw/media/13084/陶瓷塗裝門板-素色-D7201-D8415-摩卡棕-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13085', N'product_images', N'82256', N'https://buy.sakura.com.tw/media/13085/陶瓷塗裝門板-素色-D7201-D8416-松針綠-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13086', N'product_images', N'82257', N'https://buy.sakura.com.tw/media/13086/陶瓷塗裝門板-素色-D7201-D8417-赭岩紅-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13087', N'product_images', N'82273', N'https://buy.sakura.com.tw/media/13087/陶瓷塗裝門板-類金屬色-D7204-D8419-馥麗金-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13088', N'product_images', N'82327', N'https://buy.sakura.com.tw/media/13088/陶瓷塗裝細邊框型門板-素色-D7207-D8410-雪絨白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13089', N'product_images', N'82332', N'https://buy.sakura.com.tw/media/13089/陶瓷塗裝細邊框型門板-素色-D7207-D8411-樺木灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13090', N'product_images', N'82334', N'https://buy.sakura.com.tw/media/13090/陶瓷塗裝細邊框型門板-素色-D7207-D8412-暖砂米-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13091', N'product_images', N'82338', N'https://buy.sakura.com.tw/media/13091/陶瓷塗裝細邊框型門板-素色-D7207-D8413-晨霧藍-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13092', N'product_images', N'82340', N'https://buy.sakura.com.tw/media/13092/陶瓷塗裝細邊框型門板-素色-D7207-D8414-磐石灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13093', N'product_images', N'82342', N'https://buy.sakura.com.tw/media/13093/陶瓷塗裝細邊框型門板-素色-D7207-D8415-摩卡棕-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13098', N'product_images', N'82345', N'https://buy.sakura.com.tw/media/13098/陶瓷塗裝細邊框型門板-素色-D7207-D8417-赭岩紅-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13099', N'product_images', N'82346', N'https://buy.sakura.com.tw/media/13099/陶瓷塗裝細邊框型門板-素色-D7207-D8418-石墨黑-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13101', N'product_images', N'82343', N'https://buy.sakura.com.tw/media/13101/陶瓷塗裝細邊框型門板-素色-D7207-D8416-松針綠-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13102', N'product_images', N'82469', N'https://buy.sakura.com.tw/media/13102/陶瓷塗裝細邊框型門板-類金屬色-D7208-D8419-馥麗金-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13103', N'product_images', N'82212', N'https://buy.sakura.com.tw/media/13103/晶耀門板-D6189-DSK16-溫柔沙Likable-Sand-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13104', N'product_images', N'82213', N'https://buy.sakura.com.tw/media/13104/晶耀門板-D6189-DSK23-海松卡其綠Khaki-Green-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13106', N'product_images', N'82214', N'https://buy.sakura.com.tw/media/13106/晶耀門板-D6189-DSK30-古典紳士灰Urbane-Bronze-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13107', N'product_images', N'82215', N'https://buy.sakura.com.tw/media/13107/晶耀門板-D6189-DSK33-繆思紗杏Muslin-Beige-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13109', N'product_images', N'82216', N'https://buy.sakura.com.tw/media/13109/晶耀門板-D6189-DSK04-河谷綠Wadi-Shab-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13111', N'product_images', N'82217', N'https://buy.sakura.com.tw/media/13111/晶耀門板-D6189-DSK09-芝加哥藍Chicago-Blue-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13112', N'product_images', N'82218', N'https://buy.sakura.com.tw/media/13112/晶耀門板-D6189-DSK12-緬梔黃Mellow-Yellow-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13113', N'product_images', N'82219', N'https://buy.sakura.com.tw/media/13113/晶耀門板-D6189-DSK15-寶石紅Red-Wine-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13114', N'product_images', N'82220', N'https://buy.sakura.com.tw/media/13114/晶耀門板-D6189-DSK21-深邃黑Deep-Black-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13115', N'product_images', N'82202', N'https://buy.sakura.com.tw/media/13115/絲絨門板-D4301-淺石灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13116', N'product_images', N'82203', N'https://buy.sakura.com.tw/media/13116/絲絨門板-D4302-月光白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13117', N'product_images', N'82204', N'https://buy.sakura.com.tw/media/13117/絲絨門板-D4303-深霧灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13118', N'product_images', N'82205', N'https://buy.sakura.com.tw/media/13118/絲絨門板-D4304-峽灣綠-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13119', N'product_images', N'82206', N'https://buy.sakura.com.tw/media/13119/絲絨門板-D4305-流砂米-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13120', N'product_images', N'82221', N'https://buy.sakura.com.tw/media/13120/極晶耀門板-D6190-D13W-暖白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13122', N'product_images', N'82222', N'https://buy.sakura.com.tw/media/13122/極晶耀門板-D6190-D17W-雪白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13123', N'product_images', N'82223', N'https://buy.sakura.com.tw/media/13123/極晶耀門板-D6190-D86GR-岩灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13125', N'product_images', N'82235', N'https://buy.sakura.com.tw/media/13125/銀線晶耀門板-D6195-DK01-雪白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13127', N'product_images', N'82236', N'https://buy.sakura.com.tw/media/13127/銀線晶耀門板-D6195-DK22-暖白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13128', N'product_images', N'82275', N'https://buy.sakura.com.tw/media/13128/膜壓門板(臻美)-D6111-D9717-木紋白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13129', N'product_images', N'82274', N'https://buy.sakura.com.tw/media/13129/膜壓門板(臻美)-D6111-D4706-雅緻白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13130', N'product_images', N'82276', N'https://buy.sakura.com.tw/media/13130/膜壓門板(臻美)-D6111-D41703-雲白橡木-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13132', N'product_images', N'82277', N'https://buy.sakura.com.tw/media/13132/膜壓門板(臻美)-D6111-D5712R-藍灰橡木-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13133', N'product_images', N'82278', N'https://buy.sakura.com.tw/media/13133/膜壓門板(臻美)-D6111-D7781R-灰調橡木-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13135', N'product_images', N'82237', N'https://buy.sakura.com.tw/media/13135/膜壓門板-D6109--038-霧光白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13136', N'product_images', N'82238', N'https://buy.sakura.com.tw/media/13136/膜壓門板-D6109--9717-木紋白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13137', N'product_images', N'82377', N'https://buy.sakura.com.tw/media/13137/鏡面塗裝門板-D9188-D9101-炭黑-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13138', N'product_images', N'82378', N'https://buy.sakura.com.tw/media/13138/鏡面塗裝門板-D9188-D9102-晶白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13139', N'product_images', N'82379', N'https://buy.sakura.com.tw/media/13139/鏡面塗裝門板-D9188-D9103-奶茶-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13140', N'product_images', N'82380', N'https://buy.sakura.com.tw/media/13140/鏡面塗裝門板-D9188-D9104-磚紅-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13141', N'product_images', N'82381', N'https://buy.sakura.com.tw/media/13141/鏡面塗裝門板-D9188-D9105-奶茶粉-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13142', N'product_images', N'82382', N'https://buy.sakura.com.tw/media/13142/鏡面塗裝門板-D9188-D9106-薄荷綠-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13143', N'product_images', N'82383', N'https://buy.sakura.com.tw/media/13143/鏡面塗裝門板-D9188-D9107-青蘋果綠-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13144', N'product_images', N'82384', N'https://buy.sakura.com.tw/media/13144/鏡面塗裝門板-D9188-D9108-嫩芽綠-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13147', N'product_images', N'82385', N'https://buy.sakura.com.tw/media/13147/鏡面塗裝門板-D9188-D9109-柔光藍-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13148', N'product_images', N'82386', N'https://buy.sakura.com.tw/media/13148/霧面塗裝門板(無造型)-D8589-D8511-晨霧白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13149', N'product_images', N'82387', N'https://buy.sakura.com.tw/media/13149/霧面塗裝門板(無造型)-D8589-D8512-柔霧米-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13150', N'product_images', N'82388', N'https://buy.sakura.com.tw/media/13150/霧面塗裝門板(無造型)-D8589-D8513-杏仁黃-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13151', N'product_images', N'82389', N'https://buy.sakura.com.tw/media/13151/霧面塗裝門板(無造型)-D8589-D8514-珊瑚橘-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13152', N'product_images', N'82390', N'https://buy.sakura.com.tw/media/13152/霧面塗裝門板(無造型)-D8589-D8515-暮色紅-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13153', N'product_images', N'82391', N'https://buy.sakura.com.tw/media/13153/霧面塗裝門板(無造型)-D8589-D8516-麥栗棕-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13154', N'product_images', N'82392', N'https://buy.sakura.com.tw/media/13154/霧面塗裝門板(無造型)-D8589-D8517-橄欖綠-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13155', N'product_images', N'82393', N'https://buy.sakura.com.tw/media/13155/霧面塗裝門板(無造型)-D8589-D8518-羅蘭紫-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13156', N'product_images', N'82394', N'https://buy.sakura.com.tw/media/13156/霧面塗裝門板(無造型)-D8589-D8519-石墨灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13157', N'product_images', N'82239', N'https://buy.sakura.com.tw/media/13157/霧感抗菌門板-D6310-M2572-卡其棕-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13158', N'product_images', N'82240', N'https://buy.sakura.com.tw/media/13158/霧感抗菌門板-D6310-M2573-淺石灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13159', N'product_images', N'82241', N'https://buy.sakura.com.tw/media/13159/霧感抗菌門板-D6310-M2575-蜜糖粉-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13160', N'product_images', N'82242', N'https://buy.sakura.com.tw/media/13160/霧感抗菌門板-D6310-M2576-薰衣紫-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13161', N'product_images', N'82243', N'https://buy.sakura.com.tw/media/13161/霧感抗菌門板-D6310-M2580-雪霧白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13162', N'product_images', N'82244', N'https://buy.sakura.com.tw/media/13162/霧感抗菌門板-D6310-M2581-暖霧白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13163', N'product_images', N'82245', N'https://buy.sakura.com.tw/media/13163/霧感抗菌門板-D6310-M2582-可可棕-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13164', N'product_images', N'82246', N'https://buy.sakura.com.tw/media/13164/霧感抗菌門板-D6310-M2583-質感灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13165', N'product_images', N'82247', N'https://buy.sakura.com.tw/media/13165/霧感抗菌門板-D6310-M2585-孔雀藍-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13166', N'product_images', N'82248', N'https://buy.sakura.com.tw/media/13166/霧感抗菌門板-D6310-M2587-暗夜黑-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13167', N'product_images', N'82261', N'https://buy.sakura.com.tw/media/13167/陶瓷塗裝門板-素色-D7203-D8410-雪絨白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13169', N'product_images', N'82262', N'https://buy.sakura.com.tw/media/13169/陶瓷塗裝門板-素色-D7203-D8411-樺木灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13170', N'product_images', N'82263', N'https://buy.sakura.com.tw/media/13170/陶瓷塗裝門板-素色-D7203-D8412-暖砂米-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13171', N'product_images', N'82264', N'https://buy.sakura.com.tw/media/13171/陶瓷塗裝門板-素色-D7203-D8413-晨霧藍-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13172', N'product_images', N'82266', N'https://buy.sakura.com.tw/media/13172/陶瓷塗裝門板-素色-D7203-D8414-磐石灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13173', N'product_images', N'82267', N'https://buy.sakura.com.tw/media/13173/陶瓷塗裝門板-素色-D7203-D8415-摩卡棕-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13174', N'product_images', N'82268', N'https://buy.sakura.com.tw/media/13174/陶瓷塗裝門板-素色-D7203-D8416-松針綠-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13175', N'product_images', N'82270', N'https://buy.sakura.com.tw/media/13175/陶瓷塗裝門板-素色-D7203-D8417-赭岩紅-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13177', N'product_images', N'82271', N'https://buy.sakura.com.tw/media/13177/陶瓷塗裝門板-素色-D7203-D8418-石墨黑-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13178', N'product_images', N'82259', N'https://buy.sakura.com.tw/media/13178/陶瓷塗裝門板-素色-D7201-D8418-石墨黑-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13179', N'使用手冊', N'82472', N'https://buy.sakura.com.tw/files/13179/VD6561說明書.pdf', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13180', N'product_images', N'82013', N'https://buy.sakura.com.tw/media/13180/圍籃半高櫃.png', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13182', N'product_images', N'81778', N'https://buy.sakura.com.tw/media/13182/LF119022-廚房不鏽鋼無鉛立式龍頭PNG_導購800X800-slide.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13183', N'product_images', N'81778', N'https://buy.sakura.com.tw/media/13183/立式_不鏽鋼無鉛立式龍頭_LF119022_1_re.png', N'8')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13185', N'product_images', N'80894', N'https://buy.sakura.com.tw/media/13185/LF5090.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13186', N'product_images', N'81779', N'https://buy.sakura.com.tw/media/13186/LF119033.png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13187', N'product_images', N'82040', N'https://buy.sakura.com.tw/media/13187/F0252.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13188', N'product_images', N'81549', N'https://buy.sakura.com.tw/media/13188/SF-750A-01-(去背_)800X800.png', N'4438')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13189', N'product_images', N'80100', N'https://buy.sakura.com.tw/media/13189/PDS880.png', N'1281')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13190', N'product_images', N'81947', N'https://buy.sakura.com.tw/media/13190/1713943353019.png', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13191', N'product_images', N'82281', N'https://buy.sakura.com.tw/media/13191/粗鋁框玻璃門板-D7009-D7009A-清玻璃-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13192', N'product_images', N'82283', N'https://buy.sakura.com.tw/media/13192/粗鋁框玻璃門板-D7009-D7009B-噴砂玻璃-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13193', N'product_images', N'82357', N'https://buy.sakura.com.tw/media/13193/黑色細鋁框玻璃門板-AIR(含垂直L型把手)-D7006-茶色玻璃-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13194', N'product_images', N'82375', N'https://buy.sakura.com.tw/media/13194/黑色細鋁框玻璃門板-D7010-D7010A-清玻璃-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13195', N'product_images', N'82376', N'https://buy.sakura.com.tw/media/13195/黑色細鋁框玻璃門板-D7010-D7010C-茶色玻璃-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13196', N'product_images', N'82405', N'https://buy.sakura.com.tw/media/13196/金色細鋁框玻璃門板-AIR(含垂直L型把手)-D7011-茶色玻璃-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13206', N'product_images', N'82325', N'https://buy.sakura.com.tw/media/13206/SAKURA-STONE石英石檯面-C511P-SV016-Starry-Grey-星點灰-產品圖.jpg', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13207', N'product_images', N'82326', N'https://buy.sakura.com.tw/media/13207/SAKURA-STONE石英石檯面-C5105-SV509-Winterthur-冰川岩-情境圖.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13208', N'product_images', N'82347', N'https://buy.sakura.com.tw/media/13208/SAKURA-STONE石英石檯面-C5113-SV9021--Galaxy-Black-銀河黑-情境圖.jpg', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13209', N'product_images', N'82482', N'https://buy.sakura.com.tw/media/13209/VD8565_web.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13211', N'RoHS', N'82482', N'https://buy.sakura.com.tw/files/13211/VD8565洗碗機RoHS.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13212', N'型錄', N'82482', N'https://buy.sakura.com.tw/files/13212/svago-VD8565型錄.pdf', N'4')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13216', N'使用手冊', N'82482', N'https://buy.sakura.com.tw/files/13216/VD8565說明書.pdf', N'5')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13218', N'product_images', N'82483', N'https://buy.sakura.com.tw/media/13218/GBC-30B0-1G-XBN_官網圖.png', N'1')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13220', N'說明書', N'82483', N'https://buy.sakura.com.tw/files/13220/GBC-30B0-1G-XBN-單口瓦斯爐_說明書.pdf', N'3')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13722', N'product_images', N'82472', N'https://buy.sakura.com.tw/media/13722/VD6561_new_web.png', N'7')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'13851', N'product_images', N'81966', N'https://buy.sakura.com.tw/media/13851/VDR7191官網圖.JPG', N'6')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'14030', N'product_images', N'82395', N'https://buy.sakura.com.tw/media/14030/陶瓷塗裝格柵門板-素色-D7209-D8410-雪絨白-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'14031', N'product_images', N'82396', N'https://buy.sakura.com.tw/media/14031/陶瓷塗裝格柵門板-素色-D7209-D8411-樺木灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'14032', N'product_images', N'82397', N'https://buy.sakura.com.tw/media/14032/陶瓷塗裝格柵門板-素色-D7209-D8412-暖砂米-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'14033', N'product_images', N'82398', N'https://buy.sakura.com.tw/media/14033/陶瓷塗裝格柵門板-素色-D7209-D8413-晨霧藍-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'14034', N'product_images', N'82399', N'https://buy.sakura.com.tw/media/14034/陶瓷塗裝格柵門板-素色-D7209-D8414-磐石灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'14035', N'product_images', N'82400', N'https://buy.sakura.com.tw/media/14035/陶瓷塗裝格柵門板-素色-D7209-D8415-摩卡棕-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'14036', N'product_images', N'82401', N'https://buy.sakura.com.tw/media/14036/陶瓷塗裝格柵門板-素色-D7209-D8416-松針綠-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'14037', N'product_images', N'82402', N'https://buy.sakura.com.tw/media/14037/陶瓷塗裝格柵門板-素色-D7209-D8417-赭岩紅-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'14038', N'product_images', N'82403', N'https://buy.sakura.com.tw/media/14038/陶瓷塗裝格柵門板-素色-D7209-D8418-石墨黑-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'14039', N'product_images', N'82428', N'https://buy.sakura.com.tw/media/14039/格柵門板-D9301,D9302-D0806MH-卵石灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'14041', N'product_images', N'82430', N'https://buy.sakura.com.tw/media/14041/格柵門板-D9301,D9302-D7377MH-金砂之城-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'14042', N'product_images', N'82431', N'https://buy.sakura.com.tw/media/14042/格柵門板-D9301,D9302-D7378MH-銀輝之城-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'14043', N'product_images', N'82432', N'https://buy.sakura.com.tw/media/14043/格柵門板-D9301,D9302-D7383MH-金調暖灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'14044', N'product_images', N'82433', N'https://buy.sakura.com.tw/media/14044/格柵門板-D9301,D9302-D8816K-璀璨金-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'14045', N'product_images', N'82434', N'https://buy.sakura.com.tw/media/14045/格柵門板-D9301,D9302-D8832H-鏽蝕-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'14046', N'product_images', N'82429', N'https://buy.sakura.com.tw/media/14046/格柵門板-D9301,D9302-D6317H-斑駁灰-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'14049', N'product_images', N'82272', N'https://buy.sakura.com.tw/media/14049/陶瓷塗裝門板-類金屬色-D7202-D8419-馥麗金-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'14050', N'product_images', N'82273', N'https://buy.sakura.com.tw/media/14050/陶瓷塗裝門板-類金屬色-D7204-D8419-馥麗金-情境圖.jpg', N'2')
GO

INSERT INTO [sync].[BuyKitchenPublicFiles] ([id], [type], [product_id], [url], [sort]) VALUES (N'14055', N'product_images', N'82404', N'https://buy.sakura.com.tw/media/14055/陶瓷塗裝格柵門板-類金屬色-D7210-D8419-馥麗金-情境圖.jpg', N'2')
GO

