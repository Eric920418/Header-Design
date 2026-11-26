export const headingLabels = {
  englishLabel: '區塊英文標籤',
  englishLead: '主標題前置英文',
  chineseTitle: '區塊中文主標題',
  englishTitleFirst: '區塊英文主標題（第一段）',
  englishTitleSecond: '區塊英文主標題（第二段）',
}

const aliases = {
  區塊英文標題: '區塊英文主標題',
  選購指南英文標籤: headingLabels.englishLabel,
  選購指南中文標題: headingLabels.chineseTitle,
  英文標題第一段: headingLabels.englishTitleFirst,
  '英文標題第二段（金色）': headingLabels.englishTitleSecond,
  英文標題第三段: '區塊英文主標題（第三段）',
  '英文標題第四段（金色）': '區塊英文主標題（第四段）',
  '區塊中文主標題（第一行）': '區塊中文主標題（第一段）',
  '區塊中文主標題（第二行）': '區塊中文主標題（第二段）',
}

export const headingFieldLabel = label => aliases[label] || label
