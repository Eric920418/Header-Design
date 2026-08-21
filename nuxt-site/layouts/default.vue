<template>
  <div id="top" class="min-h-screen bg-white">
    <SiteHeader />
    <div class="site-header-spacer" aria-hidden="true" />
    <div class="min-w-0"><slot /></div>
    <SiteFooter />
    <FloatingButtons />
  </div>
</template>
