<template>
  <footer class="footer">
    <div
      class="footer__container container flex align-items-center justify-content-between"
    >
      <div class="footer__copyright">© {{ year }} ИП Яровицына Н.В.</div>
      <div class="inn">ИНН: 373000173354</div>
      <div class="inn">ОГРНИП: 306370222300071</div>
    </div>
  </footer>
</template>

<script setup lang="ts">
const year = computed(() => new Date().getFullYear());
</script>

<style scoped lang="scss">
.footer {
  width: 100%;
  padding: 16px 0;
  color: white;
  background-color: var(--purple-800);

  &__container {
  }

  &__logo {
    margin: 0;
  }
}
</style>
