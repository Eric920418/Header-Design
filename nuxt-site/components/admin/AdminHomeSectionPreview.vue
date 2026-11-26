<script setup lang="ts">
import {ArrowRight,MapPin} from 'lucide-vue-next'
import {HOME_GALLERY_ID,HOME_STORES_ID,homeRemainingHeading} from '~/shared/cms/home-headings.mjs'
const props=defineProps<{block:any;bodies:Record<string,any>;selected?:any;focusedField?:string}>()
const focus=(...paths:string[])=>paths.includes(props.focusedField||'')
const itemFocus=(path:string,key:string)=>focus(path+'.'+(props.selected?.index||0)+'.'+key)
const gallery=computed(()=>props.bodies[HOME_GALLERY_ID])
const galleryHeading=computed(()=>homeRemainingHeading(HOME_GALLERY_ID,gallery.value?.copy))
const galleryIndex=computed(()=>props.selected?.path==='cases'?props.selected.index:0)
const galleryCase=computed(()=>gallery.value?.cases?.[galleryIndex.value])
const galleryCards=computed(()=>[1,2].flatMap(offset=>{
 const rows=gallery.value?.cases||[]
 return rows.length?[rows[(galleryIndex.value+offset)%rows.length]]:[]
}))
const stores=computed(()=>props.bodies[HOME_STORES_ID])
const storeHeading=computed(()=>homeRemainingHeading(HOME_STORES_ID,stores.value?.copy))
const store=computed(()=>props.selected?.path==='stores'?props.selected.value:stores.value?.stores?.[0])
const styles=computed(()=>props.bodies['view-components-home-HomeStyleMarquee']?.styles||[])
const style=computed(()=>props.selected?.path==='styles'?props.selected.value:styles.value[0])
const logos=computed(()=>props.selected?.path==='logos'?[props.selected.value]:props.bodies['view-components-home-LogoMarquee']?.logos||[])
</script>
<template>
 <div class="cms-home-section-preview">
  <div class="cms-position-sitebar"><span>設計案例 · 廚房產品 · 門市與服務</span><img src="/home-2026/logos/sakura-kitchen-horizontal.svg" alt="SAKURA KITCHEN" /><span>品牌承諾 · 我要加盟</span></div>
  <section v-if="block.id==='home:設計案例'" class="cms-home-gallery" aria-label="設計案例的位置示意">
   <AdminThumbnail v-if="galleryCase" :src="galleryCase.image" :alt="galleryCase.store||galleryCase.title||'案例背景'" class="cms-home-gallery-background" :class="{'is-focused':itemFocus('cases','image')}" />
   <div class="cms-home-gallery-layout">
    <div class="cms-home-gallery-copy">
     <small :class="{'is-focused':focus('copy.text2')}">{{ gallery?.copy.text2 }}</small>
     <h3 :class="{'is-focused':focus('copy.text3')}">{{ gallery?.copy.text3 }}</h3>
     <strong :class="{'is-focused':focus('copy.englishTitleFirst')}">{{ galleryHeading.englishTitleFirst }}</strong>
     <strong :class="{'is-focused':focus('copy.englishTitleSecond')}">{{ galleryHeading.englishTitleSecond }}</strong>
     <span class="cms-button" :class="{'is-focused':focus('copy.text5','copy.field4')}">{{ gallery?.copy.text5 }} <ArrowRight :size="14" /></span>
    </div>
    <div class="cms-home-gallery-cards"><AdminThumbnail v-for="(card,index) in galleryCards" :key="index" :src="card.image" :alt="card.store||card.title||'案例圖片'" /></div>
   </div>
  </section>
  <section v-else-if="block.id==='home:全台門市據點'" class="cms-home-stores" aria-label="全台門市據點的位置示意">
   <header class="cms-home-store-heading">
    <small :class="{'is-focused':focus('copy.text1')}">{{ stores?.copy.text1 }}</small>
    <div>
     <small :class="{'is-focused':focus('copy.englishLead')}">{{ storeHeading.englishLead }}</small>
     <h3 :class="{'is-focused':focus('copy.text2')}">{{ stores?.copy.text2 }}</h3>
     <div class="cms-home-store-english"><span :class="{'is-focused':focus('copy.englishTitleFirst')}">{{ storeHeading.englishTitleFirst }}</span><span :class="{'is-focused':focus('copy.englishTitleSecond')}">{{ storeHeading.englishTitleSecond }}</span></div>
     <h3 :class="{'is-focused':focus('copy.text3')}">{{ stores?.copy.text3 }}</h3>
     <strong :class="{'is-focused':focus('copy.englishTitleThird')}">{{ storeHeading.englishTitleThird }}</strong>
    </div>
   </header>
   <div v-if="store" class="cms-home-store-layout">
    <div class="cms-home-store-map"><GoogleStoreMap :address="store.address" :name="store.name" :focus="Boolean(selected)" /></div>
    <div class="cms-home-store-information">
     <div class="cms-home-store-filters"><span :class="{'is-focused':focus('copy.text4')}">{{ stores?.copy.text4 }} <MapPin :size="12" /></span><span>{{ store.region }}</span><span>{{ store.city }}</span></div>
     <article><h4 :class="{'is-focused':itemFocus('stores','name')}">{{ store.name }}</h4><p :class="{'is-focused':itemFocus('stores','address')}">{{ store.address }}</p><p :class="{'is-focused':itemFocus('stores','phone')}">{{ store.phone }}</p></article>
     <p v-if="focus('copy.text5')" class="is-focused">{{ stores?.copy.text5 }}</p>
    </div>
   </div>
  </section>
  <section v-else-if="block.id==='home:設計風格'" class="cms-home-style-preview" aria-label="設計風格的位置示意">
   <div class="cms-home-style-strip"><div v-for="(item,index) in (selected?[style]:styles.slice(0,3))" :key="index"><AdminThumbnail :src="item.logo" :alt="item.zh+'圖示'" contain :class="{'is-focused':itemFocus('styles','logo')}" /><span><strong :class="{'is-focused':itemFocus('styles','zh')}">{{ item.zh }}</strong><small :class="{'is-focused':itemFocus('styles','en')}">{{ item.en }}</small></span></div></div>
   <figure v-if="style?.images?.length"><figcaption>滑過「{{ style.zh }}」時的圖片預覽</figcaption><div class="cms-home-style-images"><AdminThumbnail v-for="(src,index) in style.images" :key="index" :src="src" :alt="style.zh+'廚房照片'" /></div></figure>
  </section>
  <section v-else class="cms-home-logo-preview" aria-label="集團品牌標誌的位置示意"><AdminThumbnail v-for="(logo,index) in logos" :key="index" :src="logo.src" :alt="logo.name" contain :class="{'is-focused':itemFocus('logos','src')||itemFocus('logos','name')}" /></section>
 </div>
</template>
