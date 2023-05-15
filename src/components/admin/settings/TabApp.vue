<template>
  <div class="p-fluid" style="width: 500px">
    <div class="field">
      <label for="admin-settings-app-name">Название сайта</label>
      <InputText
        id="admin-settings-app-name"
        :model-value="modelValue.name"
        :disabled="loading"
        placeholder="ИП Яровицына"
        @update:model-value="
          emit('update:modelValue', { ...modelValue, name: $event })
        "
      />
    </div>
    <div class="field">
      <label for="admin-settings-app-description">Описание</label>
      <Textarea
        id="admin-settings-app-description"
        :model-value="modelValue.description"
        :disabled="loading"
        :rows="4"
        :auto-resize="true"
        placeholder="Введите описание сайта"
        @update:model-value="
          emit('update:modelValue', { ...modelValue, description: $event })
        "
      />
    </div>
    <div class="field">
      <label for="admin-settings-app-keywords">Ключевые слова</label>
      <InputText
        id="admin-settings-app-keywords"
        :model-value="modelValue.keywords"
        :disabled="loading"
        placeholder="Ткани, Иваново, Купить ткани в Иваново"
        @update:model-value="
          emit('update:modelValue', { ...modelValue, keywords: $event })
        "
      />
    </div>
  </div>
</template>

<script setup lang="ts">
import { PropType } from "vue";
import type { Info } from "@/interfaces";

defineProps({
  modelValue: { type: Object as PropType<Info["app"]>, required: true },
  loading: { type: Boolean, default: false },
});
const emit = defineEmits(["update:modelValue"]);
</script>
