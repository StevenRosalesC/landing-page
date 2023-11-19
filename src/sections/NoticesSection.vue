<script lang="ts" setup>
import { ref } from 'vue';
import { Transition } from 'vue';
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
  <div id="noticias" class="shadow-xl px-3">
    <section class="py-2">
      <div class="">
        <h2 class="font-serif text-xl md:text-2xl font-semibold text-center">Noticias</h2>
        <p class="text-center text-sm md:text-base"> Mantente informado de las ultimas
          noticias de la comuna Bambil Collao. </p>
      </div>
      <div class="grid sm:grid-cols-2 md:grid-cols-3 gap-8 mt-6">
        <div v-for="(notice, index) in listNotices" :key="index" class="shadow-lg  bg-slate-100 rounded-lg">
          <div class=" cursor-pointer" @click="abrirModal(notice)">
            <img class="w-full max-h-40 rounded-xl object-cover py-2 px-2  " :src="notice.id_image_image.imagen"
              alt="Notice">
            <div class="px-1 border-none">
              <div class="font-semibold text-sm md:text-base text-center">{{ notice.title }}</div>
              <!-- fecha de creacion de la noticia -->
              <p class="text-gray-700 text-xs">
                {{ notice.created_date }}
              </p>
              <p class="text-gray-700 text-xs md:text-sm italic">
                {{ truncateText(notice.information) }}
              </p>
            </div>
            <div class="px-1 flex flex-wrap">
              <span class="flex-1 bg-gray-200 rounded-full px-2 py-1 text-xs font-italic  text-gray-700 "
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
    <Transition name="bounce">

      <div v-if="modalVisible" class="fixed inset-0 flex items-center justify-center z-50">
        <div class="modal-overlay fixed inset-0 bg-gray-800 opacity-50" @click="cerrarModal">
        </div>
        <div class="modal-container relative  bg-white max-h-[90vh] max-w-md rounded-lg shadow-lg p-8">
          <button @click="cerrarModal" class="absolute top-0 right-0 m-4 text-gray-500 hover:text-gray-800">
            <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
            </svg>
          </button>
          <h2 class="text-xl font-bold mb-4 text-center">{{ titulo }}</h2>
          <div class="flex justify-center">
            <img class="w-96 mt-4 mb-4 object-cover max-h-64" :src="icon" alt="">
          </div>
          <div class="overflow-y-auto information max-h-64">
            <p class="text-gray-700">

              {{ subTitle }}
            </p>
          </div>
        </div>
      </div>
    </Transition>
    <!-- fin modal -->
  </div>
</template>

<style lang="css" scoped>
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
.information {
 white-space: pre-wrap;
  /* Ancho del scrollbar */
}

.information::-webkit-scrollbar {
  width: 8px;
  /* Ancho del scrollbar */
}

.information::-webkit-scrollbar-thumb {
  background-color: #4a5568;
  /* Color del scrollbar */
  border-radius: 4px;
  /* Radio de esquina del scrollbar thumb */
}

.information::-webkit-scrollbar-track {
  background-color: #cbd5e0;
  /* Color de fondo del scrollbar track */
  border-radius: 4px;
  /* Radio de esquina del scrollbar track */
}

.bounce-enter-active {
  animation: bounce-in 0.5s;
}

.bounce-leave-active {
  animation: bounce-in 0.5s reverse;
}

@keyframes bounce-in {
  0% {
    transform: scale(0);
  }

  50% {
    transform: scale(1.05);
  }

  100% {
    transform: scale(1);
  }
}</style>