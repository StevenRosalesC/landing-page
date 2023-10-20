<template>
  <a :href="link" target="_blank" rel="noopener noreferrer" v-if="blank">
    <li
      class="cursor-pointer text-white block py-5 px-10 md:py-0 md:px-0 hover:opacity-70"
      :class="active && 'text-white' || 'text-titleColor'"
    >
      {{ text }}
    </li>
  </a>
  <a :href="link" v-else>
    <li
      class="cursor-pointer text-white block py-5 px-10 md:py-0 md:px-0 hover:opacity-70"
      :class="active && 'text-white' || 'text-titleColor'"
    >
      {{ text }}
    </li>
  </a>
</template>

<script lang="ts">
import { defineComponent } from 'vue'

export default defineComponent({
  props: {
    text: {
      type: String,
      required: true
    },
    link: {
      type: String,
      required: true
    },
    active: {
      type: Boolean,
      required: false
    },
    // tab blank
    blank: {
      type: Boolean,
      required: false,
      default: false
    }
  }
})
</script>
