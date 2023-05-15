<template>
  <div class="catalog">
    <CatalogSidebar :products="products" />
    <CatalogProducts :products="products" />
  </div>
</template>

<script setup lang="ts">
import type { PropType } from "vue";
import type { Product } from "@/interfaces";

defineProps({
  products: { type: Array as PropType<Product[]>, required: true },
});
</script>

<style scoped>
.catalog {
  display: grid;
  grid-template-columns: 280px 1fr;
  align-items: start;
  gap: 20px;
  width: 100%;
}
</style>
