<template>
  <div class="attribute-filter-range">
    <div
      class="attribute-filter-range__inputs"
      :class="{ 'p-disabled': attribute.min === attribute.max }"
    >
      <span>от</span>
      <InputNumber
        :model-value="modelValue[0]"
        :min="attribute.min"
        :max="attribute.max"
        input-class="w-5rem py-2 text-center"
        @update:model-value="
          emit('update:modelValue', { ...modelValue, [0]: $event })
        "
      />
      <span>до</span>
      <InputNumber
        :model-value="modelValue[1]"
        :min="attribute.min"
        :max="attribute.max"
        input-class="w-5rem py-2 text-center"
        @update:model-value="
          emit('update:modelValue', { ...modelValue, [1]: $event })
        "
      />
    </div>

    <Slider
      :model-value="modelValue"
      :min="attribute.min"
      :max="attribute.max"
      :disabled="attribute.min === attribute.max"
      range
      class="mx-2"
      @change="handleSlideStart"
      @slideend="handleSlideEnd"
      @update:model-value="emit('update:modelValue', $event)"
    />
  </div>
</template>

<script setup lang="ts">
import type { PropType } from "vue";
import type { AttributeFilter, AttributeFilterRangeValue } from "@/interfaces";

defineProps({
  modelValue: {
    type: Object as PropType<AttributeFilterRangeValue>,
    required: true,
  },
  attribute: { type: Object as PropType<AttributeFilter>, required: true },
  dragging: { type: Boolean, default: false },
});
const emit = defineEmits(["update:modelValue", "update:dragging", "change"]);

const handleSlideStart = () => {
  emit("update:dragging", true);
};
const handleSlideEnd = () => {
  emit("update:dragging", false);
  emit("change");
};
</script>

<style scoped lang="scss">
.attribute-filter-range {
  padding: 5px;
  max-height: 206px;
  &__inputs {
    display: flex;
    align-items: center;
    justify-content: space-around;
    margin-top: 7px;
    margin-bottom: 21px !important;
  }
}
</style>
