<template>
  <footer class="footer">
    <div class="footer__container container">
      <span class="footer__copyright">© {{ year }} ИП Яровицына Н.В.</span>
      <span class="footer__inn">ИНН: 373000173354</span>
      <span class="footer__ogrnip">ОГРНИП: 306370222300071</span>
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
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
  &__logo {
    margin: 0;
  }

  @media screen and (max-width: 767px) {
    &__container {
      width: 100%;
      flex-direction: column-reverse;
      gap: 5px;
    }
  }
}
</style>
