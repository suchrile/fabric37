<template>
  <div></div>
</template>

<script setup lang="ts">
import type { Category } from "@/interfaces";

const { data } = await useFetch<Category[]>("/api/categories");
if (data.value) {
  const categories = data.value.sort((a, b) => a.name.localeCompare(b.name));
  navigateTo("/category/" + categories[0].slug);
}
</script>
