<template>
  <footer class="mx-5 flex bg-green-900 h-16 items-center xs:mx-14 lg:!mx-auto lg:max-w-5xl">
    <div class="flex-1">
      
      <p class="text-xs md:text-sm text-white">
        © 2023         
        <a href="https://github.com/StevenRosalesC" class="font-bold">Steven Rosales</a>.
      </p>

    </div>
    <div class="flex-1 flex">
      <div class="flex-1" v-for="(link,index) in links" :key="index">
        <a :href="link.url" class="text-xs md:text-sm font-semibold text-white">{{ link.name }}</a>
      </div>
    </div>
  </footer>
</template>

<script setup lang="ts">
import { ref } from 'vue';
const links = ref([
  {
    name: 'Comuna',
    url: '#comuna'
  },
  {
    name: 'Noticias',
    url: '#noticias'
  },
  {
    name: 'Localización',
    url: '#location'
  }
])
</script>
