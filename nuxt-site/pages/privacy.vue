<script setup lang="ts">
const sections = [
  { title: '前言', paragraphs: ['台灣櫻花股份有限公司隱私權政策（下合稱「本政策」）保障及適用範圍包括您因使用台灣櫻花股份有限公司相關網站及產品等各項服務（下合稱「本服務」）時所提供的個人資料，也包括台灣櫻花股份有限公司因與商業夥伴合作或共享所取得的您的個人資料。本服務包含但不限於台灣櫻花股份有限公司官方網站、會員服務、線上購物、客服、社群網站及應用程式服務等。若您使用本服務，即表示您知悉並同意接受本政策包含但不限於同意台灣櫻花股份有限公司蒐集、處理及利用您的必要個人資料。若您不同意您的個人資料由台灣櫻花股份有限公司依本政策所述之方式蒐集、處理、利用時，請勿使用本服務。'] },
  { title: '隱私權保護政策的適用範圍', paragraphs: ['隱私權保護政策內容，包括本服務如何處理在您使用服務時收集到的個人識別資料。隱私權保護政策不適用於本服務以外的相關連結網站，也不適用於非本服務所委託或參與管理的人員。'] },
  { title: '個人資料的蒐集、處理及利用方式', items: ['當您造訪本服務或使用本服務所提供之功能服務時，我們將視該服務功能性質，請您提供必要的個人資料，並在該特定目的範圍內處理及利用您的個人資料；非經您書面同意，本服務不會將個人資料用於其他用途。', '本服務在您使用服務信箱、問卷調查等互動性功能時，會保留您所提供的姓名、電子郵件地址、聯絡方式及使用時間等。', '於一般瀏覽時，伺服器會自行記錄相關行徑，包括您使用連線設備的 IP 位址、使用時間、使用的瀏覽器、瀏覽及點選資料記錄等，做為我們增進本服務的參考依據，此記錄為內部應用，決不對外公佈。', '為提供精確的服務，我們會將收集的問卷調查內容進行統計與分析，分析結果之統計數據或說明文字呈現，除供內部研究外，我們會視需要公佈統計數據及說明文字，但不涉及特定個人之資料。'] },
  { title: '資料之保護', items: ['本服務主機均設有防火牆、防毒系統等相關的各項資訊安全設備及必要的安全防護措施，加以保護網站及您的個人資料採用嚴格的保護措施，只由經過授權的人員才能接觸您的個人資料，相關處理人員皆簽有保密合約，如有違反保密義務者，將會受到相關的法律處分。', '如因業務需要有必要委託其他單位提供服務時，本服務亦會嚴格要求其遵守保密義務，並且採取必要檢查程序以確定其將確實遵守。'] },
  { title: '網站對外的相關連結', paragraphs: ['本服務的網頁提供其他網站的網路連結，您也可經由本服務所提供的連結，點選進入其他網站。但該連結網站不適用本服務的隱私權保護政策，您必須參考該連結網站中的隱私權保護政策。'] },
  { title: '與第三人共用個人資料之政策', paragraphs: ['本服務絕不會提供、交換、出租或出售任何您的個人資料給其他個人、團體、私人企業或公務機關，但有法律依據或合約義務者，不在此限。前項但書之情形包括不限於：'], items: ['經由您書面同意。', '法律明文規定。', '為免除您生命、身體、自由或財產上之危險。', '與公務機關或學術研究機構合作，基於公共利益為統計或學術研究而有必要，且資料經過提供者處理或蒐集者依其揭露方式無從識別特定之當事人。', '當您使用本服務的行為，違反服務條款或可能損害或妨礙網站與其他使用者權益或導致任何人遭受損害時，經本服務管理單位研析揭露您的個人資料是為了辨識、聯絡或採取法律行動所必要者。', '有利於您的權益。', '本服務委託廠商協助蒐集、處理或利用您的個人資料時，將對委外廠商或個人善盡監督管理之責。'] },
  { title: 'Cookie 之使用', paragraphs: ['為了提供您最佳的服務，本服務會在您的電腦中放置並取用我們的 Cookie，若您不願接受 Cookie 的寫入，您可在您使用的瀏覽器功能項中設定隱私權等級為高，即可拒絕 Cookie 的寫入，但可能會導致網站某些功能無法正常執行。'] },
  { title: '隱私權保護政策之修正', paragraphs: ['本服務隱私權保護政策將因應需求隨時進行修正，修正後的條款將刊登於網站上。'] },
]
const numbers = ['一、', '二、', '三、', '四、', '五、', '六、', '七、', '八、']

useSeoMeta({ title: '隱私權政策｜SAKURA 整體廚房', description: '台灣櫻花股份有限公司隱私權政策。' })
</script>

<template>
  <main>
    <InternalPageHero title="隱私權政策" eyebrow="PRIVACY POLICY" />
    <div class="bg-[#F6F6F6] py-20 sm:py-24 lg:py-[120px]">
      <article class="internal-rail-safe mx-auto w-[calc(100%_-_30px)] max-w-[980px] rounded-[24px] bg-white p-6 shadow-sm sm:w-[calc(100%_-_60px)] sm:p-12 lg:p-16">
        <p class="border-b border-[#E3E3E8] pb-8 text-[#59585D]">台灣櫻花股份有限公司隱私權條款</p>
        <section v-for="(section, index) in sections" :key="section.title" class="mt-10" :aria-labelledby="`privacy-${index}`">
          <h2 :id="`privacy-${index}`" class="font-display text-2xl leading-8 text-[#1C1C1D]"><span class="mr-1 text-[#CAA05C]">{{ numbers[index] }}</span>{{ section.title }}</h2>
          <p v-for="paragraph in section.paragraphs || []" :key="paragraph" class="mt-4 text-[15px] leading-8 text-[#59585D]">{{ paragraph }}</p>
          <ul v-if="section.items" class="mt-4 space-y-3"><li v-for="item in section.items" :key="item" class="relative pl-6 text-[15px] leading-8 text-[#59585D]"><span class="absolute left-1 top-[13px] h-1.5 w-1.5 rounded-full bg-[#CAA05C]" />{{ item }}</li></ul>
        </section>
        <p class="mt-12 border-t border-[#E3E3E8] pt-8 text-sm leading-7 text-[#9F9FA4]">最後修訂日期：2025年3月4日<br />台灣櫻花股份有限公司</p>
      </article>
    </div>
  </main>
</template>
