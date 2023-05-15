<template>
  <div class="catalog">
    <h2>Каталог</h2>
    <div class="catalog__categories">
      <UiCategoryCard
        v-for="category of categories"
        :key="category"
        :value="category"
      />
    </div>
  </div>
</template>

<script setup lang="ts">
import type { Ref } from "vue";
import type { Category } from "@/interfaces";

definePageMeta({
  name: "Каталог",
});

const categories: Ref<Category[]> = ref([]);

const { data } = await useFetch<Category[]>("/api/categories");
if (data.value) {
  categories.value = data.value;
}
</script>

<style scoped lang="scss">
.catalog {
  &__categories {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 15px;
    padding: 0 15px;
  }
}
</style>
