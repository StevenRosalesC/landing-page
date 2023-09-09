<script lang="ts" setup>
import { ref } from 'vue';
interface Notice {
  id: number;
  title: string;
  subTitle: string;
  image: string;
}
const notices : Notice[] = [
    {
        id: 1,
        image: "images/notices/notice-1.jpg",
        title: "El cabildo comunal ",
        subTitle: "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
    {
        id: 2,
        image: "images/notices/notice-2.jpg",
        title: "El presidente de la comunidad ",
        subTitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
    {
        id: 3,
        image: "images/notices/notice-3.jpg",
        title: "Brigada de salud en la comunidad ",
        subTitle: "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
    {
        id: 4,
        image: "images/notices/notice-4.jpg",
        title: "Viaje de los adultos mayores a Baños termales de San Vicente",
        subTitle: "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
    {
        id: 5,
        image: "images/notices/notice-5.jpg",
        title: "Brigada de salud en la comunidad ",
        subTitle: "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
    {
        id: 6,
        image: "images/notices/notice-6.jpg",
        title: "Brigada de salud en la comunidad ",
        subTitle: "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
];


const modalVisible = ref(false);
const titulo = ref('');
const subTitle = ref('');
const icon = ref('');



const abrirModal = (noticia : Notice) => {
  titulo.value = noticia.title;
  subTitle.value = noticia.subTitle;
  icon.value = noticia.image;
  
  modalVisible.value = true;
}
const cerrarModal = () => {
  modalVisible.value = false;
}
</script>

<template>
  <!-- Download Section Start -->
  <div id="noticias" class="container mx-auto px-5 md:w-4/5">
    <section class="py-16 pt-18">
      <div class="w-4/5 md:w-3/5 mx-auto">
        <h2 class="text-3xl md:text-4xl font-theme-heading font-medium text-center">Noticias</h2>
        <p class="text-theme-grayish-blue text-center text-lg font-theme-content mt-7"> Mantente informado de las ultimas
          noticias de la comuna Bambil Collao. </p>
      </div>
      <div class="grid  md:grid-cols-2 lg:grid-cols-3 gap-8 mt-12">
        <div v-for="(notice, index) in notices" :key="notice.id"
          class="shadow-lg  bg-green-100 rounded-lg">
          <div class="flex justify-center mt-12 ">
            <img class="rounded" :src="notice.image" alt="Noticia" />
          </div>
          <h3 class="text-2xl font-theme-heading font-semibold text-center mt-6">{{ notice.title }}</h3>
          <p class="text-md font-theme-content text-theme-grayish-blue text-center mt-3">{{ notice.subTitle }}</p>
          <div class="my-7">
            <img class="w-full " src="../../assets/bg-dots.svg" alt="separator" />
          </div>
          <div class="flex justify-center mb-8">
            <button @click="abrirModal(notice)" class="bg-white border-solid border-black hover:bg-green-300 text-black font-bold py-2 px-4 rounded">
              Ver detalles
            </button>
          </div>
        </div>
      </div>
    </section>
  </div>
  <div>
    <!-- Modal -->
    <div v-if="modalVisible" class="fixed inset-0 flex items-center justify-center z-50">
      <div class="modal-overlay fixed inset-0 bg-gray-800 opacity-50">
      </div>
      <div class="modal-container relative bg-white rounded-lg shadow-lg p-8">
        <button @click="cerrarModal" class="absolute top-0 right-0 m-4 text-gray-500 hover:text-gray-800">
          <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
          </svg>
        </button>
        <h2 class="text-xl font-bold mb-4 text-center">{{ titulo}}</h2>
        <div class="flex justify-center">
          <img class="w-96 mt-4 mb-4" :src="icon" alt="">
        </div>
        <p class="text-gray-700">
          {{ subTitle }}
        </p>
      </div>
    </div>
    <!-- fin modal -->
  </div>
  <!-- Download Section End -->
</template>

<style scoped>
/* Estilos del modal */
.modal-overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: -1;
}

/* Estilos para oscurecer el fondo */
.modal-open {
  overflow: hidden;
}
</style>