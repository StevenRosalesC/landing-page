<template>
  <header
    class="flex top-0 sticky z-50 py-7 justify-between bg-green-700 mx-5 xs:mx-14 lg:!mx-auto lg:max-w-5xl"
  >
    <Logo />

    <nav class="justify-between self-center">
      <button
        @click="menuOpen = !menuOpen"
        class="md:hidden float-right cursor-pointer hover:opacity-60"
      >
        <Icon
          :icon="menuOpen ? 'ep:close-bold' : 'ep:menu'"
          class="text-3xl text-white mr-4"
          aria-label="menu mobile"
        />
      </button>

      <div :class="menuOpen ? 'flex' : 'hidden'" class="mr-4 md:flex">
        <ul
          class="flex flex-col transition ease-in-out  absolute md:!relative right-0 2xs:right-5 top-24 py-5 rounded-lg bg-white 
          md:bg-green-700 md:border-none md:shadow-none border shadow 
          text-titleColor text-center font-semibold md:flex-row md:top-0 
          md:!right-0 md:space-x-8  lg:space-x-10 md:py-0 max-w-[140px] md:max-w-full
          max-h-44
           "
        >
          <NavLink text="Comuna" link="#comuna" />
          <NavLink text="Noticias" link="#noticias" />
          <NavLink text="Localización" link="#location" />
          <NavLink text="Iniciar sesión" :blank="true" link="https://app-comuna-bc.netlify.app/" />
        </ul>
      </div>
    </nav>
  </header>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import Logo from '../atoms/Logo.vue'
import NavLink from '../atoms/NavLink.vue'
import { Icon } from '@iconify/vue'

export default defineComponent({
  components: {
    Logo,
    NavLink,
    Icon
  },
  data() {
    return {
      menuOpen: false
    }
  }
})
</script>
