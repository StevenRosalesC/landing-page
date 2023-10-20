<template>
  <footer
    class="p-8 bg-primaryColor md:flex md:items-center md:justify-between lg:max-w-6xl lg:mx-auto lg:rounded-t-lg"
  >
    <p class="text-sm text-txtColor text-center lg:pl-2">
      © 2023 by Steven Rosales 

      <a href="https://github.com/StevenRosalesC" class="firstColorLink">Steven Rosales</a>.
    </p>

    <ul
      class="flex flex-wrap mx-2  justify-center text-sm text-txtColor mt-6 md:mt-0 lg:pr-2"
    >
      <li>
        <a href="#comuna" class="mr-6 md:mr-8 firstColorLink">Comuna</a>
      </li>
      <li>
        <a href="#noticias" class="mr-6 md:mr-8 firstColorLink">Noticias</a>
      </li>
      <li>
        <a href="#location" class="firstColorLink">Localización</a>
      </li>
    </ul>
  </footer>
</template>

<script lang="ts">
import { defineComponent } from 'vue'

export default defineComponent({})
</script>
