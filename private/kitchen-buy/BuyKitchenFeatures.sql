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

 Date: 19/03/2026 13:03:36
*/


-- ----------------------------
-- Table structure for BuyKitchenFeatures
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[sync].[BuyKitchenFeatures]') AND type IN ('U'))
	DROP TABLE [sync].[BuyKitchenFeatures]
GO

CREATE TABLE [sync].[BuyKitchenFeatures] (
  [id] int  NOT NULL,
  [name] nvarchar(255) COLLATE Chinese_Taiwan_Stroke_CI_AS  NOT NULL
)
GO

ALTER TABLE [sync].[BuyKitchenFeatures] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of BuyKitchenFeatures
-- ----------------------------
INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'2', N'16L加熱能力')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'3', N'分段火排，自動調節火力')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'4', N'強制排氣設計，最安全')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'5', N'智能恆溫，不會忽冷忽熱')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'6', N'多重安全防護設計')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'8', N'上網登錄免費送安檢')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'9', N'日本製造櫻花原裝進口')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'10', N'注水量警示功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'11', N'智慧型水量調節控制')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'13', N'標配有線遙控， 方便調溫')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'14', N'60分自動切斷安全裝置')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'15', N'365天服務不打烊')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'16', N'OFC新式水箱，更耐用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'23', N'ABS自動阻斷裝置防空燒')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'35', N'榮獲台灣精品獎')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'51', N'永久免費油網送到家')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'54', N'觸控式界面，科技時尚感十足')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'62', N'LED藍色冷光電子按鍵搭配不鏽鋼拉絲面板，時尚好操作')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'72', N'『油網+熱熔解』除油，油機壽命更持久')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'73', N'LED冷光按鍵搭配不鏽鋼拉絲面板')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'75', N'深度23cm集煙區設計，油煙不外漏')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'76', N'弧形擾流前緣，一體成型')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'83', N'離鍋轉小火智能偵測系統，烹煮樂趣不中斷')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'87', N'黑色強化玻璃面板，美觀易清理')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'92', N'平整化設計，搭配櫃體更時尚')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'93', N'旋風造型鑄鐵爐架，耐用不滑鍋')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'94', N'雙層防湯盤，湯汁不易滴落')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'95', N'點火針防護帽，點火不擔心')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'97', N'一點靈點火系統，精確點火不必等')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'99', N'兒童安全開關')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'100', N'全罩式防漏上湯盤，湯汁不易滴落')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'102', N' 平整化設計，搭配櫃體更時尚')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'103', N'六片花瓣式出焰，焰火青翠分明')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'104', N' 熄火安全裝置')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'105', N' 點火針防護帽，點火不擔心')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'111', N'永久免費淨水器健檢')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'137', N'兒童安全鎖')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'166', N'微波、燒烤、微波+燒烤組合模式')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'168', N'二種解凍模式(按重/按時)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'169', N'五段微波火力設定')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'170', N'內建8道智慧烹飪菜單，美味料理自動完成')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'173', N'嵌入式設計，呈現整體廚房優雅時尚與高質感')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'180', N'65公升立體大容量，烹飪烘烤不受限')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'181', N'8段智慧烹調功能，滿足各式料理需求！')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'182', N'旋風熱對流風扇，使熱量均勻流動，烹調更美味！')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'186', N'對流散熱降溫系統，前方散熱蒸氣口，保護櫥櫃。')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'193', N'一點靈點火系統')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'196', N'全嵌式設計，提升廚具整體質感')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'198', N'360度強力水柱噴洗，沖洗無死角')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'199', N'304不銹鋼內層，環保無毒害碗籃架材質，耐高溫易清洗')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'200', N'符合東方亞洲人使用的中式碗盤籃架')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'201', N'AquaStop自動偵測漏水系統')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'203', N'24小時預約時間功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'213', N'玻璃觸控式操作面板')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'218', N'可適用於小坪數空間')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'219', N'內部配備不鏽鋼碗筷架，整體質感倍增')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'238', N'與櫥櫃風格融為一體')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'242', N'三段全自動殺菌烘乾模式')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'245', N'不鏽鋼內膽，質感加倍')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'246', N'雙層抽取式收納架，超大收納容量，10吋輕鬆收納')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'247', N' O3臭氧殺菌+PTC熱風內循環烘乾，碗盤乾淨無慮')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'258', N'半嵌式設計，僅露出操作面板，廚房更顯簡約')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'268', N'兒童安全鎖設計，安全有保障')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'278', N'智能恆溫，不會忽冷忽熱')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'280', N'標配無線遙控， 輕鬆調溫')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'281', N'24L加熱能力，浴缸適用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'282', N'低廢氣排放，友善地球')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'284', N'熱效率超越90%')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'285', N'26L加熱能力，浴缸適用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'286', N'熱水隨開即熱不必等')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'287', N'22L加熱能力，浴缸適用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'288', N'智慧型水量調節控制')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'290', N'分段火排，自動調節火力')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'301', N'5段調選溫度')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'303', N'漏電保護裝置')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'313', N'全隱藏式設計，整體廚房線條不受干擾')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'315', N'全隱藏式按鍵，鏡射指示，美觀方便')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'318', N'半隱藏式設計，整體廚房線條不受干擾')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'319', N'觸控式介面，科技時尚感十足')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'321', N'適合套房或小坪數房屋')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'322', N'全隱藏或半隱藏櫥櫃皆適用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'323', N'玻璃擋煙板抽拉自動開關/切換風量')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'324', N'抽拉式玻璃檔煙板，完全隱藏，完美搭配廚房')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'325', N'照明自動隨開關啟閉')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'327', N'單出風口，可搭配活性碳濾網組(選配)，作為內循環機型使用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'330', N'雙渦輪扇葉+雙馬達，吸力強勁結構')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'331', N'櫻花油網有效除油，撥板設計，方便更換油網')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'332', N'輕薄機體造型，全隱藏式造型，完美搭配整體廚房設計')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'339', N'雙渦輪扇葉+雙馬達結構，吸力強勁')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'343', N'新一代導流前板，整體造型前衛')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'345', N'強化玻璃面板，美觀易清理')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'346', N'平整式設計，搭配櫃體更美觀')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'347', N'防漏上湯盤設計，防止湯汁溢入')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'348', N'鑄鐵爐架搭配，耐用不滑鍋')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'351', N'獨家專利渦輪增壓技術')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'355', N'高科技熱感偵測，全爐具皆可偵測')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'360', N'嵌入式收納設計，與櫥櫃完美搭配')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'361', N'One-Touch一指操控介面，手控風扇啓動或停止。')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'362', N'獨家專利隱藏出風口，不需擔心出風口殘留水氣問題。')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'363', N'內置橫流扇設計，有效將電器產生之蒸氣完全排出。')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'364', N'不鏽鋼平拉式拖盤，美觀耐用。')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'365', N'不鏽鋼砂紋與強化玻璃材質下掀門板。')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'368', N'靜音除味設計，常保廚房空氣清新')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'369', N'渦輪變頻最強Turbo大吸力，效力強更安靜')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'372', N'智慧定溫烹煮功能，料理溫度精準控制')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'373', N'自動煲湯功能，一鍵設定無須費心顧爐火')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'375', N'離鍋轉小火智能偵測系統，烹煮樂趣不中斷')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'376', N'智能乾燒檢知與過溫保護裝置，避免廚房危機')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'377', N'創新專利雙炫火，加熱均勻更快速')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'379', N'黑色強化玻璃面板，美觀易清理')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'382', N'一點靈零秒點火系統，精確點火不必等')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'387', N'專利循環預熱技術')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'390', N'數位恆溫不會忽冷忽熱')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'394', N'時尚流線造型與日系白色家電時尚風格')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'395', N'圓弧中架板好擦拭；304不鏽鋼耐腐蝕質感佳')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'397', N'馬達過熱保護裝置')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'398', N'雙渦輪風葉設計，吸力強')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'399', N'30公分深罩集煙，油煙一把罩')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'401', N'台灣製造優良品牌')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'407', N'高亮度LED燈泡照明，節能又省電')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'415', N'使用汽車等級彈簧的下掀強化玻璃擋煙板')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'416', N'智能乾燒檢知與過溫保護裝置，防範廚房危機')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'417', N'創新專利雙炫火，加熱均勻更高效')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'418', N'內外雙環獨立控火，大火文火隨心所欲')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'419', N'全機平整化設計，搭配櫃體更時尚')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'420', N'雙層防湯盤設計，湯汁不易滴落')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'421', N'熄火安全裝置，杜絕瓦斯外漏風險')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'422', N'兒童安全開關，防止孩童誤觸')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'423', N'鑄鐵爐架搭配，耐用不滑鍋')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'425', N'專利雙環內焰技術，火焰內聚更省能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'426', N'不鏽鋼面板，耐刷又保潔')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'427', N'全平面髮絲紋不鏽鋼面板，美觀易清理')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'428', N'壓電式點火開關，杜絕更換電池困擾')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'429', N'耐溫琺瑯上湯盤，湯汁不易滴落')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'430', N'抽取式清潔盤，溢落髒汙好整理')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'431', N'耐溫琺瑯上湯盤，湯汁不易滴落')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'432', N'智慧定時烹煮功能，加熱時間完美掌控')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'434', N'全銅爐頭材質，爐頭更耐用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'436', N'七段洗程，自由依照使用量選擇定適合洗程')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'437', N'304不銹鋼內層與環保碗籃架材質，耐高溫易清洗')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'438', N'餘溫乾燥循環，節能省電與杜絕細菌孳生')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'439', N'旋風熱對流風扇，熱量更均勻流動！')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'440', N'溫度調節與定時120分鐘，隨喜好與需求設定。')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'441', N'易清搪瓷內壁與不鏽鋼防手紋飾板，清潔輕鬆。 ')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'442', N'下嵌入式電熱管，避免熱滴油冒煙、難清理。')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'445', N'德國SCHOTT微晶玻璃面板，防爆耐高溫')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'446', N'75cm大爐面與2大爐心設計，烹調有效率')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'447', N'8段滑動式火力，雙爐火力強勁更精準')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'448', N'定溫／定時裝置可隨烹調喜好設定')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'450', N'兒童安全鎖及餘溫安全警示，安全有保障')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'451', N'自動鍋具檢測，無鍋即自動停機保護')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'453', N'體積小，不佔空間')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'465', N'煮沸儲熱式出水 ')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'467', N'不鏽鋼304電熱管')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'471', N'德製滑軌，媲美高級櫥櫃')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'472', N'內膽全不鏽鋼，質感加倍')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'473', N'O3殺菌+PTC熱風循環')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'475', N'落地單門雙層，收納靈活')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'476', N'落地設計提升廚房整體性')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'477', N'平整化黑玻美形外觀')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'478', N'搭載緩衝式滑軌，防碰撞')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'479', N'雙層抽屜，10吋輕鬆收納')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'480', N'高質感玻璃觸控面板')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'481', N'紫外線+臭氧雙效殺菌，除臭、除霉健康無虞')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'482', N'電子式按鍵開關，好操控')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'485', N'強制供排氣，適用密閉空間')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'486', N'選配有線遙控， 輕鬆調溫')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'487', N'單箱設計，體積小')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'521', N'材質 : 精銅鍍鉻')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'522', N'材質 : SUS304不鏽鋼')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'523', N'出水高度 : 250mm')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'526', N'厚度 : 0.9mm')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'527', N'厚度 : 1mm')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'528', N'表面處理：毛絲面')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'530', N'外徑 : 750×460×200mm')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'534', N'內徑 : 700×410×200mm')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'536', N'表面處理：珍珠壓花')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'543', N'不鏽鋼面板，耐刷又保潔')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'544', N'爐頭防湯護蓋設計，有效降低湯汁溢落內部機率')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'547', N'出水高度 : 225mm')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'548', N'出水高度：205mm')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'551', N'出水高度：260mm')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'552', N'材質：壓克力人造石')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'555', N'厚度：10mm')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'556', N'材質：天然花崗岩顆粒')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'557', N'材質：天然花崗岩顆粒')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'560', N'厚度：10mm')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'561', N'材質：壓克力人造石')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'593', N'全平面不鏽鋼造型與抗指紋面板，外形美觀質感佳')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'595', N'雙層抽屜式結構與三段全自動殺菌烘乾模式')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'599', N'更近距離接觸油煙，在第一時間補捉油煙、及時排除')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'600', N'四面環吸進風口，上下左右全方位吸淨油煙')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'601', N'全平斜面造型，不碰頭不擋視線')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'602', N'鋼化玻璃材質搭配易拆卸油杯，輕鬆易清')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'603', N'隱藏式油網，有效排煙濾油')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'604', N'分離式爐頭，齒蓋易拆易清理')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'605', N'防滲漏環狀凸緣，防止湯水流入開關組')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'606', N'面板一體式盛湯盤，隨手擦拭易保潔')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'607', N'平整化不鏽鋼面板，輕鬆清潔少死角')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'608', N'底部清潔盤，避免髒汙油漬掉落櫃體')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'609', N'台爐23度角人因開關，下壓點火更省力')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'621', N'58L大容量，多道料理迅速上桌')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'622', N'純蒸 / 蒸氣上下燒烤 / 蒸+旋風燒烤 / 上火烤 / 上下燒烤 / 上下+炫風燒烤，多元複合功能，滿足各式料理需求')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'623', N'多重客製化組合烹煮，大廚料理輕鬆上桌')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'624', N'外部水箱裝置，加水無須開爐門，避免溫度流失')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'625', N'觸控面板與液晶顯示螢幕完美搭配鏡面玻璃門板，時尚美麗')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'626', N'三層防燙透明玻璃門，使用安全也便於觀察烹飪狀態')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'627', N'保溫 / 解凍 / 殺菌 / 發酵，以及預約定時 / 自動清潔 / 兒童安全鎖，多種貼心功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'631', N'經濟部標檢局認證CNS8088')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'632', N'出水高度：270mm')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'633', N'「微波+蒸煮+燒烤」多達10種烹調功能設定，各種美味不缺席')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'634', N'內建80道食譜，無油煙料理超便利')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'635', N'全新外置水箱設計，加水免開門，保持食材料理溫度')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'638', N'防燙無鉛龍頭')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'640', N'過熱保護開關')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'641', N'漏電安全斷路器')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'642', N'洩壓安全閥')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'643', N'逆止閥')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'645', N'智慧省電，二段定時開關機功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'651', N'整機三年保固(限家用)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'664', N'出水高度：258mm')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'665', N'出水高度：251mm')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'667', N'13L加熱能力')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'670', N'高科技觸控操作，可設定8段火力')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'671', N'單邊4.5kW大消耗量，火力猛快速加熱')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'672', N'雙層防湯盤設計，防止湯汁溢入')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'674', N'「油網+熱熔解」雙效除油，降低油汙排放')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'675', N'使用節能LED燈泡')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'677', N'高效直吸式馬達，強力捕捉油煙')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'678', N'「智能除味」功能，可變速5分鐘多段運轉，快速除味')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'679', N'平網搭配創新二合一導流板，便利換網與刷洗')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'680', N'圓弧造型機身設計，優雅質感防止撞傷')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'681', N'雷雕金屬質感按鍵，輔助中文圖像指引直覺式操作')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'682', N'使用三段式節能LED燈泡，可依不同情境使用燈光')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'699', N'永久免費淨水器健檢')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'700', N'專利濾心卡榫設計，三秒換心')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'702', N'體積小，不佔空間')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'706', N'複合濾材設計，多重濾淨功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'707', N'專利濾心卡榫設計，DIY更換省時又省力')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'708', N'高級RO膜，過濾面積大三倍')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'709', N'日造水量400G')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'710', N'純廢水比 1:1')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'711', N'獲得國際NSF認證')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'712', N'高級RO膜，過濾面積大四倍')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'713', N'日造水量600G')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'717', N'可過濾大於5微米雜質')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'718', N'有效軟化水質，降低水垢生成')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'719', N'台灣康勤陶瓷閥芯')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'720', N'NSF食用級軟管')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'723', N'水柱/花灑兩段出水模式')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'724', N'冷熱出水及冷RO出水三用功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'734', N'瑞士進口NEOPERL起泡器')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'766', N'專利濾心卡榫設計，一擰換心')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'768', N'智能自清 不卡垢')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'771', N'純水廢水比低至 1：2/3')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'773', N'日造水量600加侖')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'774', N'無儲水桶設計，省空間杜絕污染')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'776', N'一體式水路設計，降低漏水風險')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'779', N'貼附防潮消音墊')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'780', N'底部處理：噴塗防汗漆+貼附消音墊')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'787', N'後置型防蟑防臭大提籠')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'788', N'不鏽鋼+PP中提籠')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'790', N'不鏽鋼小提籠')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'791', N'小提籠')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'792', N'大提籠')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'793', N'進口不鏽鋼排水管組(含防蟑管塞)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'794', N'防蟑防臭存水排水管組')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'796', N'進口防蟑防臭排水管組(含防蟑管塞)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'798', N'砧板、碗盤、蔬果皆能方便瀝水')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'799', N'附不鏽鋼滴水籃、不鏽鋼掛籃')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'809', N'一點靈點火系統，精準點火不必等')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'817', N'能源效率第一級')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'820', N'MIT台灣製造')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'821', N'可選配有線溫控器')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'822', N'可選配有線溫控器')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'823', N'全自動偵測排風系統，自動切換煮飯及保溫排風量模式，並可切換手動操作模式')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'824', N'獨家專利出風口結構，水蒸氣不易殘留，結合隱藏式設計，外型更增美觀')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'825', N'內置「橫流扇」特殊設計，有效排除內部電器產生蒸氣，延長櫥櫃壽命')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'826', N'不鏽鋼平拉式托盤，美觀又耐用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'827', N'不鏽鋼砂紋結合強化黑色玻璃下掀門板，時尚外觀提升櫥櫃整體協調性')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'828', N'嵌入式收納設計，適合安裝於高身櫃與其他電器完美搭配')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'829', N'電子式操作介面，外型簡潔時尚')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'830', N'LED顯示螢幕，輕鬆辨識油機做動狀態')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'831', N'15分鐘延遲裝置，常保廚房空氣清新')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'832', N'N-RV出風口設計，防止異物或灰塵落入馬達')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'833', N'自動提醒油網清洗(60hr)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'834', N'易洗易拆式鋁製油網，清洗更方便')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'837', N'德國進口SCHOTT微晶玻璃面板，防爆耐高溫')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'838', N'前後爐橋接功能，跨區使用超彈性')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'839', N'觸控+滑動式控制面板，8段火力及99分鐘定時設定')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'840', N'具有瞬間強力加熱功能，烹飪更有效率')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'841', N'60cm小面板，小空間大利用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'842', N'觸控式控制面板，9段火力及99分鐘定時設定')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'843', N'觸控式控制面板，8段火力及3小時定時設定')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'848', N'8段功能選擇，提供多種燒烤模式，滿足各式料理需求')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'849', N'易清搪瓷內部塗裝與防手紋不鏽鋼金屬面')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'850', N'觸控式操作面板，操作便利')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'851', N'三層隔熱玻璃，中層Low-E玻璃加強隔熱效果')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'852', N'兒童安全鎖，烹調時啟動功能，預防兒童誤觸')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'853', N'電子式操作面板')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'854', N'雙層隔熱玻璃')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'855', N'7段功能選擇')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'856', N'觸控式操作面板')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'857', N'LCD液晶螢幕顯示')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'858', N'304不鏽鋼腔體')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'859', N'防積水內腔設計')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'866', N'304不鏽鋼內壁')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'868', N'5段微波火力選擇')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'869', N'2種微波燒烤雙重模式')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'870', N'8種自動烹飪菜單')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'871', N'分段烹飪記憶模式')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'872', N'不鏽鋼易清內壁')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'873', N'7段洗程：強力、一般、經濟、精緻、90分鐘、60分鐘快洗、預洗')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'874', N'304不鏽鋼內層，環保無毒碗籃架材質，耐磨抗腐蝕，兼顧美觀與食用安全')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'875', N'符合亞洲人使用的中式彈性碗籃架設計')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'876', N'Dual Fan雙風乾燥系統，有效乾燥又省電!')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'877', N'Aqua Stop安全進水管結構')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'878', N'嵌入式機型(需搭配門板)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'879', N'義大利All in One 先進洗淨技術')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'880', N'59分鐘快洗快烘行程')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'881', N'1500rpm 高轉速')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'882', N'15種洗程選擇')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'886', N'變頻馬達，極靜耐用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'887', N'自動平衡衣物系統')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'889', N'具洗淨防震系統')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'890', N'雙溫控制恆溫系統')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'891', N'上層溫度範圍5-10度')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'892', N'下層溫度範圍10-18度')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'893', N'加濕盒可保持平均濕度>65%RH')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'894', N'外層抗紫外線玻璃，內層Low-E玻璃')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'895', N'靜音防震壓縮機')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'896', N'櫸木層架，木質密度高不易變形，且無特殊氣味')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'897', N'冷卻循環通風裝置')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'898', N'室內LED燈照明')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'899', N'LED顯示面板')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'900', N'可調整開門方向(右開門或左開門)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'901', N'帶門鎖(右開門)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'903', N'專利濾心卡榫設計，一擰換心')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'905', N'無需工具，輕鬆一擰即可完成更換')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'906', N'全系列濾心採專利卡榫設計')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'907', N'環吸設計，前後左右皆可進煙，擴大攏煙面積18%、加快進煙速度23%')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'908', N'創新二合一導流板，雙層集油、一次清潔')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'909', N'平整化視覺設計，油網不外露')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'910', N'層次感外型，有無廚櫃皆可搭配')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'911', N'傾斜前頭設計防碰頭，料理更盡興')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'914', N'除菌級濾材，有效濾除水中99.9%病菌')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'915', N'嚴選碳纖，有效濾除重金屬與有機污染物')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'916', N'免插電，環保節能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'924', N'高科技智能感測技術，偵測料理狀況、自動調節最適風量')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'926', N'最長240分鐘倒數計時功能，貼心輔助煮食')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'927', N'直覺式操作介面搭配超大顯示屏幕，操作更便利')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'928', N'R角造型搭配異材質立體拼接前頭，展現細膩質感')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'930', N'全新前板造型，俐落大方')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'938', N'雙層抽屜獨立作動烘乾，可依碗盤多寡自由選擇烘乾殺菌模式，省時更便利')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'939', N'人性化操作介面設計，一鍵操作，簡單易懂好操作')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'940', N'雙PTC熱風循環獨立風道設計，有效縮短烘乾時間，碗盤烘乾更快速、省時')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'941', N'平整化美形外觀搭配觸控面板，提升廚房整體性')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'942', N'O3臭氧殺菌消除異味，碗盤衛生無慮，安心食用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'943', N'大容量雙層收納，不銹鋼材質內壁及碗、筷架，耐用好清理')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'944', N'緩衝式滑軌設計，避免碰撞衝擊碗盤')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'951', N'獨特進水設計，使用中熱水不降溫')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'953', N'內建節能鍵，8小時保溫不加熱')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'954', N'貼心溫度模式鍵，依需求設定熱水溫度')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'957', N'超大吸力，符合中式煮食')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'958', N'三段風力，可依料理需求自由切換')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'959', N'獨立LED照明燈，省電耐用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'960', N'6種洗衣溫度：90℃/60℃/50℃/40℃/30℃/冷水')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'961', N'3種烘衣模式：特乾、熨乾、晾乾')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'962', N'3種加強功能：預洗、水旋風、強力殺菌')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'963', N'前揭式纖維過濾器')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'966', N'專利濾心卡榫設計，更換濾心迅速簡易')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'967', N'可搭配櫻花淨水設備產品為前置過濾用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'969', N'觸控式操作，具8段火力及瞬間強力加熱功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'970', N'具最高8小時定時設定')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'971', N'熱效率86%，加熱與散熱快速')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'972', N'觸控+滑動式操作，具8段火力及瞬間強力加熱功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'973', N'美國進口除鉛碳纖維濾心，有效濾除重金屬與有機污染物')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'975', N'72L超大容量，搭配5層烤架')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'976', N'內部易清塘瓷塗層')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'977', N'食物溫度探針')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'979', N'空氣循環雙重散熱模式')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'980', N'高溫自清行程')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'981', N'四道濾心層層過濾，有效濾除水中異色、異味、餘氯、重金屬、有機污染物、細菌等')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'982', N'標配漏水斷路器')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'983', N'搭配NSF驗證儲水桶')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'984', N'搭配無鉛驗證龍頭')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'985', N'四層隔熱玻璃(中間雙層Low-E玻璃)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'986', N'雙濾心設計，機身更輕薄，更省空間')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'987', N'雙出水模式，可依需求選擇純水生飲或過濾水洗滌')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'989', N'龍頭即時燈色提醒，確保水質')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'990', N'新進化二合一形導流板，強力捕捉主力油煙區，創造健康煮食環境')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'991', N'高效率直吸式高速二極馬達，排煙強勁、油煙不殘留')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'993', N'全新歐化單層造型，美觀大方')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'994', N'渦輪變頻系統，業界最強Turbo吸力與低噪音，效力強更安靜，節能又省電')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'995', N'靜音除味設計，排除廚房餘味，常保廚房空清新')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'997', N'二合一導流板易拆易清，清潔便利')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'998', N'鑄鐵爐架，耐用不滑鍋')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'999', N'多種濾材複合設計，達到層層多重濾淨功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1000', N'有效吸附餘氯、去除異色異味')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1003', N'用於提升口感，使出水入口甘甜')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1005', N'純廢水比 1:0.6')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1008', N'繁體中文觸控介面')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1009', N'烹調功能All in one')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1010', N'獨家雙動力烤')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1011', N'獨家智能溫控')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1012', N'Plus Steam 蒸氣追加功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1013', N'自動烹調')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1014', N'四種清潔模式')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1015', N'外部加水')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1016', N'Auto Open 自動開門乾燥設計')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1018', N'Auto Open 自動開門乾燥設計 (可選擇關閉)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1019', N'8段洗程：ㄧ般/強力/自動/節能/精緻/快洗/90分鐘/預洗')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1020', N'加強功能：加強乾燥/加強洗淨/上下層洗')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1021', N'最高溫度70度')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1022', N'三組噴水臂，360 度強力水柱')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1023', N'三層籃架，可調式上碗籃')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1026', N'24 小時延遲啟動功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1027', N'Aqua Stop安全進水管設計')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1028', N'照地燈顯示')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1029', N'具最高10小時定時設定及8段定溫設定')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1030', N'一鍵暫停功能，在不關機之下可暫時停止所有加熱動作，並保留所有設定')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1031', N'雙抽屜作動烘乾，可依碗盤多寡自由選擇三段烘乾殺菌模式  ')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1032', N'O3殺菌+PTC熱風循環設計，讓碗盤殺菌烘乾更安心')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1033', N'大容量雙層收納，不鏽鋼材質內壁及碗架，耐用好清理')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1034', N'黑色鏡面玻璃')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1035', N'50L超大容量，搭配3層烤架')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1036', N'7種烤程：上下火加熱/上燒烤/雙重上火/雙重上火+風扇/獨立下火加熱/上下火+風扇/熱風循環')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1037', N'2種蒸氣行程：純蒸、蒸烤')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1038', N'5種附加功能：自動菜單/快速預熱/發酵/ECO/除垢清理')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1039', N'PP+ST雙層中提籠')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1040', N'附不鏽鋼掛籃、不鏽鋼瀝水盤及實木砧板')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1041', N'外徑：850×460×220mm')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1042', N'內徑：800×410×220mm')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1043', N'高質感靚黑玻璃前飾板，搭配廚具更時尚')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1044', N'10分鐘延遲關機功能，廚房空間更清新')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1045', N'三件式易拆油網，清潔更便利')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1046', N'隱藏油網設計與切割造型玻璃觸控介面，盡顯優雅美型')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1048', N'逆風檔板設計，防堵強風灌入')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1049', N'微電腦風壓學習控制，有效排出廢氣')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1050', N'搭配觸控式龍頭，操作清晰簡便')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1051', N'嚴選不銹鋼加熱管材質，飲水更安心')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1052', N'多重安全防護機制，確保安全')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1058', N'外徑 : 550×460×220mm')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1059', N'內徑：500×410×220mm')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1060', N'兒童安全鎖，防止幼童誤觸')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1061', N'一點零點火系統，精確點火不必等')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1062', N'永久免費送油網，確保吸力永如新')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1063', N'AI智能風控科技，自動調節最適風量')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1064', N'熱感偵測技術，不限爐具隨心搭配')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1065', N'渦輪變頻科技，Turbo大吸力吸更淨')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1066', N'環吸技術擴大攏煙加速排煙，暢快排煙')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1067', N'靜音除味功能，安靜舒適排除油煙餘味')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1071', N'免費淨水器健檢服務，把關飲水品質')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1072', N'創新專利，淨水+熱水雙機合一')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1075', N'獨特進水設計，熱水使用不降溫')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1076', N'貼心溫度模式，可設定保溫溫度')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1078', N'搭配電子式觸控龍頭，操作簡便')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1079', N'具濾心更換提示，無須費心紀錄')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1080', N'中式碗籃架設計')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1081', N'獨立式機型(亦可拆上蓋嵌入櫃體)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1082', N'榮獲2022金點設計獎')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1083', N'榮獲2022台灣精品獎')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1084', N'8種洗程(強力/自動/節能/極靜/衛生殺菌/60分鐘/預洗/機器自清)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1085', N'4種加強功能(加強乾燥/加強洗淨/上下層洗/縮短清洗)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1086', N'最高溫度72度')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1087', N'加速洗淨功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1088', N'機器自清')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1089', N'加強功能：加強乾燥/加強洗淨/上下層洗/縮短清洗/節能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1097', N'三環大火適合快炒')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1098', N'一體成型純銅爐頭，耐用不銹蝕')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1099', N'不鏽鋼體框，耐用好清理')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1100', N'清潔盤設計，避免髒汙油漬掉落櫃體')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1101', N'熄火安全裝置，杜絕瓦斯外洩疑慮')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1102', N'有效去除水中99.9%病菌')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1103', N'有效吸附自來水中餘氯、異色異味')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1104', N'有效濾除水中沉澱物、懸浮雜質等')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1105', N'可將澀口硬水轉化成甘甜軟水')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1106', N'通過NSF42 材料安全認證')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1107', N'搭配CNS8088無鉛認證龍頭')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1108', N'專屬軟水區除菌軟水配方')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1109', N'專屬中硬水區軟水除菌配方')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1110', N'專屬超硬水區軟水除菌配方')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1111', N'有效軟化水質去除水垢')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1112', N'六片花瓣式火焰，火色美麗均勻')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1113', N'一體成型落水頭+專利無面圈排水孔設計')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1114', N'防撞隔熱墊、濾籃/上蓋、ST滴水籃')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1116', N'聚熱爐架設計，熱能聚集不散失')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1120', N'清潔盤設計，避免髒汙掉落櫃體')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1122', N'AutoCook自動燉煮功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1123', N'中式爆炒大火力')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1124', N'10段式滑動觸控火力設定')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1125', N'11段式定溫加熱功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1126', N'一鍵火力加速')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1127', N'火力穩定持續加熱')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1128', N'計時烹調')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1129', N'過熱保護/餘熱警示/小型物件偵測')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1130', N'防溢功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1131', N'大面板烹調不撞鍋')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1132', N'14段式滑動觸控火力設定')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1133', N'Flex Induction 雙自由感應區/橋接加熱')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1134', N'直覺式功能鍵：保溫/煮沸/融化')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1136', N'新型近吸排風結構，近吸直吸秒排煙')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1137', N'大風機增壓馬達，龍捲大吸力暢排煙')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1138', N'易拆磁吸式油網，省時輕巧好刷洗')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1139', N'全鋼化黑玻璃，一抹即淨好省心')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1140', N'完美傾斜度，釋放烹飪視線不碰頭')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1141', N'雙效除油功能，機內清潔保如新')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1142', N'900mm自動擋煙板，擴大攏煙不跑煙')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1143', N'黃金開合66°角，加速排煙吸更淨')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1145', N'一鍵智能除味，5分鐘排除油煙餘味')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1146', N'四季溫自動調溫，三種貼心模式彈性選擇')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1147', N'智能偵測即時讀取數據，運作永如新')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1148', N'智能恆溫+分段火排，不會忽冷忽熱')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1149', N'平整化美形外觀搭配電子式按鍵，提升廚房整體性')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1151', N'變頻式智慧節能烹調')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1152', N'數位微電腦控制')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1153', N'高質感觸控玻璃介面，搭配廚具更時尚')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1154', N'Turbo強勁吸力，3段風力可調，依料理需求自由切換')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1155', N'獨立LED照明燈，省電又耐用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1156', N'清潔鎖定功能，清潔不再誤啟動')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1157', N'易拆油網，油網清潔更便利')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1158', N'嵌入式設計，提升廚房整體質感')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1159', N'飛梭旋鈕設計，操控便利')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1160', N'內外環感應(右邊大口)，大小鍋具皆適用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1162', N'1種燒烤模式')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1164', N'具最高4小時定時及6段定溫設定')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1165', N'具7段火力功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1166', N'德國SCHOTT微晶玻璃面板，防爆耐高溫')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1167', N'自動鍋具檢測，無鍋具即停止加熱')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1168', N'兒童安全鎖與餘溫警示功能，安全有保障')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1169', N'具最高3小時定時設定')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1170', N'具6段火力加熱與瞬間加熱功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1171', N'挖孔與雙口小面板檯面爐通用，替換免改檯面')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1175', N'雙環設計，符合基本料理需求')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1176', N'O3臭氧殺菌，碗盤乾淨無虞')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1177', N'PTC熱風循環，烘乾更省時')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1178', N'三段全自動模式，操作便利')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1179', N'不鏽鋼內膽及碗籃筷架，質感加倍')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1180', N'洗淨結束自動開門乾燥')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1181', N'自動洗程可智慧偵測髒污設定最佳程序')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1182', N'八段洗程，最高70度高溫洗淨')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1183', N'三組噴水臂無死角沖洗')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1184', N'三層中式碗盤籃架，收納更便利')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1185', N'AquaStop 自動偵測漏水系統')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1186', N'嵌門板設計，完美結合廚房風格')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1187', N'緩衝滑軌，避免碗盤碰撞')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1188', N'食品級不鏽鋼內膽，確保餐具使用安全')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1189', N'渦輪變頻馬達，Turbo吸力更清淨')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1190', N'靜音除味模式，安靜舒適排味')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1198', N'滑動門設計，免切踢腳板，安裝便利，櫥櫃更美觀。')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1201', N'3種烘乾功能：正常/加強/定時烘乾(30/60/90/120/180mins)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1202', N'HYGIENE PRO獨家洗淨科技')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1203', N'水冷凝烘乾技術')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1204', N'智慧節能烘衣')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1205', N'LED觸控面板操作流暢簡單')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1206', N'BLDC變頻馬達，極靜耐用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1207', N'金級省水標章')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1208', N'前揭式纖維過濾器(貼心排水管設計)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1215', N'具最高99分鐘定時')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1216', N'具9段火力功能及瞬間加熱功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1217', N'自動感應加熱區，適用大小鍋具')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1218', N'黑色平整化外觀，提升廚房整體質感')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1219', N'不鏽鋼內膽及碗籃架，質感加倍')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1220', N'消光黑絕美外型')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1221', N'永久免費送安檢，使用安心有保障')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1223', N'貼心水溫控制，洗澡不再忽冷忽熱')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1224', N'三溫隔艙設計，增加熱水出水量')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1225', N'專利集熱網設計，可連續多人舒洗')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1226', N'多重安全偵測裝置，安全全面升級')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1227', N'高密度PU發泡技術，保溫效果佳')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1228', N'標配有線溫控器，就近操作超便利')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1229', N'電子穩定控溫，自由設定溫度')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1230', N'簡潔外觀設計，質感全面升級')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1231', N'紅綠雙燈指示，運作狀態輕鬆掌握')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1232', N'不鏽鋼內外桶，堅固又耐用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1233', N'無段自動調溫，智慧又省電')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1234', N'數位恆溫，不忽冷忽熱')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1235', N'光電水流檢知裝置，杜絕空燒危險')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1236', N'電路安全裝置，避免觸電及防爆')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1237', N'全自動故障偵測系統')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1238', N'多項防爆偵測裝置，安全全面升級')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1239', N'超高溫切斷裝置')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1240', N'過熱跳脫裝置')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1244', N'高效節能，安全環保')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1245', N'最高55度直熱出水，舒適洗')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1246', N'微電腦智慧定溫，超省電')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1247', N'熱水循環間接加熱，不易產生水垢')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1248', N'9段電子設定系統，隨需求調控')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1249', N'智慧型微電腦控制器，最便利')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1250', N'洗、烘、存，一機完成')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1251', N'雙效烘乾系統：熱風烘乾 + 自動開門，雙重選擇，全面烘乾')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1252', N'DP淨洗 (雙區加強洗淨)，強效清潔較髒污的餐具')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1253', N'無縫圓弧中架板，零死角好清潔')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1254', N'全平面觸控介面，一抹即淨好省心')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1255', N'爐頭雙重凸簷設計，防止油漬髒污')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1256', N'日式外型設計')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1257', N'烹調功能All in one ： 蒸氣烹調( 低溫蒸/ 原味 蒸/ 慢蒸)/  蒸氣烘烤/ 蒸氣燉煮/ 健康 蒸 (120/ 150/190℃ )/ 健康炸/ 烘烤/ 發酵')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1258', N'直噴式過熱水蒸氣')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1259', N'蜂巢式平面加熱設計')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1260', N'30 道自動菜單')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1261', N'4 種清潔模式 / 1種餐具消毒功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1262', N'自動開合上排式出風口設計')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1263', N'外置水箱及盛水槽，貼心便利')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1269', N'有效去除99.9%細菌')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1270', N'專利濾心卡榫設計，方便DIY更換')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1273', N'有效濾除餘氯、異色異味')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1274', N'有效濾除重金屬、有害微生物')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1275', N'強化除鉛配方')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1276', N'10L熱水供應能力')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1277', N'電池電量指示燈')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1278', N'OFC新式水箱，耐用節能更環保')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1279', N'加強抗風結構，適用強風地區')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1280', N'櫻花熱水器+永久免費送安檢=真正的熱水器')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1281', N'12L熱水供應能力')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1282', N'日本NEG陶瓷玻璃面板')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1283', N'水溫與水量雙鈕調節設計，輕鬆調溫好便利')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1284', N'ABS安全感應自動阻斷瓦斯，防止空燒')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1286', N'8種洗程(智能/強力/節能/標準/快速/精緻/除菌/機體自清)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1287', N'5種水溫(55℃/60℃/65℃/70℃/73℃)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1288', N'換氣存放，洗碗免收碗，72小時保持腔體乾燥不回潮')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1289', N'73℃高溫洗淨')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1290', N'紫外線殺菌，有效消除99.99%大腸桿菌與金黃葡萄球菌，洗得更乾淨，使用更安心')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1291', N'Auto 智能洗：内建濁度感測器，自動偵測碗盤髒汙程度，智能選擇最佳洗滌方案')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1293', N'紅綠雙燈+溫度錶，狀態輕鬆掌握')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1294', N'輕盈雙色強化玻璃面板，廚房質感大升級')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1300', N'雙自清功能(水自清+高溫自清)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1303', N'Perfect Temp 技術')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1304', N'Surround Air 技術')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1305', N'雙層抗UV鋼化玻璃')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1306', N'防震系統')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1307', N'溫控系統')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1309', N'鉸鏈門(可左右互換)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1310', N'伸縮滑軌')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1311', N'高效照明')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1312', N'德國SCHOTT陶瓷微晶玻璃')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1313', N'快捷功能鍵')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1314', N'Stop & Go 暫停')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1315', N'鍋具識別/偵測功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1316', N'火力段數9段+P')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1317', N'兒童安全鎖設計')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1318', N'餘溫警示燈')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1319', N'計時功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1320', N'觸控介面')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1322', N'開關機自清功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1323', N'可自動調節咖啡濃度、溫度與咖啡量')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1325', N'3種功能(咖啡、蒸氣、熱水功能)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1328', N'最多一次出2杯咖啡量')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1329', N'伸縮式滑軌，便於放置咖啡豆')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1330', N'可使用咖啡豆或咖啡粉製作咖啡')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1331', N'可製作純正的卡布其諾、拿鐵咖啡或牛奶咖啡')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1332', N'咖啡研磨粗細調整：13段')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1333', N'咖啡豆盒：200g')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1334', N'極簡設計外觀')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1335', N'黑色鋼化玻璃')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1336', N'彈出式開門系統')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1337', N'內置防滑墊伸縮抽屜')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1348', N'Eco Power')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1349', N'雙渦輪強力馬達')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1350', N'LED照明燈條')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1352', N'不鏽鋼防手紋處理')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1353', N'逆止風門防止強風倒灌')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1360', N'永久免費送油網，吸力永保如新')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1361', N'進煙口距離檯面僅32cm，快速排煙')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1362', N'可替換全隱藏機型，全平玻璃好擦拭')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1363', N'首創揮手智控，淨煙零觸碰')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1364', N'兩分鐘延遲關機，持續排除料理餘味')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1365', N'易拆卸油杯，方便清潔')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1366', N'可替換半隱藏機型，全平玻璃好擦拭')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1367', N'微晶玻璃面板，防爆耐高溫')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1368', N'設計榮獲國際iF設計大獎肯定')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1369', N'日造水量400加侖，1L/分')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1370', N'純水回流技術，全時段每一口都新鮮')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1371', N'內建智能沖洗功能，維持濾效')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1372', N'搭配CNS8088無鉛驗證龍頭')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1373', N'頂級工藝，廚房搭配奢雅美觀')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1374', N'高硬度防刮耐高溫，經久耐用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1375', N'極致細密無孔，疏油抗菌好清潔')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1377', N'內槽圓角造型，易清潔')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1378', N'矽膠靜音片設計，減少共振噪音')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1379', N'直角圓邊不卡垢')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1380', N'特選304不鏽鋼')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1381', N'使用軟布易清潔')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1382', N'溢水孔設置，排水不煩惱')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1383', N'進煙口自動下降，排煙更即時')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1384', N'可替換全隱藏機型，圓弧機身不卡油')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1385', N'可替換半隱藏機型，圓弧機身不卡油')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1386', N'內建軟水淨水模組，降低水垢')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1387', N'節能省電模式，8/12/24/48/72小時保溫不加熱')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1388', N'多重安全防護裝置，使用安心')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1390', N'6種洗衣溫度：90℃ /60℃ /40℃ /30℃ /20℃ /冷水')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1395', N'易清潔陶釉內壁')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1396', N'計時器')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1397', N'牛排專用特色鑄鐵烤盤')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1398', N'四層隔熱玻璃門')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1399', N'兒童安全鎖/ 系統門鎖')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1400', N'緩衝門+ 開門斷電')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1401', N'700℃特色熔岩炙烤模式')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1402', N'20 道自動食譜')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1403', N'12 種烘烤行程')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1404', N'拋光不鏽鋼工藝')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1405', N'通過經濟部能源局第1級能源效率標示')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1407', N'平整化設計，搭配櫃體更美觀')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1408', N'面板一體式盛湯盤，隨手擦易清潔')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1409', N'電源功率管理')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1410', N'防溢保護功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1411', N'鍋具偵測')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1414', N'新一代智能控溫技術，夏天不過熱，冬天暖呼呼')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1415', N'16L智能恆溫，穩定供給熱水，不會忽冷忽熱')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1416', N'分段火力，依水溫自動調節，節能省瓦斯')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1417', N'分流管降溫設計，穩定熱水溫度')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1418', N'FE式強制排氣最安全，室內外皆可安裝')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1419', N'全區橋接(8個感應點)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1421', N'大廚功能(10種：燒烤、酥炸、 煎炒、煮沸、煮飯、水煮、油封、 燉煮、融化、保溫)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1422', N'靜音設定')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1423', N'大廚功能(8種：燒烤、酥炸、 煎炒、煮沸、油封、燉煮、融化、 保溫)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1424', N'雙環感應區設計(右區)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1425', N'彈性烹飪區(跨區橋接)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1426', N'大廚功能(3種：燉煮、融化、保溫)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1427', N'三段式滑鍋控溫')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1428', N'大廚功能(7種：燒烤、酥炸、 煎炒、水煮、油封、燉煮、保溫)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1429', N'前後爐橋接功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1430', N'觸控式控制面板')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1431', N'9段火力及99分鐘定時設定')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1432', N'瞬間強力加熱功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1433', N'STOP&GO暂停功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1434', N'溫度過熱自動停止加熱功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1435', N'餘溫安全警示')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1436', N'全隱藏平整設計融入櫥櫃')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1437', N'3段風力')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1438', N'5分鐘延遲關機')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1439', N'Fresh清淨功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1440', N'清潔鎖定功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1441', N'LED照明')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1450', N'24小時延遲啟動功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1453', N'不鏽鋼油網防油滴設計')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1454', N'「微波+蒸氣+燒烤」三強合一，多種烹調功能設定，打造高級時尚烹飪體驗')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1455', N'50L豪華大容量')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1456', N'80道自動食譜，料理新手也能輕鬆做大廚')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1457', N'大容量外置水箱，加水免開門，保持食材料理溫度')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1458', N'搪瓷塗層內膽，易清耐刮')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1460', N'高效抑垢濾心及快拆濾頭')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1461', N'顆粒細小，抑垢效果佳')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1462', N'通水量大，更換週期長')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1463', N'穩定性高，高溫仍可維持高效率')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1464', N'高效抑垢濾心')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1465', N'最高3350W變頻微波快速加熱')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1466', N'創新專利設計，RO淨水+熱水雙機合一')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1467', N'內建RO淨水模組，降低水垢')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1468', N'通過能源效率一級')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1469', N'體積小，免安裝，隨處可放')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1470', N'50~90℃，11檔溫度隨心設定')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1471', N'1秒瞬熱，即濾即飲，4000L濾水量')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1472', N'ALL in one複合式MRO濾心，1支濾心3重濾效')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1473', N'UV紫外線殺菌防止水箱二次汙染')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1474', N'簡約介面更直觀，操作更便利')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1475', N'磁吸接水盤，避免滴漏更潔淨')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1476', N'7+1段火力調控，美味精準掌握')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1477', N'LED顯示+定位手感旋鈕操作容易')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1478', N'自動煲湯功能，自動轉小火不必等')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1479', N'創新專利雙炫火，斜火包覆更高效')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1480', N'防乾燒與油溫過高保護，杜絕危機')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1481', N'搭配智能觸控龍頭，操作簡便')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1484', N'304不鏽鋼內層')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1485', N'6段火力與Boost瞬間加熱')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1486', N'挖孔尺寸與兩口小面板檯面爐通用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1487', N'1分鐘-3小時定時設定')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1488', N'2小時超時自動關機')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1489', N'餘溫警示與兒童安全鎖')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1490', N'消光黑靚黑機殼，不沾指紋、風格出眾')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1491', N'AI 智能風控、高達256點熱感偵測技術')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1492', N'DC變頻風機，可運作Turbo、1、2、3段風力+靜音除味')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1493', N'AI智能感測器清潔提示燈、油網清潔提示燈')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1494', N'長型LED照明均勻')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1495', N'易拆油網清潔更便利')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1496', N'ALL in one複合式MRO濾心設計')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1497', N'過濾孔徑僅0.0001微米，僅留純水')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1498', N'日造水量75加侖')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1499', N'Fresh&Drying清新存儲72小時')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1500', N'HeatDry熱風烘乾，手洗後快速烘乾')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1501', N'最高72℃高溫漂洗')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1502', N'三組噴水臂360度3D水網')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1503', N'預約啟動功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1504', N'中式三層籃架')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1505', N'可獨立擺放或嵌櫃安裝')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1506', N'電壓、高度新換購皆宜、免拉專線免改櫃')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1507', N'9種洗程：經濟/機器自清/強力/一般/精緻/快速/預洗/重汙/極靜')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1508', N'4種加強功能：加速洗淨/加強烘乾/清新存儲/熱風烘乾')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1509', N'SUS 304材質，表面毛絲處理，經久耐用、易清潔保養')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1510', N'流線型導水線設計，排水迅速、不積水')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1511', N'水槽底部噴塗防汗漆、貼附消音墊，減少震音、避免冒汗')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1512', N'標配大提籠及V型防蟑防臭排水設計')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1513', N'標配不鏽鋼大滴水籃及小滴水籃，清潔用品輕鬆收納，碗盤、蔬果便利瀝水')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1516', N'橫流扇設計，將電器產生蒸氣排出')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1517', N'獨家專利隱藏出風口')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1521', N'9段火力，滑動觸控')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1522', N'小火持續加熱功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1523', N'Stop&Go暫停功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1524', N'自動鍋具檢測')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1525', N'感應鍋徑最小12公分')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1526', N'雙環火設計，五段火力變化')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1527', N'密閉式防湯盤設計，防止湯汁溢入')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1528', N'獨立擺放/嵌入櫥櫃兩用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1529', N'洗程結束自動熱風烘乾，加強碗盤乾燥效果')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1530', N'72小時熱風循環換氣，碗盤清新無異味')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1531', N'九段洗程，最高72度高溫洗淨')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1533', N'2種加熱模式')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1534', N'5段微波+微波燒烤')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1535', N'食物解凍')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1536', N'8道自動食譜')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1537', N'12種烘烤行程')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1538', N'4種蒸汽模式')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1539', N'水自清系統')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1540', N'三層隔熱玻璃門')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1541', N'緩衝門+開門斷電')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1542', N'易清潔塘瓷內壁')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1543', N'15種烘烤行程')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1544', N'3種蒸汽模式')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1545', N'食物探針')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1548', N'5段排油煙風力+1段(Turbo)超强風力')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1549', N'50mm深烤盤 x1')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1550', N'耐熱上蓋 x1')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1551', N'烤架 x1')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1552', N'不鏽鋼蒸籃 x2')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1553', N'自動開門(冷凝烘乾)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1554', N'70度高溫殺菌')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1555', N'分層洗功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1556', N'6種水溫、9種洗程')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1557', N'三層碗籃架(可調式)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1558', N'滑動門')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1559', N'投影指示燈')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1560', N'AuqaStop 防漏水系統')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1563', N'可置放6套餐具')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1565', N'工作指示燈')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1567', N'咖啡渣盒容量：14杯')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1569', N'溫控器溫度：30°C、40°C、60°C、80°C')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1570', N'智能定時功能( 1分鐘~4小時)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1571', N'30分鐘超時關火')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1572', N'標準安裝配件無附風管護罩，可依環境需求，選購風管護罩')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1573', N'有效濾除水中99.9%重金屬鉛、新興汙染物')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1574', N'搭配電子觸控龍頭')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1575', N'濾材通過NSF42/53/401 材料安全認證')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1584', N'電子顯屏龍頭隨時掌握家中水質')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1585', N'日造水量600加侖，1.5L/分')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1586', N'日造水量800加侖，2.0L/分')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1587', N'雙出水模式，提供純水或過濾水')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1588', N'達醫療級過濾標準，僅留純淨好水')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1589', N'有效濾除細菌、病毒、重金屬等')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1590', N'過濾面積較傳統 RO大五倍')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1591', N'熱感偵測技術，不限瓦斯爐具隨心搭配')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1592', N'不限瓦斯爐具之品牌，皆可偵測')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1593', N'One-Touch，手控風扇啓動或停止')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1594', N'強化玻璃下掀門板')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1595', N'SUS304不鏽鋼材質，健康安全')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1596', N'附防潮消音墊，減少水槽震音')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1597', N'搭配進口不鏽鋼排水管與防蟑管塞，蟑螂、臭味免煩惱')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1598', N'附不鏽鋼滴水籃，碗盤、蔬果皆能方便瀝水')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1599', N'防蟑管塞、臭味免煩惱')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1600', N'附不鏽鋼掛籃/塑膠滴水籃，清潔用品輕鬆收納，碗盤、蔬果皆能方便瀝水')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1601', N'附不鏽鋼掛籃/不鏽鋼半邊籃/ABS洗菜籃/竹木砧板，多樣配件，洗滌備料更輕鬆')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1602', N'附不鏽鋼掛籃/不鏽鋼滴水籃，清潔用品輕鬆收納，碗盤、蔬果皆能方便瀝水')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1603', N'珍珠壓花，耐磨、減少潑濺')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1604', N'後置型防蟑防臭大提籠，搭配進口不鏽鋼排水管與防蟑管塞，蟑螂、臭味免煩惱')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1605', N'專利CTV定溫閥，洗浴安心無憂')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1606', N'10kW大火力，滿足中式快狠準的熱炒需求')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1607', N'材質堅固耐用，耐長時間高溫煮食')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1608', N'銅鋁合金爐頭 耐用好清潔')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1609', N'平整不鏽鋼面板，清潔擦拭方便')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1610', N'烹飪完成亮燈提醒腔內電器運作完畢')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1611', N'全自動偵測排風，自動切換煮飯及保溫狀態排風量，並可切換手動操作模式')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1612', N'獨家專利隱藏出風口結構，水蒸氣不易殘留')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1613', N'強化玻璃下掀門板，搭配不鏽鋼平拉式托盤，美觀耐用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1615', N'雙爐獨立智能時控，1分-4小時定時關火')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1616', N'雙環5種火力，符合中式料理')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1617', N'雙重智能關火, 安全設計')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1618', N'圈圍式鑄鐵爐架，操作不滑鍋')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1619', N'高質感觸控面板，簡約設計，易懂好操作')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1620', N'獨立/全自動殺菌烘乾九段行程，精準滿足各種使用需求')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1621', N'套房或小坪數廚房適用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1622', N'POWER四季溫，超越極限舒適無限')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1623', N'雙核感測器，極致控溫提供最適水溫')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1624', N'智控微火，精準控溫再升級')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1625', N'三種自動調溫模式，彈性選擇最佳出水溫度')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1627', N'下置型直流變頻風機，安全又抗風')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1632', N'智能感應升降，無須觸碰，手濕也能輕鬆啟動')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1633', N'智能觸控升降，自由調整高度，打造最順手取放體驗')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1634', N'門板力學指引設計，單手輕鬆推拉門板，開關更順暢')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1635', N'底部防汗塗層設計，有效減緩冷凝水產生')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1636', N'智能通，智能掌握極度享受')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1637', N'8大安全防護，時刻守護')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1638', N'智能IH連動，油煙機與IH同步啟閉')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1639', N'智能料理輔助，提供即時鍋內溫度')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1641', N'【備註】連動功能需搭配櫻花指定型號之IH爐:EG2351G')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1642', N'油煙機連動功能，風量智能調整')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1643', N'一鍵鍋具效率偵測，快速判斷鍋具適不適合')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1644', N'一鍵智能煲湯，燉煮方便不用顧')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1645', N'一鍵暫停功能，暫時離開安全便利')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1646', N'小火輸出穩定，低噪音不斷續')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1647', N'連動功能需搭配櫻花指定型號之油煙機:DR7397')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1648', N'全平面黑玻璃觸控介面，一抹即淨好省心')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1649', N'可選購活性碳濾網組，晉升空氣循環機使用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1650', N'智能IH連動，IH同步控制油煙機啟閉與風量')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1651', N'不鏽鋼材質好清潔')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1652', N'【備註】連動功能需搭配櫻花指定型號之IH爐:EG2501G')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1664', N'自動開門')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1665', N'7 種洗程，高溫除菌洗74℃')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1666', N'17 人份中式大容量碗籃架設計')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1668', N'全中文觸控面板附顯示屏幕')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1669', N'AI 藍芽智慧連動功能 ( 需搭配指定油煙機)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1670', N'鍋具適配性偵測，煮食效率提升')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1672', N'9 段式觸控火力設定')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1673', N'8 段式定溫加熱功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1674', N'最大火力3600W ( 單口3000W )')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1675', N'STOP&GO 暫停功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1676', N'安全鎖')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1677', N'過熱保護')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1678', N'餘熱警示')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1679', N'小型物件偵測')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1680', N'AI 藍芽智慧連動功能，自動調節風量 ( 需搭配指定IH 感應爐)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1681', N'觸控玻璃面板')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1682', N'3 段風力')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1683', N'LED 照明燈')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1684', N'三片式鋁油網')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1685', N'8 分鐘延遲關機')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1686', N'Fresh 清淨功能，廚房空間更清新')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1687', N'【備註】連動功能需搭配櫻花指定型號之油煙機:R610HS')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1688', N'自動煲湯')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1690', N'5分鐘延遲關機，Fresh 清淨功能，廚房空間更清新')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1691', N'獨立 LED 照明燈，省電耐用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1692', N'兩片式鋁油網')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1695', N'表面處理：霧黑電鍍')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1696', N'表面處理：雙色電鍍 (黑+金)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1697', N'表面處理：槍灰PVD真空鍍膜')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1698', N'拉絲工藝表面處理+特殊防護塗層')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1701', N'電子觸控玻璃面板')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1702', N'3 段風速+Turbo')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1703', N'延遲關機')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1704', N'不銹鋼外觀')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1705', N'不銹鋼平油網，可洗碗機清洗')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1706', N'後方LED 燈條照明')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1707', N'左爐智能定時功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1708', N'黑色強化玻璃 6mm')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1709', N'易清保潔密閉式爐頭設計')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1710', N'方形鑄鐵爐架及消光黑琺瑯湯盤')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1711', N'黑色強化玻璃 4mm')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1712', N'15種洗程選擇:快洗+快洗烘/溫水快洗45mins/洗清+脫水/ 單獨脫水/單獨烘乾/蒸氣抗敏/羽絨/嬰兒防敏/槽洗淨/大件衣物/彩色衣物/混合衣物/羊毛柔洗/棉製衣物/我的行程')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1713', N'5種洗衣温度:60度C/40度C/30C/20度C/冷水')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1714', N'附加功能:清新脫臭/脫水轉速調整/洗衣温度調整')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1720', N'9種烘烤模式 (含發酵、乾燥、ECO)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1721', N'5種蒸烤模式 (3種蒸汽量設定: low, Medium, High)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1722', N'純蒸模式')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1723', N'水自清、除垢 清潔雙模式')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1724', N'食物探針')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1725', N'33道自動菜單')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1726', N'輕鬆下拉，收納、取用高處物品')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1727', N'具推回及下拉雙向緩衝功能，操作省力')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1728', N'義大利SALICE進口五金，左右摺開啟設計，收納、取用物品一目了然')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1730', N'單手即可打開，門板轉動範圍最小化、取物寬高最大化， 大型物品好收好拿')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1731', N'電動升降作動、輕鬆收納取物，符合人體工學')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1732', N'奧地利BLUM進口五金，上下摺開啟設計櫃內空間，收納、取用物品一目了然')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1733', N'配置保護裝置，門板關閉過程受阻、立刻停止，安全防夾')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1734', N'輕柔按壓即可開啟與關閉，輕鬆省力')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1735', N'玻璃門吊櫃可兼具收納及展示設計，提升居家美感、豐富空間表情')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1736', N'造型格子窗玻璃門提供精準的隔板對齊配置')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1737', N'櫻花專屬防脫落隔板前托器，搭配止滑隔板粒，提供最安全及穩定的物品取放、收納')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1738', N'高質感觸控面板，一鍵操作，輕鬆簡易')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1739', N'SUS304不鏽鋼材質內桶，易清耐用、質感加倍')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1740', N'具收納、瀝水及LED照明複合機能，一機滿足多元需求')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1741', N'具障礙物及超重偵測安全裝置，操作使用更安心')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1742', N'可配合多樣門板整體規劃配置')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1743', N'鋁質材質內桶，易清耐用、質感加倍')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1744', N'奧地利BLUM進口五金，上掀開啟設計櫃內空間，收納、取用物品一目了然')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1745', N'瑞士PEKA進口轉角五金')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1746', N'新一代盤籃設計─ 現代簡約式樣，提升空間利用率；碳灰燦光塗裝技術、細緻霧面止滑墊，細節講究、質感升級')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1747', N'T1.5mm一體成型盤籃，無焊點、好置放、易清潔，收納空間極大化')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1748', N'人體工學易握把手，旋弧拉出外盤籃，輕鬆省力；內盤籃配置鋼珠緩衝滑軌，可全展至櫃外，使轉角空間收納取物更便利')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1749', N'可依需求選配天然橡木飾條，妝點收納空間溫潤質調')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1750', N'德國Kesseböhmer進口轉角五金')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1751', N'弧形拉伸、標配緩衝，作動滑順靜音')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1752', N'具灰色木質專利防滑底板、平穩高載重底座設計，便利收納、轉角空間有效運用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1753', N'雙層表面處理銀色塗裝造型籃架和骨架，匠心工藝、質感細節')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1754', N'旋弧式順暢開啟、氣壓式緩衝閉合，作動平穩出色')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1755', N'內外籃架標配止滑墊，可分層收納、便利置放，轉角空間有效運用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1756', N'門開角度可調式設計，可依適用空間設定，避免門開碰撞的可能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1757', N'櫻花專屬靜音緩衝滑軌，開啟時輕柔滑順、閉合時安靜緩衝無噪音，順滑平穩')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1758', N'全展式抽屜設計，收納、取用物品一目了然')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1759', N'滑軌載重30KG、耐用度通過6萬次以上之重覆測試，經久耐用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1760', N'奧地利BLUM電動緩衝抽屜系統，輕壓及拉動門板即電動開啟、輕推靜音緩衝閉合')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1761', N'具倚靠安全保護，安全靈敏，一碰到障礙物立即停止')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1762', N'滑軌載重30KG，經久耐用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1763', N'櫻花獨家採用德國GRASS靜音緩衝滑軌結構，具優異穩定性和順暢度')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1764', N'不鏽鋼鍍鉻籃架、隔瓶棒，可依需求調整及配置')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1765', N'鈦銀色粉體塗裝滑軌蓋設計，具SAKURA logo沖印，可防水、防塵，質感佳')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1766', N'最適收納各式調味料、調味瓶，烹飪煮食方便順手')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1767', N'德國Kesseböhmer進口清潔圍籃五金，配置全展式靜音緩衝滑軌，輕鬆開啟、靜音閉合')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1768', N'具可活動式提籃收納設計，可依需求提取移動')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1769', N'雙層表面處理銀色塗裝籃架、骨架，質感細節、精巧別緻')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1770', N'簡約俐落鋁合金溝槽，按裝於廚櫃下，不破壞牆面；橫向線條、美觀性佳，適吊掛式收納')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1771', N'獨家專屬規格尺寸，掛件相容性高、選擇多樣化，各式調味料、調理工具可快速上手、取用便利')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1772', N'專屬S鉤掛件，不易掉落，可依需求調整吊掛位置')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1773', N'已預留鑽孔孔位者，便利按裝及施作')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1774', N'德國Kesseböhmer進口掛件組，不鏽鋼拉絲表面處理、精緻簡約橫向線條設計，精品質感')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1775', N'豐富多樣掛件，可依需求選擇配置，收納取物超順手、備料烹飪有效率')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1776', N'簡約不鏽鋼橫桿掛件組按裝於黃金地段，各式調理器具、調味料可快速上手、取用便利')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1777', N'豐富多樣掛件，可依需求選擇配置，收納取物超順手，備料烹飪有效率')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1779', N'上層ABS活動式分隔收納盒(含附蓋調味粉盒)，可置入洗碗機洗滌，適收納調味料/瓶、調理器具等')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1782', N'兼備收納儲物及延伸檯面機能，有限空間一次滿足')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1783', N'30kg載重延伸檯面設計，操作簡便，備料及操作空間靈巧運用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1784', N'義大利ATIM進口摺桌五金 (載重60kg)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1785', N'操作便利，拉出檯面可作為備餐空間、便餐台、餐桌')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1786', N'有限空間內，聰明整合多工機能，發揮最大坪效')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1787', N'收納籃採ABS材質底座，易清潔、耐腐蝕')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1788', N'進口二階式矮梯，可摺疊收納於踢腳板空間中，靈活運用、不佔空間')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1789', N'大面積波浪設計金屬防滑踏板、150kg載重限制，好踩好安心')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1790', N'開放式層架收納，ㄧ眼就可看到置放的物品，隨拿即用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1791', N'可降低空間壓迫感，更兼具展示效果')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1792', N'標配可調式進口支撐架五金，安全質優、承載性佳')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1793', N'創新高階靜音緩衝滑軌:開啟時更輕柔滑順、閉合時更安靜緩衝無噪音，作動出色')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1794', N'鈦銀方型外觀設計、一體成型無縫抽牆:精品工藝、現代簡約，門板穩定度再提升')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1795', N'垂直抽牆及低機構寬度，創造最大空間利用率: 空間利用率+11%')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1796', N'金屬及實木質感精緻抽屜收納配件:分類分隔、簡潔俐落')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1797', N'抽屜滑軌可共用及單訂按壓式開啟機構:靈活配置、精準作動')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1798', N'全展式抽屜設計：收納、取用物品一目了然')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1799', N'滑軌載重40KG、耐用度通過8萬次重覆測試：經久耐用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1800', N'最適小空間配置使用，可移動、可收合、可展開(半展/全展)，三種型態變化、彈性空間運用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1801', N'圓角桌板配置進口平台鉸鍊及進口上掀撐桿五金、磁吸檔點設計，無斷差、不夾手，簡易操作輕鬆上手')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1802', N'穩固耐重結構、兩側具按壓門開收納儲物機能，滿足多元機能需求')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1803', N'可配合整體居家風格設計，自由搭配櫃體花色')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1804', N'德國GRASS進口創新靜音緩衝滑軌，開啟時更輕柔滑順、閉合時更安靜緩衝無噪音，作動出色')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1805', N'一體成型「稜線語彙」造型抽牆，搭配金屬方型圍桿結構設計及鈦銀色粉體塗裝，呈現現代簡約線條、光影交織美感')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1806', N'垂直抽牆及低機構寬度，創造最大空間利用率(空間利用率+11%)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1807', N'滑軌載重40KG、耐用度通過8萬次以上之重覆測試，經久耐用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1808', N'抽屜滑軌可共用及單訂按壓式開啟機構，靈活配置、精準作動')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1809', N'可選配金屬及實木質感精緻抽屜收納配件，分類分隔、簡潔俐落')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1810', N'收納矮梯專利結構設計，可與系統廚櫃完美結合')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1811', N'輕巧摺疊、全隱式收納，便利操作、不影響空間動線')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1812', N'山毛櫸及胡桃木色實木矮梯，溫潤質感、穩固堅實(耐重80kg)；可依使用需求，左/右側展開配置')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1813', N'全平面不鏽鋼底板籃架，具SAKURA logo沖印，好置放、易清潔')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1814', N'瑞士PEKA進口側拉籃五金')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1815', N'新一代盤籃設計─ 現代簡約式樣，提升空間利用率；碳灰燦光塗裝技術、細緻霧面原廠止滑墊，細節講究、質感升級')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1816', N'標配奧地利Blum座式緩衝滑軌，斜對角平衡結構，30kg高載重、穩固性佳；兼顧美型外觀設計、左/右收納操作皆順手')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1818', N'可依需求選配天然橡木飾條，妝點收納空間溫潤質調；選配隔瓶架和磁吸分隔片，有效收納、便利拿取')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1819', N'可配合無把手設計，選配按壓開啟機構，按壓門板即可開啟 • 可依需求選配天然橡木飾條，妝點收納空間溫潤質調；選配隔瓶架和磁吸分隔片，有效收納、便利拿取')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1820', N'鈦銀色粉體塗裝籃架，耐候性佳，不氧化、不刮手、易清潔')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1821', N'最適收納各式鍋具，經久耐用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1822', N'不鏽鋼鍍鉻籃架，最適收納各式鍋具、經久耐用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1823', N'採用三節式緩衝鋼珠滑軌，順暢開關、輕鬆操作')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1824', N'全展式圍籃設計，收納、取用物品一目了然')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1825', N'最適收納各式乾貨食糧，經久耐用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1826', N'瑞士PEKA進口多功能收納盤籃式拉籃五金')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1827', N'座式緩衝滑軌結構設計，全展開啟、緩衝閉合，左/右收納操作皆順手')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1828', N'可集合烹調常用物品於一櫃，分門別類、一應俱全，料理更方便；上層ABS活動式分')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1830', N'下層T1.5mm一體成型盤籃，無焊點、好置放、易清潔，收納空間極大化')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1831', N'瑞士PEKA進口盤籃式分類緩衝垃圾桶五金')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1832', N'兼具美型及實用分類垃圾收納設計─上層具可抽拉盤籃式淺置物盤；下層配置可活動式大垃圾桶(40L)、手提含蓋垃圾桶(6L)、分類收納盒(1.2L)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1833', N'滾輪軌道結構設計，全展開啟、緩衝閉合，左/右收納操作皆順手')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1834', N'具障礙物偵測安全裝置、鋁質金屬檔板設計，操作使用更安心')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1835', N'德國HAFELE進口五金，上掀開啟設計櫃內空間，收納、取用物品一目了然')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1836', N'完美配重及支撐平衡調整下，門板開啟可隨意停')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1837', N'配置緩衝機制，門板關閉時的重力下依然輕柔無聲')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1838', N'瑞士PEKA進口多功能儲物盤籃高櫃五金')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1839', N'新一代盤籃設計–現代簡約式樣，提升空間利用率；碳灰燦光塗裝技術、細緻霧面止滑墊，細節講究、質感提升')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1840', N'連動式結構設計，門片開啟時，盤籃同步伸出，便利拿取及收納存放；具小掛籃設計，配置於門片上，增加小物分類收納機能(限櫃寬W60cm者)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1841', N'T1.5mm一體成型盤籃，無焊點、好置放、易清潔，分層收納、空間極大化')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1842', N'可依需求選配天然橡木飾條，妝點收納空間溫潤木質調；選配磁吸分隔片，有效收納、便利拿取')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1843', N'在兼具美學與人體工學考量下，以系統化、標準化量身打造嵌入式電器高櫃')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1844', N'櫃體後預留105mm專屬散熱對流空間，讓電器運作穩定、順暢')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1845', N'可調式固隔支撐器滿足不同電器嵌入高度的需求，完美呈現對線美學')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1846', N'在兼具美學與人體工學考量下，以系統化、標準化量身打造平板抽電器高櫃，作為獨立式小家電收納規劃')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1847', N'全展式鋼珠滑軌平板抽設計，收納、取用小家電方便順手')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1848', N'客製化小家電收納空間，小家電不再無家可歸')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1849', N'在兼具美學與人體工學考量下，以系統化、標準化量身打造座式緩衝平板抽電器高櫃，作為獨立式家電收納規劃')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1850', N'全展式座式緩衝滑軌平板抽設計，收納、取用家電方便順手')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1851', N'全隱藏滑軌機構，與平板抽完美結合，創造收納空間最大化')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1852', N'連動式結構設計，門片開啟時，內掛籃同步伸出，便利拿取及收納存放')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1853', N'內外雙層掛籃搭配排孔化骨架，提供豐富多變排列，為廚房器具、乾貨等收納提供最佳的解決方案')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1854', N'內外掛籃標配止滑墊，提供收納物品好放、平穩、不滑移')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1855', N'全展式重型緩衝滾輪搭配掛籃及排孔化骨架，二側全開式掛籃讓收納、取用一目了然')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1856', N'掛籃搭配排孔化骨架，提供豐富多變排列，為廚房器具、乾貨等收納提供多元的解決方案')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1857', N'掛籃標配止滑墊，提供收納物品好放、平穩、不滑移')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1858', N'瑞士PEKA進口盤籃式拉籃高櫃五金')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1859', N'具雙向緩衝滑軌裝置，開啟省力、閉合柔靜，收納物品不易傾倒')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1860', N'可依需求選配天然橡木飾條，妝點收納空間溫潤木質調；選配隔瓶架、磁吸分隔片，有效收納、便利拿取')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1861', N'最適收納各式食材乾貨，收納取用，一目了然')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1862', N'連動式結構設計，門片開啟時，內掛籃同步伸出，便利拿物及收納存放')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1863', N'外內雙層掛籃搭配排孔化骨架，提供豐富多變排列，為廚房器具、乾貨等收納提供最佳解決方案')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1864', N'德國進口KNOKE鋁質捲門，開啟時輕柔滑順，作動平穩出色')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1865', N'適合將廚房各式小家電、細瑣物品收納在捲門後，讓廚房保持整潔')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1866', N'含LED鋁條嵌燈')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1867', N'厚實鋁框結構結合進口天地鉸鍊設計及獨家專利鉸鍊座，堅實穩固不易變形、精品質感外觀，鉸鍊配置不外露')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1868', N'高櫃門框配置一體成型垂直 L 型把手，外觀線條簡潔俐落；鋁合金材質、粉體塗裝表面處理，耐候性佳、不生鏽、不氧化、好清潔')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1869', N'垂直配置進口LED鋁條嵌燈，無斷光、無光點，增添空間氛圍質感')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1870', N'標配進口快扣式玻璃隔板扣夾，精緻質感、安全穩固')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1871', N'高櫃標配GRASS SCALA靜音緩衝按壓抽屜，增加隱藏式收納機能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1872', N'茶色強化玻璃設計，美觀性佳、安全性高')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1873', N'門框配置一體成型垂直 L 型把手，外觀線條簡潔俐落；鋁合金材質、粉體塗裝表面處理，耐候性佳、不生鏽、不氧化、好清潔')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1874', N'門框配置隱藏嵌入式按壓器，外觀線條簡潔俐落；鋁合金材質、粉體塗裝表面處理，耐候性佳、不生鏽、不氧化、好清潔')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1875', N'5MM茶色強化玻璃設計，美觀性佳、安全性高')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1876', N'進口LED嵌入式鋁條嵌燈，3000mm長度內可依需求跨櫃配置於廚下或櫃內')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1877', N'4000K色溫搭配白色霧面柔光片，無斷光、無光點LED、光線更均勻')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1878', N'高效率電路規格配置，穩定性高、安全性佳')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1879', N'可依需求配置手掃感應式調光器，操作使用更便利')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1880', N'櫃內配置2小3高德國GRASS SCALA 靜音緩衝抽屜，分層收納')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1881', N'可依需求垂直配置進口LED 鋁條嵌燈、門開感應開關，便利櫃內照明')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1882', N'創新高階靜音緩衝滑軌，開啟時更輕柔滑順、閉合時更安靜緩衝無噪音，作動出色')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1883', N'鈦銀方型外觀設計、一體成型無縫抽牆，精品工藝、現代簡約，門板穩定度再提升')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1884', N'40KG高載重滑軌，全展式抽屜物品一目了然，拿取容易多功能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1885', N'雙開門設計的超大儲物空間，具門後式掛籃及旋轉式層架，可分層分類收納，輕鬆拿取')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1886', N'外一內二的多層掛籃搭配排孔化骨架，提供豐富多變排列，為廚房器具、乾貨等收納提供最佳的解決方案')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1887', N'含鋁質燈槽 _光罩')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1888', N'以廚房家俱化為概念，延伸設計獨立式餐櫃、活動式推車讓風格延伸至客餐廳，同時也增添空間及使用動線的靈活性')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1889', N'搭配個性粗獷灰調木裂紋門板、清水混凝土門板，體現時尚工業風黑色鋁方管塑造十足工業風氛圍')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1890', N'獷味材質魅力再現，以深色金屬元件打造開放式層架創造通透空間感')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1891', N'黑色鋁方管搭配加厚飾板中島掛架，塑造十足工業風氛圍')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1892', N'加厚飾板上方的圍桿配置，優化掛架收納置物機能')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1893', N'高低層次掛架設計，更符合物品收納及使用頻次、和人體工學需求')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1894', N'可調光式LED嵌燈，觸控無段調整照明強弱變化，滿足不同使用需求及空間氛圍')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1895', N'IP44防塵防水等級LED照明，高效節能、持久耐用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1896', N'圓形黑色塗裝邊框，最適搭配工業風格；霧面柔光片，光線更均勻')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1897', N'進口重型旋轉桌五金組，80kg高載重、操作簡易')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1898', N'適合規劃餐檯設計，創意巧思、靈活空間運用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1899', N'櫻花獨家開發巧易鉤光源掛件組，結合LED照明和吊掛式收納機能，可按裝於廚櫃下，不破壞牆面')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1900', N'橫向線條、美觀性佳，豐富多樣掛件，可依需求選擇配置，收納取物超順手、備料烹飪有效率')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1901', N'霧黑質感黃金地段掛件組，可依餐廚風格選擇配置，兼顧美型與實用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1902', N'簡約俐落鋁合金溝槽、陽極霧黑表面處理，通過72小時鹽霧測試，耐候性佳、經久耐用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1903', N'已預留鑽孔孔位，便利按裝及施作於廚櫃下，不破壞牆面')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1904', N'豐富多樣掛件，可依需求選擇配置，收納取物超順手、備料烹調有效率')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1905', N'義大利VOLPATO鋁層架組，簡約而現代的外觀設計，線條流暢、細節考究，獨具時尚魅力、提升空間美感')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1906', N'模組化及多樣化組合配置，能靈活應用滿足不同收納及空間需求')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1907', N'優質鋁合金材質選用、霧黑陽極表面處理，通過鹽霧72小時測試，經久耐用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1908', N'奧地利原裝靜音緩衝滑軌，開啟時輕柔滑順、閉合時安靜緩衝無噪音，作動平穩出色')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1909', N'美型木抽外觀設計，通風收納，不悶臭、潮濕；適擺放鍋具、盤碟及不須冷藏根莖類蔬果')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1910', N'門板色木抽、搭配設計融為一體')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1911', N'全隱藏滑軌機構，完美結合木抽')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1912', N'全展開放式抽屜設計，收納、取用物品一目了然')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1913', N'滑軌載重30KG、經久耐用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1914', N'奧地利BLUM進口五金，斜掀開啟設計櫃內空間，收納、取用物品一目了然')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1916', N'僅適用儲熱式電熱水器機型使用')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1917', N'斯里蘭卡高級天然椰殼製成，吸附效果優')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1918', N'碳粉不會輕易流出，造成黑水的污染')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1919', N'銀添成分可抑制細菌滋長')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1921', N'Auto Open 自動開門(可關閉)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1922', N'熱烘存儲(4/24/72/168H)可單獨開啟')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1923', N'9段洗程(自動/經濟/衛生殺菌/精緻/90分鐘/58分鐘/快洗/預洗/機器自清)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1924', N'3種加強功能(加速洗淨/自動開門/上下層洗)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1925', N'最高溫度72度C')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1926', N'3組噴水臂/360度強力水柱')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1927', N'3層籃架')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1928', N'數位投影照地鐘')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1929', N'4種加強功能(加速洗淨／加強洗淨／自動開門／上下層洗)')
GO

INSERT INTO [sync].[BuyKitchenFeatures] ([id], [name]) VALUES (N'1930', N'9段洗程(自動／經濟／衛生殺菌／極靜／90分鐘／58分鐘／快洗／ 預洗／機器自清)')
GO

