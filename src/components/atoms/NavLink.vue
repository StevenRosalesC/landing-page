<template>
  <a :href="link" target="_blank" rel="noopener noreferrer" v-if="blank">
    <li class="cursor-pointer text-green-600 italic block border  rounded md:shadow-md
      font-bold bg-white 
      hover:text-white hover:bg-blue-400 transition ease-in-out px-6 
      md:py-0 md:text-black md:bg-transparent 
      md:font-semibold md:hover:bg-transparent
      md:hover:text-white md:bg-white md:rounded md:px-2 
      md:hover:bg-green-600 md:hover:shadow-md md:hover:border-white md:hover:border-solid
      " :class="active && 'text-white' || 'text-titleColor'">
      {{ text }}
    </li>
  </a>
  <a :href="link" v-else>
    <li class="cursor-pointer text-white block 
      hover:border hover:border-slate-500
      md:hover:border-none
      py-2 md:hover:text-white  
      px-6 md:py-0 md:px-0" :class="active && 'text-white' || 'text-titleColor'">
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
