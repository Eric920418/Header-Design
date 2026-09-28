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

 Date: 19/03/2026 13:03:55
*/


-- ----------------------------
-- Table structure for BuyKitchenProductPrices
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[sync].[BuyKitchenProductPrices]') AND type IN ('U'))
	DROP TABLE [sync].[BuyKitchenProductPrices]
GO

CREATE TABLE [sync].[BuyKitchenProductPrices] (
  [id] int  NOT NULL,
  [product_id] int  NOT NULL,
  [size] nvarchar(255) COLLATE Chinese_Taiwan_Stroke_CI_AS  NOT NULL,
  [price] int  NOT NULL
)
GO

ALTER TABLE [sync].[BuyKitchenProductPrices] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of BuyKitchenProductPrices
-- ----------------------------
INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'1762', N'1007', N'', N'0')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'5624', N'80630', N'', N'449000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'5640', N'80640', N'', N'948000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'5641', N'80377', N'', N'231000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'5642', N'80378', N'', N'899000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'5643', N'80379', N'', N'330000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'5644', N'80380', N'', N'178000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'5645', N'80381', N'', N'325000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8642', N'17', N'', N'300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8645', N'34', N'', N'27700')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8646', N'48', N'', N'2200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8647', N'49', N'', N'2200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8655', N'83', N'RA-004', N'280')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8656', N'84', N'RA-003', N'190')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8657', N'85', N'RA-009', N'110')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8658', N'86', N'RA-001', N'80')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8664', N'96', N'', N'300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8665', N'97', N'', N'300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8667', N'99', N'', N'450')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8668', N'100', N'', N'350')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8669', N'101', N'', N'450')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8672', N'104', N'C65-0121', N'450')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8673', N'105', N'', N'450')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8674', N'106', N'', N'420')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8675', N'107', N'', N'830')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8676', N'108', N'', N'1800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8677', N'109', N'', N'450')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8678', N'110', N'', N'3500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8679', N'111', N'', N'3500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8681', N'113', N'', N'1200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8684', N'118', N'', N'2600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8685', N'119', N'', N'3500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8686', N'120', N'', N'2400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8687', N'121', N'', N'3800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8688', N'122', N'', N'450')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8689', N'123', N'', N'500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8690', N'124', N'', N'500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8691', N'125', N'', N'500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8692', N'126', N'', N'1800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8693', N'127', N'', N'2000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8694', N'128', N'', N'2200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8742', N'958', N'', N'1800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8798', N'1033', N'', N'4000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8823', N'70047', N'', N'10000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8855', N'80100', N'W880xD525xH213mm', N'12800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8855', N'80100', N'W880xD525xH213mm', N'12800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8856', N'80101', N'W840xD510xH198mm', N'12200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'8856', N'80101', N'W840xD510xH198mm', N'12200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'10794', N'80844', N'E8890', N'45900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'11112', N'70046', N'', N'10000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'11236', N'80800', N'G615AS', N'5700')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'11237', N'80801', N'G6150AS', N'5700')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'11486', N'70123', N'', N'3500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'11487', N'70124', N'', N'7600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'11488', N'70125', N'', N'7000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'11489', N'70127', N'', N'12000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'11693', N'1003', N'R3268SL', N'9750')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'11730', N'70031', N'', N'63000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'11731', N'70027', N'', N'105000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'11756', N'81036', N'', N'59500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'11757', N'81208', N'', N'83800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'11758', N'81207', N'', N'88800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'11838', N'926', N'SH-186', N'6150')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'11839', N'954', N'', N'7850')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'11840', N'955', N'', N'7150')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'11900', N'1025', N'EG2330GB', N'34600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'11926', N'81303', N'', N'17500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'11938', N'81288', N'EH2630S6', N'27700')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12118', N'81362', N'EG2331G', N'32600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12119', N'81361', N'EG2231G', N'15300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12193', N'80833', N'', N'5600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12193', N'80833', N'', N'5600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12225', N'81177', N'', N'11200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12225', N'81177', N'', N'11200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12244', N'80839', N'', N'4750')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12244', N'80839', N'', N'4750')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12258', N'81169', N'', N'4300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12258', N'81169', N'', N'4300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12259', N'81176', N'', N'8250')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12259', N'81176', N'', N'8250')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12283', N'102', N'', N'2400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12284', N'103', N'', N'3500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12306', N'98', N'C65-0119', N'350')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12307', N'112', N'C65-0128', N'1000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12308', N'114', N'C95-A050', N'1800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12309', N'95', N'C65-0122', N'300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12315', N'94', N'C65-0118', N'300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12357', N'80896', N'', N'7900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12357', N'80896', N'', N'7900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12473', N'80104', N'W740xD515xH190mm', N'6900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12473', N'80104', N'W740xD515xH190mm', N'6900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12474', N'80103', N'W840xD510xH198mm', N'8200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12474', N'80103', N'W840xD510xH198mm', N'8200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12476', N'80102', N'W850xD515xH204', N'9200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12476', N'80102', N'W850xD515xH204', N'9200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12489', N'81199', N'', N'33000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12490', N'80083', N'', N'38000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12500', N'80434', N'RA-005', N'110')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12628', N'81545', N'EG2250G', N'17300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12629', N'81546', N'EG2350G', N'35600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12663', N'80402', N'', N'16100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12663', N'80402', N'', N'16100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12704', N'81302', N'', N'20800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12769', N'81125', N'', N'99000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12771', N'80928', N'', N'33000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12773', N'81165', N'', N'26000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12777', N'81128', N'', N'61900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12796', N'81554', N'90cm', N'22000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12812', N'81305', N'', N'14400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12813', N'81306', N'', N'16300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12814', N'81307', N'', N'12700')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12816', N'81308', N'', N'14100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12817', N'81304', N'', N'33300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12938', N'80912', N'EH2651S6', N'36400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12939', N'80924', N'', N'28900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12940', N'80909', N'EH1251S6', N'24700')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12941', N'80914', N'EH1251LS6', N'24700')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12942', N'81063', N'EH0651S6', N'20400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12943', N'80917', N'EH0651LS6', N'20400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'12953', N'81596', N'EG2120GB', N'9300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13151', N'80080', N'', N'24500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13152', N'80146', N'W595xD575xH595', N'20800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13154', N'80134', N'W595xD677xH1390mm', N'58000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13190', N'81620', N'W595xD562xH825', N'42900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13234', N'80141', N'W598xD550xH815mm', N'27000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13236', N'81161', N'', N'58000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13241', N'81622', N'', N'68000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13243', N'81375', N'', N'65000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13244', N'81376', N'', N'42000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13245', N'81377', N'', N'42000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13246', N'974', N'GH1221', N'9400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13247', N'998', N'GH1239', N'9500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13248', N'976', N'GH1235', N'9200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13251', N'973', N'GH1021', N'8900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13252', N'999', N'GH1039', N'8300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13253', N'975', N'GH1035', N'8000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13255', N'80365', N'GH1005', N'7600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13267', N'942', N'', N'8350')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13270', N'913', N'Q7583', N'15050')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13276', N'81623', N'', N'45000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13282', N'81624', N'', N'99000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13283', N'81591', N'', N'136000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13292', N'81616', N'', N'35000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13293', N'81615', N'', N'58000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13300', N'81630', N'', N'69000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13304', N'80855', N'P0553A', N'18900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13305', N'81632', N'', N'29000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13352', N'81633', N'G2921G', N'16850')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13479', N'939', N'DR3592AXL', N'16750')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13480', N'939', N'DR3592AL', N'16450')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13481', N'921', N'DR3590AXL', N'14150')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13482', N'921', N'DR3590AL', N'13850')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13483', N'946', N'R605', N'8200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13484', N'81188', N'R3680SXL', N'10350')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13485', N'81188', N'R3680SL', N'10050')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13486', N'80623', N'R3262SXL', N'10440')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13487', N'80623', N'R3262SL', N'10240')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13488', N'80623', N'R3262S', N'10040')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13492', N'80628', N'R3261SXL', N'8940')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13493', N'80628', N'R3261SL', N'8740')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13495', N'1013', N'R3506CXL', N'8600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13496', N'1013', N'R3506CL', N'8400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13497', N'1012', N'R3500DXL', N'7950')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13498', N'1012', N'R3500DL', N'7750')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13510', N'893', N'R3250SXL', N'7740')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13516', N'8', N'R3012SXL', N'7350')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13517', N'944', N'G2112G', N'9300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13523', N'11', N'G5700K', N'8750')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13524', N'940', N'G5703', N'8250')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13525', N'80625', N'G5513S', N'8040')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13527', N'137', N'G632KS', N'6450')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13528', N'892', N'G6320K', N'6450')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13536', N'1028', N'G2922AGB', N'15100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13537', N'1014', N'指定通路機型', N'21100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13538', N'1014', N'G2928G', N'21100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13539', N'1027', N'G2932AGB', N'19100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13540', N'80943', N'G2721G', N'12900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13541', N'978', N'G2633G', N'14100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13542', N'979', N'G2633S', N'14100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13544', N'981', N'G2623S', N'12100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13546', N'982', N'G2522S', N'10100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13547', N'147', N'G2830KG', N'13200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13548', N'148', N'G2830KS', N'10600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13549', N'149', N'G2820G', N'11100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13550', N'158', N'G252K', N'7000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13551', N'159', N'G251K', N'4350')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13557', N'941', N'G6703S', N'8250')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13558', N'164', N'G-6700K', N'8750')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13559', N'80627', N'G6513S', N'8040')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13561', N'924', N'G-6500KG', N'7550')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13774', N'81497', N'G2623AG', N'12100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13839', N'81282', N'120cm', N'27000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13849', N'81281', N'90cm', N'24000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13857', N'81283', N'', N'30900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13858', N'81384', N'W595xD566xH596mm', N'29000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13872', N'81385', N'W595xD566xH596mm', N'21500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13881', N'81491', N'', N'48800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13882', N'81548', N'W595xD565xH454mm', N'42000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13942', N'81544', N'', N'30000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13988', N'81684', N'G5611', N'8400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'13989', N'81685', N'G6611', N'8400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14016', N'997', N'指定通路機型', N'14600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14017', N'997', N'SH1338', N'14600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14018', N'929', N'SH1335', N'14200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14024', N'80351', N'Q7592BL', N'17600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14026', N'1019', N'Q7693', N'19600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14027', N'80795', N'Q7692', N'18600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14032', N'80092', N'90cm', N'18000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14068', N'81029', N'F0161', N'1590')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14069', N'81030', N'F0181', N'4990')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14070', N'81031', N'F0182', N'5990')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14071', N'81032', N'F0151', N'1690')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14086', N'81287', N'', N'2000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14088', N'81427', N'F0162', N'2990')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14091', N'81428', N'F0185', N'4990')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14095', N'81429', N'F0186', N'5990')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14097', N'81431', N'F0130', N'890')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14098', N'81430', N'F0110', N'490')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14101', N'81432', N'F0180', N'2290')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14102', N'81445', N'F0150', N'1690')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14115', N'81611', N'', N'3000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14117', N'81612', N'', N'4500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14121', N'81481', N'F0232', N'2690')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14127', N'81034', N'F0211', N'490')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14133', N'81309', N'R3750BL', N'13200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14134', N'81309', N'R3750BXL', N'13200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14135', N'81309', N'指定通路機型', N'13200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14140', N'81587', N'DR3880BSL', N'16450')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14141', N'81587', N'DR3880BSXL', N'16450')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14142', N'81586', N'DR3882BSL', N'17950')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14143', N'81586', N'DR3882BSXL', N'17950')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14147', N'80974', N'R7765SXL', N'18500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14148', N'80974', N'R7765SL', N'18500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14151', N'81196', N'Q7697L', N'20600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14152', N'81196', N'指定通路機型', N'20600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14154', N'81679', N'W448xD570xH815mm', N'30000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14159', N'1022', N'DH1628', N'21750')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14160', N'1022', N'指定通路機型', N'21750')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14175', N'1023', N'', N'50100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14177', N'920', N'', N'24650')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14178', N'993', N'SH2291', N'64400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14180', N'930', N'', N'46100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14181', N'963', N'', N'54100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14182', N'932', N'SH2690', N'63200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14185', N'80304', N'E3621', N'12900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14186', N'81078', N'E3625', N'16000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14188', N'1015', N'E6672', N'18000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14189', N'1005', N'E7682', N'25900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14190', N'1005', N'不含門板及踢腳板', N'25900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14191', N'1004', N'E7782', N'25900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14192', N'1004', N'不含門板及踢腳板', N'25900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14193', N'80823', N'E8692', N'43900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14194', N'912', N'', N'8640')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14197', N'1010', N'Q7595ML', N'15600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14198', N'1006', N'Q7596A', N'21600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14199', N'81547', N'Q7650L', N'17300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14200', N'1018', N'Q7690', N'18600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14299', N'81693', N'G2826G', N'13000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14300', N'81374', N'', N'92000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14314', N'80401', N'', N'8400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14314', N'80401', N'', N'8400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14319', N'81168', N'', N'2600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14319', N'81168', N'', N'2600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14320', N'81167', N'', N'3950')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14320', N'81167', N'', N'3950')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14321', N'81180', N'', N'2500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14321', N'81180', N'', N'2500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14323', N'81181', N'', N'3150')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14323', N'81181', N'', N'3150')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14324', N'81183', N'', N'10850')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14324', N'81183', N'', N'10850')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14325', N'81184', N'', N'13300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14325', N'81184', N'', N'13300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14326', N'81551', N'', N'9450')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14326', N'81551', N'', N'9450')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14327', N'81549', N'', N'14200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14327', N'81549', N'', N'14200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14328', N'81550', N'', N'14900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14328', N'81550', N'', N'14900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14331', N'81175', N'', N'14900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14331', N'81175', N'', N'14900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14339', N'80660', N'', N'8000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14339', N'80660', N'', N'8000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14340', N'80662', N'', N'12250')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14340', N'80662', N'', N'12250')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14341', N'80663', N'', N'12250')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14341', N'80663', N'', N'12250')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14351', N'81186', N'C07-1001/5001/7001', N'16700')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14351', N'81186', N'C07-1001/5001/7001', N'16700')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14352', N'80659', N'C01-1001/5001/7001', N'21420')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14352', N'80659', N'C01-1001/5001/7001', N'21420')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14353', N'80659', N'C01-6001', N'24570')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14353', N'80659', N'C01-6001', N'24570')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14377', N'80661', N'C10-1001/5001/7001', N'23000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14377', N'80661', N'C10-1001/5001/7001', N'23000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14378', N'80661', N'C10-6001', N'26150')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14378', N'80661', N'C10-6001', N'26150')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14384', N'81696', N'', N'8300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14384', N'81696', N'', N'8300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14389', N'81698', N'', N'11400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14389', N'81698', N'', N'11400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14390', N'81699', N'', N'14200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14390', N'81699', N'', N'14200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14397', N'81164', N'', N'32000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14398', N'81500', N'', N'30000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14403', N'81694', N'', N'4890')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14403', N'81694', N'', N'4890')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14404', N'81033', N'F0231', N'2690')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14412', N'81690', N'F0261', N'2690')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14413', N'81691', N'F0262', N'2690')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14414', N'81692', N'F0263', N'2690')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14420', N'81387', N'P0121', N'9200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14422', N'81024', N'P0231', N'21000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14431', N'81142', N'P0780', N'9590')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14438', N'81310', N'P0672C', N'2490')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14458', N'81687', N'P0771', N'7990')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14461', N'81373', N'P0782', N'9590')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14462', N'81373', N'指定通路機型', N'9590')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14465', N'81629', N'', N'88000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14485', N'70015', N'', N'21000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14491', N'70030', N'', N'27000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14495', N'81421', N'R7722BSL', N'14500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14498', N'81422', N'DR7786BSXL', N'21400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14499', N'81422', N'DR7786BSL', N'21400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14500', N'81588', N'DR7790BSXL', N'26500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14501', N'80794', N'R7600XL', N'17600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14510', N'81284', N'指定通路機型', N'31500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14511', N'81284', N'DR7796SXL', N'31500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14517', N'81089', N'', N'9000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14518', N'81088', N'', N'9000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14519', N'80945', N'', N'35000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14520', N'80946', N'', N'28000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14521', N'81083', N'', N'32000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14522', N'81086', N'', N'16000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14525', N'81035', N'F0221', N'890')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14526', N'81095', N'', N'4300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14527', N'81096', N'', N'5700')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14528', N'81097', N'', N'12500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14529', N'81098', N'', N'13400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14530', N'81099', N'F0195', N'15200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14531', N'81100', N'', N'16100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14532', N'81606', N'', N'5300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14533', N'81607', N'', N'9300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14534', N'81608', N'', N'10200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14535', N'81609', N'', N'14400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14536', N'81610', N'', N'15300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14539', N'80894', N'', N'7150')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14539', N'80894', N'', N'7150')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14540', N'80893', N'', N'7800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14540', N'80893', N'', N'7800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14541', N'80905', N'', N'6300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14541', N'80905', N'', N'6300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14543', N'80906', N'', N'7650')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14543', N'80906', N'', N'7650')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14544', N'80899', N'', N'8500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14544', N'80899', N'', N'8500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14546', N'80898', N'', N'6800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14546', N'80898', N'', N'6800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14547', N'80897', N'', N'6450')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14547', N'80897', N'', N'6450')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14569', N'81702', N'W760xD450xH80mm', N'32000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14570', N'81709', N'W590xD520xH56mm', N'43000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14581', N'81618', N'EH3010TS6/S4', N'25000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14582', N'81619', N'EH2010TS4', N'21700')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14584', N'81582', N'EH1210TS6/S4', N'18400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14585', N'81584', N'EH1210LTS4', N'20300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14623', N'80339', N'指定通路機型', N'19100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14624', N'80339', N'G2926G', N'19100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14629', N'70039', N'', N'69500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14635', N'81717', N'DH1693F', N'27900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14636', N'81717', N'指定通路機型', N'27900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14681', N'80142', N'W598xD570xH815mm', N'27000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14696', N'952', N'G5900', N'9750')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14697', N'953', N'G6900S', N'9750')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14712', N'81689', N'P0773', N'7990')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14713', N'81688', N'P0772', N'7990')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14726', N'81643', N'R7653', N'20300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14728', N'81716', N'DH1695F', N'27900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14729', N'81640', N'W598xD570xH845mm', N'33000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14753', N'81718', N'指定通路機型', N'20600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14754', N'81718', N'DH1672F', N'20600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14755', N'81719', N'指定通路機型', N'20600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14756', N'81719', N'DH1670F', N'20600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14757', N'81720', N'指定通路機型', N'18600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14758', N'81720', N'DH1638F', N'18600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14770', N'81643', N'指定通路機型', N'20300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14771', N'81716', N'指定通路機型', N'27900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14775', N'81379', N'W600xD659xH850mm', N'56900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14782', N'81755', N'G6320AS', N'6450')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14783', N'81756', N'E5650A', N'17300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14784', N'81757', N'W595xD410x388 mm', N'18000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14785', N'81758', N'W900xD590xH65mm', N'45000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14786', N'81759', N'W1200xD590xH65mm', N'48000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14787', N'81760', N'Q7580BS', N'11340')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14788', N'81763', N'W590xD520xH62mm', N'32000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14796', N'81779', N'LF119033', N'7790')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14796', N'81779', N'LF119033', N'7790')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14797', N'81778', N'LF119022', N'5790')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14797', N'81778', N'LF119022', N'5790')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14802', N'81790', N'W700xD420xH55mm', N'39000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14803', N'81791', N'EG2100G', N'12900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14804', N'81792', N'EG2200G', N'30600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14850', N'81829', N'W598xD550xH815mm', N'33000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14851', N'81830', N'W595xD565xH850mm', N'32900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14853', N'81833', N'EG2300G', N'34700')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14854', N'893', N'R3250SL', N'7540')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14855', N'893', N'R3250S', N'7340')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14859', N'8', N'R3012SL', N'7150')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14860', N'8', N'R3012S', N'6950')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14861', N'81834', N'Q7650ML', N'15600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14862', N'81835', N'E7683', N'31500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14863', N'81836', N'E7783', N'31500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14865', N'81838', N'Q7596BL', N'21600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14866', N'81838', N'Q7596BML', N'21600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14867', N'81839', N'W598xD570xH775mm', N'56000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14868', N'81840', N'DR3885BSL', N'21500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14869', N'81840', N'DR3885BSXL', N'21500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14870', N'81841', N'G2522BG', N'10100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14871', N'81842', N'W595xD490xH457 mm', N'46800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14875', N'81845', N'W760xD450xH80 mm', N'32000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14878', N'998', N'指定通路機型', N'9500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14879', N'976', N'指定通路機型', N'9200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14880', N'975', N'指定通路機型', N'8000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14883', N'81421', N'R7722BSXL', N'14500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14885', N'81851', N'EH5010A6', N'33600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14886', N'81852', N'EH3010A6', N'21100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14887', N'81853', N'EH2010A4', N'17800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14888', N'81854', N'EH1210AL4', N'16600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14889', N'81855', N'EH1210A4/A6', N'14700')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14890', N'81856', N'EH0810AL6', N'14400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14891', N'81857', N'EH0810A6', N'13000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14892', N'81859', N'F9001', N'4800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14893', N'81860', N'F9002', N'4800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14894', N'81861', N'F9003', N'4800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14895', N'81863', N'F9005', N'5600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14896', N'81864', N'G2922BG', N'15100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14897', N'81858', N'W598xD570xH815mm', N'56000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14898', N'81866', N'W595xD559xH595 mm', N'85000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14900', N'81868', N'W595xD557xH140mm', N'26000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14901', N'81869', N'W730xD430xH60mm', N'36000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14902', N'81870', N'W730xD430xH60mm', N'30000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14904', N'81872', N'W600xD300xH272 mm', N'22000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14905', N'81873', N'W595xD574xH820-885 mm', N'65000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14908', N'81876', N'W790xD500xH200mm', N'23500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14909', N'81877', N'R7301A', N'17900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14910', N'81878', N'R7302A', N'17900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14911', N'81903', N'P0230A', N'17000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14912', N'81904', N'W790xD500xH200mm', N'23500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14913', N'81905', N'W760xD440xH200mm', N'23500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14914', N'81906', N'W760xD440xH200mm', N'23500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14915', N'81907', N'W570xD500xH200mm', N'19800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14916', N'81908', N'W570xD500xH200mm', N'19800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14917', N'81909', N'W540xD440XH200mm', N'19800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14918', N'81910', N'W540xD440XH200mm', N'19800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14919', N'81911', N'R7351L', N'20900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14920', N'81911', N'R7351XL', N'20900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14921', N'81912', N'R7352L', N'20900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14922', N'81912', N'R7352XL', N'20900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14923', N'81913', N'P0233A', N'21700')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14925', N'81915', N'P0585', N'34900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14927', N'81918', N'W700xD450xH220mm', N'10900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14928', N'81919', N'W542xD413xH220mm', N'9900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14929', N'81920', N'W750xD440xH200mm', N'27900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14930', N'81921', N'W490xD440xH200mm', N'14900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14934', N'81925', N'G2523YG', N'10500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14935', N'81926', N'G633Y', N'6850')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14936', N'81927', N'G6330Y', N'6850')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14937', N'81928', N'G616Y', N'6100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14938', N'81929', N'G6160Y', N'6100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14939', N'81930', N'W300xD510xH60mm', N'22000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14942', N'81902', N'EH1830A6', N'22700')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14943', N'81898', N'EH1230A6', N'19100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14944', N'81896', N'EH1230AL6', N'19100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14945', N'81893', N'EH0630A6', N'16400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14946', N'81891', N'EH0630AL6', N'16400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14947', N'81932', N'R7615', N'15300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14948', N'81933', N'DH1605A', N'17600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14950', N'81935', N'W600xD600xH805mm', N'39900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14951', N'81936', N'W800xD510xH57mm', N'76000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14952', N'81937', N'W900xD400xH53mm', N'50000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14953', N'81938', N'W600xD510xH53mm', N'39000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14954', N'81939', N'W300xD510xH53mm', N'26000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14958', N'81942', N'W598xD310xH290mm', N'21000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14959', N'81943', N'W288xD520xH59 mm', N'16000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14960', N'81944', N'W898xD310xH290mm', N'22000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14961', N'81945', N'W750xD480xH220mm', N'6000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14963', N'81952', N'SA-2860-1/2/3/4/5/6/7/8', N'27800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14963', N'81952', N'SA-2860-1/2/3/4/5/6/7/8', N'27800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14964', N'81947', N'SA-460-1/2/3/4/5/6/7/8', N'14600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14964', N'81947', N'SA-460-1/2/3/4/5/6/7/8', N'14600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14965', N'81948', N'SA-660-1/2/3/4/5/6/7/8', N'19300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14965', N'81948', N'SA-660-1/2/3/4/5/6/7/8', N'19300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14966', N'81949', N'SA-760-1/2/3/4/5/6/7/8', N'20900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14966', N'81949', N'SA-760-1/2/3/4/5/6/7/8', N'20900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14967', N'81950', N'SA-770-1/2/3/4/5/6/7/8', N'20400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14967', N'81950', N'SA-770-1/2/3/4/5/6/7/8', N'20400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14968', N'81951', N'SA-860-1/2/3/4/5/6/7/8', N'23700')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14968', N'81951', N'SA-860-1/2/3/4/5/6/7/8', N'23700')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'14970', N'81954', N'E8891', N'47900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15015', N'81957', N'P9870', N'4200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15016', N'81958', N'EHF6220', N'2200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15018', N'81960', N'P0531', N'40900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15019', N'81961', N'P5530W', N'11000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15020', N'81962', N'DR7396H L/XL', N'25900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15021', N'81962', N'DR7396  L/XL', N'25900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15022', N'81963', N'DR7788', N'25700')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15023', N'81964', N'G2929G', N'20100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15024', N'81965', N'W735xD435xH80mm', N'30000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15025', N'81966', N'90cm', N'30000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15026', N'81967', N'120cm', N'33000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15027', N'81968', N'F3180', N'3990')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15028', N'81969', N'W850xD515xH220mm', N'8000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15033', N'81973', N'P0563B', N'27900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15035', N'81980', N'W730xD430xH66 mm', N'28000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15036', N'81981', N'W730xD420xH120 mm', N'9900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15052', N'81976', N'-', N'10900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15052', N'81976', N'-', N'10900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15053', N'81978', N'-', N'10900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15053', N'81978', N'-', N'10900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15054', N'81979', N'-', N'10900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15054', N'81979', N'-', N'10900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15055', N'81977', N'-', N'19900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15055', N'81977', N'-', N'19900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15060', N'82020', N'G2623BG', N'12100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15062', N'81890', N'EH2651A6', N'36700')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15063', N'81888', N'EH1851A6', N'29200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15064', N'81899', N'EH1251A6', N'25000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15065', N'81897', N'EH1251AL6', N'25000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15068', N'82040', N'-', N'945')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15068', N'82040', N'-', N'945')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15069', N'82042', N'E7881', N'39500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15071', N'82057', N'W595xD410xH388mm', N'22000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15072', N'82058', N'W900xD300xH272 mm', N'24000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15073', N'82059', N'W460xD382xH127 mm', N'9900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15074', N'82060', N'W598xD550xH818mm', N'52000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15075', N'82061', N'W595xD559xH595 mm', N'88000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15076', N'82062', N'W595xD559xH455mm', N'92000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15077', N'82063', N'W595xD413xH455mm', N'116000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15079', N'82068', N'RA-010', N'280')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15080', N'82069', N'RA-008', N'110')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15081', N'82070', N'RA-002', N'110')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15094', N'82085', N'W730xD420xH120 mm', N'16800')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15095', N'82086', N'P0775', N'8900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15096', N'82087', N'F0265濾心', N'2690')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15097', N'82088', N'P0261', N'17900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15098', N'82089', N'P0262', N'20900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15099', N'82091', N'P0266', N'23900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15100', N'82090', N'P0265', N'20900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15101', N'82092', N'F0187', N'6990')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15102', N'82096', N'W650xD430xH65 mm', N'28000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15104', N'82099', N'E3621A', N'13900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15106', N'81964', N'指定通路機型', N'20100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15107', N'82101', N'F2197', N'11100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15108', N'82102', N'F0197', N'14200')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15109', N'82103', N'G5201S', N'6300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15109', N'82103', N'G5201S', N'6300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15110', N'82104', N'G6201S', N'6300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15110', N'82104', N'G6201S', N'6300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15111', N'82105', N'G2922S', N'15100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15112', N'82106', N'E3625A', N'17000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15115', N'82110', N'G2527G', N'13400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15116', N'82111', N'G2627G', N'15400')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15117', N'82112', N'W448xD570xH815mm', N'30000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15118', N'82113', N'W590xD520xH62mm', N'32000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15119', N'82114', N'Q680', N'9900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15124', N'82118', N'EG2120AG', N'9300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15125', N'82120', N'EG2200AG', N'30600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15126', N'82119', N'EG2331AG', N'32600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15127', N'82121', N'Q7585B', N'16900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15130', N'82122', N'Q7585W', N'16900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15137', N'82129', N'DH1638H', N'19100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15139', N'82131', N'DR7397', N'25900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15140', N'82132', N'EG2351G', N'35600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15141', N'82129', N'指定通路機型', N'19100')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15146', N'82133', N'R609', N'13500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15147', N'82134', N'R610HS', N'14500')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15150', N'82137', N'W598xD550xH815mm', N'41000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15151', N'82138', N'W598xD550xH815mm', N'41000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15152', N'82140', N'90cm', N'26000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15153', N'82143', N'EG2501G', N'26700')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15154', N'82139', N'W735xD435xH80 mm', N'36900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15158', N'82162', N'DH1670H', N'20600')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15159', N'82163', N'60cm', N'22000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15161', N'82164', N'W598xD550xH815mm', N'33000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15163', N'82165', N'-', N'10900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15163', N'82165', N'-', N'10900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15164', N'82169', N'W590xD520xH80 mm', N'30000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15165', N'82143', N'EG2501GC', N'26700')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15166', N'82170', N'W900xD480xH670-1000 mm', N'33000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15167', N'82171', N'760 X 450 X 160 mm', N'30000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15168', N'82172', N'W595xD535xH850mm', N'32900')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15171', N'82173', N'_', N'8300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15171', N'82173', N'_', N'8300')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15174', N'82467', N'-', N'16930')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15174', N'82467', N'-', N'16930')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15175', N'82468', N'W595xD566xH596mm', N'55000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15176', N'82472', N'W598xD570xH815mm', N'43000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15177', N'82482', N'W598xD550xH815mm', N'46000')
GO

INSERT INTO [sync].[BuyKitchenProductPrices] ([id], [product_id], [size], [price]) VALUES (N'15178', N'82483', N'310 X 510 X 150 mm', N'22000')
GO

