<template>
  <div class="min-h-full flex flex-column justify-content-between">
    <Header />
    <div class="container overflow-hidden">
      <slot />
    </div>
    <Footer />
  </div>
</template>

<script setup lang="ts">
const info = useInfo();

useServerSeoMeta({
  description: info.value.app.description,
  ogDescription: info.value.app.description,
});
useHead({
  titleTemplate: (title) => {
    if (title) return `${title} – ${info.value.app.name}`;
    else return info.value.app.name;
  },
});
</script>

<style scoped lang="scss"></style>
