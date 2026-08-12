<template>
  <div id="top" class="min-h-screen bg-white">
    <SiteHeader />
    <div class="h-[60px]" aria-hidden="true" />
    <div class="min-w-0"><slot /></div>
    <SiteFooter />
    <FloatingButtons />
  </div>
</template>
