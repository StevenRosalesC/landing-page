<script lang="ts" setup>
import { ref } from 'vue';
import apiComuna from '../api/apiComuna';
interface Notice {
  id: number;
  title: string;
  subTitle: string;
  image: string;
}




interface Notices {
  id_notice: string;
  title: string;
  information: string;
  created_date: string;
  id_image: string;
  id_image_image: IDImageImage;
}

interface IDImageImage {
  id_image: string;
  imagen: string;
}

const listNotices = ref<Notices[]>([]);

const getNotices = async () => {
  await apiComuna.get('notices')
    .then(response => {
      listNotices.value = response.data.noticesList;

    })
    .catch(error => {
      console.log(error);
    });
}

getNotices();

const modalVisible = ref(false);
const titulo = ref('');
const subTitle = ref('');
const icon = ref('');
const truncateText = (text: string, maxLength = 255) => {
  if (text.length <= maxLength) {
    return text;
  } else {
    return text.slice(0, maxLength) + '...'; // Muestra solo los primeros maxLength caracteres y agrega "..."
  }
}


const abrirModal = (noticia: Notices) => {
  titulo.value = noticia.title;
  subTitle.value = noticia.information;
  icon.value = noticia.id_image_image.imagen;

  modalVisible.value = true;
}
const extractHashtags = (text: string) => {
  const regex = /#(\w+)/g;
  const hashtags = [];
  let match;

  while ((match = regex.exec(text))) {
    hashtags.push(match[0]);
  }

  return hashtags;
};


const cerrarModal = () => {
  modalVisible.value = false;
}
</script>

<template>
  <!-- Download Section Start -->
  <div id="noticias" class="shadow-xl px-5">
    <section class="py-6">
      <div class="w-4/5 md:w-3/5 mx-auto">
        <h2 class="text-2xl md:text-3xl font-theme-heading font-semibold text-center">Noticias</h2>
        <p class="text-theme-grayish-blue text-center text-md font-theme-content mt-7"> Mantente informado de las ultimas
          noticias de la comuna Bambil Collao. </p>
      </div>
      <hr class="border-gray-300 mt-8
      ">
      <div class="grid sm:grid-cols-2  md:grid-cols-2 lg:grid-cols-3 gap-8 mt-6">
        <div v-for="(notice, index) in listNotices" :key="index" class="shadow-lg  bg-slate-100 rounded-lg">
          <div class=" overflow-hidden  cursor-pointer mx-0 md:mx-3 sm:mx-2 lg:mx-1" @click="abrirModal(notice)">
            <img class="w-full max-h-40 rounded-lg py-2 " :src="notice.id_image_image.imagen" alt="Notice">
            <div class="px-6 py-4 border-none">
              <div class="font-bold text-xl mb-2 text-center">{{ notice.title }}</div>
              <!-- fecha de creacion de la noticia -->
              <p class="text-gray-700 text-base italic">
                {{ notice.created_date }}
              </p>
              <p class="text-gray-700 text-base italic">
                {{ truncateText(notice.information) }}
              </p>
            </div>
            <div class="px-6 pt-4 pb-2">
              <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2"
                v-if="extractHashtags(notice.information).length > 0"
                v-for="(hash, index) in extractHashtags(notice.information)" :key="index">{{ hash }}
              </span>

            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
  <div>
    <!-- Modal -->
    <div v-if="modalVisible" class="fixed inset-0 flex items-center justify-center z-50">
      <div class="modal-overlay fixed inset-0 bg-gray-800 opacity-50" @click="cerrarModal">
      </div>
      <div class="modal-container relative bg-white max-w-md rounded-lg shadow-lg p-8">
        <button @click="cerrarModal" class="absolute top-0 right-0 m-4 text-gray-500 hover:text-gray-800">
          <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
          </svg>
        </button>
        <h2 class="text-xl font-bold mb-4 text-center">{{ titulo }}</h2>
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