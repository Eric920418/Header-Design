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

 Date: 11/02/2026 11:09:57
*/


-- ----------------------------
-- Table structure for DesignCloudCases
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[guest].[DesignCloudCases]') AND type IN ('U'))
	DROP TABLE [guest].[DesignCloudCases]
GO

CREATE TABLE [guest].[DesignCloudCases] (
  [id] varchar(80) COLLATE Chinese_Taiwan_Stroke_CI_AS  NOT NULL,
  [name] nvarchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS  NOT NULL,
  [exp] nvarchar(300) COLLATE Chinese_Taiwan_Stroke_CI_AS  NOT NULL,
  [isWebsite] bit  NOT NULL,
  [isBoard] bit  NOT NULL
)
GO

ALTER TABLE [guest].[DesignCloudCases] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of DesignCloudCases
-- ----------------------------
INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'01b7e776-fd6f-4ae5-9749-5cba23cf078a', N'巧域廚房', N'風格描述：金色陶瓷塗裝門板搭配帶有金色紋理的石紋門板，與居家設計調性融合，呈現出現代輕奢風格。
空間氛圍：電器玻璃高櫃不僅有收納與展示功能 ，櫃內LED燈更營造空間份圍，讓餐廚空間更具豐富變化。
功能感受：多功能的中島設計，平移式餐檯及升降式地櫃讓交流與生活更有樂趣。', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'01cd4a16-6c56-4af9-b8bf-f60a45b7296c', N'大廚廚房', N'風格描述:透過木質與米白色面的對比，塑造簡潔而有層次的現代空間表情；吧檯桌底條燈勾勒輪廓線條，成為空間視覺亮點。
空間配置:採用ㄇ型空間配置，三面櫃體環繞整合主要操作與收納機能，並於側邊配置吧檯桌，作為空間轉換與多功能使用的平台，兼顧動線銜接與互動需求。
功能感受:半崁式與抽拉式電器櫃讓料理不只是站在檯面，而是被一整個空間溫柔承接。', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'04e3c1cb-1398-4e8a-8a01-8341d6e1d41c', N'巧域廚房', N'風格描述：綠色陶瓷塗裝門板搭配帶有金色紋理的石紋門板，與居家設計調性融合，呈現出現代微奢風格。
空間氛圍：L型的廚具規劃，合理的動線配置讓備料及烹飪過程更得心應手。
功能感受：多樣化的吊、地櫃收納五金，提升料理效率享受更順暢的烹飪體驗。', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'0f74f82c-b1cd-49ad-aa9a-66f9421f7b88', N'巧域廚房', N'風格描述：淺色系的陶瓷塗裝門板搭配金色鋁框玻璃門吊櫃，低調中帶有微奢感。
空間氛圍 :ㄇ字半島型的廚具規劃，不僅有完整的收納空間，順暢的動線配置讓備料及烹飪過程更得心應手
功能感受 :半島式的規劃讓廚具空間更具開放感，且設置的平移餐檯讓交流與生活更有樂趣。', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'19b9deb8-3dbf-4511-99ff-93671c981b81', N'大廚廚房', N'風格描述:木質淡色系門板搭配黑色金屬系列廚電，呈現溫潤與俐落並存的現代風格，低彩度配色讓整體空間更顯明亮放大，同時兼具設計感與耐看度
空間配置:採用一字型空間配置，將烹飪、清洗與收納動線完整整合，搭配上下櫃齊平設計，使立面視覺更簡潔俐落。
功能感受:雙層電器高櫃可收納兩組大型嵌入式電器，讓廚房空間更整潔，同時滿足多元烹飪使用需求，兼顧實用機能與整體美感。', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'1b285159-1d13-422e-8ea3-caa87053b753', N'君璽廚房', N'風格描述:空間呈現現代簡約風格，強調流暢的線條、乾淨的平面和無雜物的空間感。設計以中性色調（包括灰色、白色和木質色調）為主，營造出寧靜且精緻的氛圍。
空間配置:空間採用開放式佈局，將廚房和飯廳融合在一起，促進家庭成員之間的互動。
配備一字型廚櫃和一個中島，提供充足的備餐和烹飪空間,高身櫃提供了大量的垂直儲物空間。
功能感受:搭配嵌入式電器，提升了烹飪效率。無把手櫃門設計使清潔更加方便。
', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'23abb27b-531d-4dd2-9476-a12847e6f410', N'臻美廚房', N'風格描述:這款設計以純白與淺灰為主色調，營造出明亮、乾淨的視覺基礎。
採用了細緻的「邊框造型門板」，帶有美式古典的靈魂，但線條極簡化，去除了繁複的雕花，展現出現代感。
空間配置:洗滌區（窗下）、烹飪區（長邊牆面）與中島備餐區形成了高效的作業三角動線，減少走動距離。多功能中島：中島不僅配備了副水槽方便清洗蔬果，更延長檯面轉化為「輕食吧檯」，是備餐台也是社交中心。
功能感受:廚房窗戶引入自然光，配合天花板的嵌入式照明與重點吊燈，確保了烹飪時的充足光線，同時營造出溫馨的居家氣氛。
強大收納力：從地櫃、吊櫃到整牆高櫃，解決了廚房雜物堆放的痛點。上層吊櫃直達天花板，消除了積灰塵的困擾。
', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'346a9a54-8afa-4561-9893-190c614f068b', N'闔樂廚房', N'風格描述:以大面積淺木紋櫃體搭配白色人造石檯面，營造乾淨、明亮且不冰冷的居家核心空間。整體線條俐落簡約，透過材質層次而非繁複裝飾，呈現耐看、耐用、耐住的現代生活感。
空間配置:ㄇ型動線包覆料理核心，搭配獨立中島配置，形成高效率且富有層次的廚房格局。
功能感受:整合嵌入式電器櫃、冰箱櫃、半嵌式洗碗機與捲門收納櫃，將設備與日常機能完整納入櫃體系統中，讓空間視覺維持一致、使用動線更加流暢。
', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'4ff93bd3-1eef-4bb6-b427-f5c70cfcccf3', N'大廚廚房', N'風格描述:木質淡色系與米白色的融合搭配，營造出溫柔明亮的居家氛圍，搭配簡約線條與低彩度材質，使空間視覺更顯清爽通透，展現自然且耐看的生活風格。
空間配置:採用一字型空間配置，搭配中島設計，延伸料理檯面與收納機能，同時串聯備餐、用餐與交流空間，讓廚房不再只是烹飪區，而是家庭互動的核心場域。
功能感受:...中島結合爐具與座位配置，提升烹飪效率並兼具輕食與聚會功能；搭配開放層架與充足收納櫃體，讓常用器皿隨手可得，整體使用上更流暢、生活感十足。', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'5ad40cff-4a8a-4917-b8e9-c480456444db', N'君璽廚房', N'風格描述:空間以現代簡約為基底，透過低彩度的霧面綠櫃體與溫潤木質元素，平衡冷靜與生活感。搭配前緣把手燈與石材檯面，形塑出低調而不張揚的都會質感。
空間配置:廚具型式以 L 型操作動線，水槽設置於臨窗側，使清洗與備餐區享有自然採光，提升使用舒適度。整體廚具線條簡潔俐落，搭配無把手設計與轉角櫃五金，呈現高度整合、現代感強烈的廚房系統。
功能感受:搭配崁入式電器櫃與前緣底板燈吊櫃，使整體空間更加高級感。', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'64d4f060-239e-4431-931e-9d643aee46ff', N'大廚廚房', N'風格描述:透過淺木質門板搭配局部深灰色做跳色設計，營造出沉穩又不失溫度的現代生活風格，藉由材質與色彩層次的對比，讓整體空間更具設計深度與質感。
空間配置:採用 L 型空間配置，搭配中央中島設計，將料理、備餐與收納機能完整串聯，同時保留順暢動線，讓多人同時使用廚房也不顯擁擠，適合重視機能與互動性的家庭。
功能感受:中島結合檯面延伸與開放式收納設計，可作為備餐、輕食或工作平台使用。搭配牆面層架與充足櫃體配置，讓常用器具一目了然。
', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'6945ac57-3522-46ef-982e-d07a9578f58e', N'童樂廚房', N'風格描述:莫蘭迪藍櫃體注入空間童趣與親和力，淺木紋吊地櫃平衡視覺重量，使整體風格在溫柔與機能之間取得和諧。
空間配置:一字型配置有效減少動線干擾，使空間視覺更為簡潔俐落，同時保留良好的通行與活動空間。
功能感受:搭配收納矮梯與電器櫃，除了讓拿取方便，更是提高收納效率。', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'7c016bf0-6327-47d3-b136-a18112934ee7', N'君璽廚房', N'風格描述:整體設計強調簡潔俐落的線條、開放式設計和功能性。色彩以中性色調為主，搭配深紅色系的廚具作為視覺焦點，展現低調而時尚的質感。
空間配置:大面積的窗戶帶來充足的自然採光，搭配高樓層的挑高設計，使空間感更加寬敞通透。深紅色與深色木紋的搭配營造出沉穩內斂的氛圍，而淺色地板和牆面則平衡了深色的厚重感，增添了精緻度。開放式的格局讓廚房、餐廳與客廳區域相連，促進了家庭成員之間的互動與交流。
功能感受:中島設計符合廚房的「工作三角動線」原則（冰箱、水槽、爐台），使備料、清洗和烹飪過程更為流暢高效。', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'8a3b6493-c2a9-47d4-bc0b-007331c6d6f9', N'童樂廚房', N'風格描述:以淺木色、白色、莫蘭迪藍作為整體風搭配，透過屋型門片的造型語彙，強化空間識別與童趣表現。
空間配置:ㄇ型配置串聯三面櫃體，有效整合收納機能，創造連續且完整的使用介面，提升空間利用效率。
功能感受:搭配折疊式桌面，側板掛勾，提高小空間利用性。', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'9dd35f53-312a-451d-b4ba-2703038dd030', N'巧域廚房', N'風格描述：深灰色陶瓷塗裝門板搭配金屬毛絲面門板，沉穩中帶有微奢感，呈現出現代微奢風格。
空間氛圍 :一字型的廚具規劃，極簡的動線配置讓備料及烹飪過程更得心應手。
功能感受 :側收式電器高櫃滿足小型電器的置放與收納，讓廚房空間更顯乾淨、整潔。', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'b44387d7-e7ce-433e-a527-7c19d5f45f7c', N'其他', N'風格描述：現代感的亮面門板及灰色調的壁飾板和檯面與鄉村風的框形木紋門板，透過不同風格、材質混搭，在現代簡約中又協調出溫馨、自然的調性。
空間氛圍 :紅色為廚房注入了熱情與個性，而灰色及木質元素則平衡了視覺，帶來時尚與溫馨感，豐富了空間層次感。
功能感受 : 俱複合功能的電器高櫃滿足了洗碗機及微波烤箱的設置需求，高櫃上方的收納空間。', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'bdbea9d4-9b81-4201-8e00-0232bb328a3c', N'童樂廚房', N'風格描述:融合北歐簡約線條與日系木質溫潤感，加入屋型元素及淺木紋搭配，呈現溫馨親子廚房空間。
空間配置:L型廚房搭配中島與餐椅配置，讓家人在料理時互動，提升使用情境。
功能感受:搭配Z字形與電器收納櫃讓日常使用更加順手，簡潔更有質感。', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'c7ea41d5-8905-443a-a920-76157baccc59', N'童樂廚房', N'風格描述:以屋型門片勾勒童年的想像，淺木色與灰白色加上粉色調交織溫柔日常。結合開放櫃與書報架設計，讓收納成為一場快樂的遊戲。
空間配置:採用一字型櫃體沿牆配置，搭配中央中島設計，形塑清楚的空間軸線，兼顧收納機能與活動彈性。
功能感受:搭配書報架、開放櫃讓廚房空間不只有單一而是多元化。', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'cb60d6f0-cf06-4b1d-9272-a1533924ed61', N'鄉村廚房', N'風格描述：自然、厚實的染色實木材質及明快色彩鋪陳和法國古典工藝曲線，呈現餐廚空間生活感的古樸氣息又細緻優雅的風情。
空間氛圍 :透明明亮的玻璃櫃，具備收納及展示機能，更凸顯出鄉村風的設計語彙。
功能感受 : 複合功能的開放式高櫃不僅讓多款小家電得到最佳的收置，上方搭配的鏤空造型格柵門亦讓需通風置放的食材有合適的存放空間。
', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'd608bbd3-31d0-4035-b210-334e9486bbb5', N'君璽廚房', N'風格描述:整體設計強調簡潔、俐落的線條，捨棄了繁複的裝飾，並大量使用中性色調如、白、灰。搭配淺色木紋和石材質感，平衡了灰色的冷冽感，增添了溫潤舒適的氛圍。設計中利用材質本身的紋理（來豐富空間層次，同時保持視覺上的整潔流暢。 
空間配置:空間採用開放式設計，將廚房、餐廳整合在同一個公共區域廚房以中島吧台作為與餐廳的區隔，確保了流暢的工作動線
功能感受:灰色調為空間帶來穩定與安定的感受,設計注重功能與實用性，簡潔的家具設計和合理的空間規劃提高了空間利用率。
透過不同色階的灰與材質搭配，呈現出低調而不單調、充滿品味的居家質感。 ', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'd60e24e3-9568-4613-89b8-931007f21e47', N'君璽廚房', N'風格描述:主要色調為深灰色、炭灰色和淺色木紋，營造出沉穩、時尚的氛圍。 質運用包括石紋檯面Fenix門板、金屬配件和木質飾面，展現精緻感 。
空間配置 :採用開放式設計，將廚房和用餐區域整合在同一個大空間內。廚房牆面和櫃體設計強調隱藏式收納，使空間保持簡潔俐落。
功能感受:空間設計強調實用性與效率，廚房動線流暢，方便備餐和烹飪,中島設計增加了額外的操作檯面和休閒用餐區，提升了空間的多元使用性,開放式設計促進了家庭成員或賓客之間的互動，無論是在烹飪區還是用餐區。', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'e206493f-4066-4133-9df7-b73264ecf135', N'巧域廚房', N'風格描述：金色陶瓷塗裝門板搭配帶有金色紋理的石紋門板，與居家設計調性融合，呈現出現代輕奢風格。
空間氛圍 :電器玻璃高櫃不僅有收納與展示功能 ，櫃內LED燈更營造空間份圍，讓餐廚空間更具豐富變化。
功能感受 :設置平移式餐檯的中島，滿足大工作檯面的需求外， 讓交流與生活更有樂趣。', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'ee5c91fe-f116-437a-ae82-03ae6b830b1b', N'大廚廚房', N'風格描述:透過木質與米白色面的對比，塑造簡潔而有層次的現代空間表情；隔板櫃、開放櫃與層架之交互運用，創造更加活潑之視覺效果。
空間配置:採用L型空間配置，動線通透流暢，適宜大家庭的烹飪互動。
功能感受:因應不同料理行為設計高低檯面，讓日常烹飪作業更加舒適順手。
', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'f1bbef0d-c747-4a06-9439-4dc058a3cb58', N'童樂廚房', N'風格描述:以淺木紋為主軸，搭配粉色開放櫃與地櫃形塑活潑基調。淺木紋吊櫃，營造輕盈且溫潤的視覺層次。
空間配置:L 型櫃體自然圍塑空間一隅，中島成為家庭互動與孩子參與的中心，讓烹飪、遊戲與陪伴同步發生。
功能感受:搭配下拉調味罐收納五金與崁入式電器櫃，讓料理流暢，生活不打結。', N'1', N'1')
GO

INSERT INTO [guest].[DesignCloudCases] ([id], [name], [exp], [isWebsite], [isBoard]) VALUES (N'f5f226da-8bb4-416e-a521-e21fa0d18bfc', N'潮派廚房', N'風格描述：裂木紋門板搭配水泥圖紋門板及壁飾板，讓廚房與整體空間在原始與溫暖中交融，呈現出明亮、簡約的工業風格。
空間氛圍 :ㄇ型半島式的廚房規劃讓空間應用更顯多樣化。延伸的餐檯區不僅是與親友一起備料的空間，亦是簡餐或工作的區域。
功能感受 :黑色鋁方管結構的櫃體設計不僅滿收納與展示機能，且讓空間風格更顯突出。', N'1', N'1')
GO
