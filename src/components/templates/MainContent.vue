<template>
  <main class="mx-5 bg-fifthColor xs:mx-14 lg:!mx-auto lg:max-w-5xl">
    <MainSection />
    <MisionVisionSection />
    <NoticesSection />
    <FAB @click="openChat" />
    <div>
      <div v-if="isVisible" class="fixed inset-0 flex items-center justify-center z-50">
        <div class="fixed inset-0 " @click="closeAssistant"></div>
        <div class="fixed bottom-4 right-4">
          <div class="bg-white shadow-md p-4 rounded-lg ">
            <div>
              <div class="flex-1  justify-between flex flex-col h-96 w-80">
                <div class="flex sm:items-center justify-between border-b-2 border-gray-200">
                  <div class="relative flex items-center">
                    <div class="flex flex-col leading-tight">
                      <div class="text-sm  mt-1 flex items-center">
                        <span class="text-gray-700 mr-3">Asistente personal</span>
                      </div>
                    </div>
                  </div>
                  <div class="flex items-center space-x-2">
                    <button type="button" @click="closeAssistant"
                      class="inline-flex items-center justify-center rounded-lg border transition duration-500 ease-in-out text-gray-500 hover:bg-gray-300 focus:outline-none">
                      <svg class="h-6 w-6" width="45" height="45" viewBox="0 0 48 48" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <rect width="48" height="48" fill="white" fill-opacity="0.01" />
                        <path d="M14 14L34 34" stroke="#333" stroke-width="3" stroke-linecap="round"
                          stroke-linejoin="round" />
                        <path d="M14 34L34 14" stroke="#333" stroke-width="3" stroke-linecap="round"
                          stroke-linejoin="round" />
                      </svg>
                    </button>
                  </div>
                </div>
                <div
                  class="flex flex-col space-y-4 p-3 overflow-y-auto scrollbar-thumb-blue scrollbar-thumb-rounded scrollbar-track-blue-lighter scrollbar-w-2 scrolling-touch"
                  id="messages-container">
                  <div v-for="(message, index) in messages" :key="index"
                    :class="message.from === 'bot' ? 'flex items-end' : 'flex items-end justify-end'">
                    <div
                      :class="message.from === 'bot' ? 'flex flex-col  text-xs max-w-xs mx-2 order-2 items-start' : 'flex flex-col space-y-2 text-xs max-w-xs mx-2 order-1 items-end'">
                      <div>
                        <span
                          :class="message.from === 'bot' ? 'px-2 py-2 rounded-lg inline-block rounded-bl-none bg-gray-300 text-gray-600' : 'px-4 py-2 rounded-lg inline-block rounded-br-none bg-blue-600 text-white '">
                          {{ message.text }}
                        </span>
                      </div>
                      <span class="text-xs" :class="message.from === 'bot' ? 'text-gray-600' : 'text-gray-400'">{{
                        message.date
                      }}</span>
                    </div>
                    <div v-if="message.from === 'bot'" class="w-6 h-6 rounded-full order-1">
                      <BotIcon />
                    </div>
                    <div v-else class="w-6 h-6 rounded-full order-1">
                      <UserIcon />
                    </div>
                  </div>
                  <!-- mensaje para la falificación -->
                  <div v-if="calificando" class="flex items-end">
                    <div class="flex flex-col  text-xs max-w-xs mx-2 order-2 items-start">
                      <div>
                        <div
                          class="px-2 py-2 rounded-lg inline-block rounded-bl-none bg-gray-300 text-gray-600">
                          <span class="font-bold">
                            Califica la atención del asistente virtual

                          </span>
                          <div @click="calificar(1)" class="flex items-center cursor-pointer hover:text-green-900  text-green-500">
                            <FaceHappyIcon  class="text-xl "/>
                            <span class="font-bold  ">Buena</span>
                          </div>
                          <div @click="calificar(2)" class="flex items-center cursor-pointer text-orange-300 hover:text-orange-900">
                            <FaceNeutralIcon  class=" text-xl "/>
                            <span class="font-bold ">Regular</span>
                          </div>
                          <div @click="calificar(3)" class="flex items-center cursor-pointer text-red-400 hover:text-red-900">
                            <FaceSadIcon  class="text-xl"/>
                            <span class="font-bold ">Mala</span>
                          </div>
                          <div @click="cancelCalificar">
                            <span  class="cursor-pointer text-gray-400 hover:text-gray-900"
                            >
                              En otro momento
                            </span>
                          </div>
                        </div>
                      </div>
                      <span class="text-xs text-gray-600">{{ new Date().toLocaleDateString() }}</span>
                    </div>
                    <div class="w-6 h-6 rounded-full order-1">
                      <BotIcon />
                    </div>

                  </div>
                </div>
                <div class="border-t-2 border-gray-200 px-4 pt-4 mb-2 sm:mb-0">
                  <div class="relative flex">
                    <input :disabled="isLoading || calificando" type="text" placeholder="Escribe un mensaje..."
                      v-model="newMessage.text" v-on:keyup.enter="sendMessage(newMessage.text)" @input="waitForMessage"
                      id="message-input"
                      class="w-full text-xs focus:outline-none focus:placeholder-gray-400 text-gray-600 placeholder-gray-600 pl-2 bg-gray-200 rounded-md py-3 ">
                    <div class="absolute right-0 items-center inset-y-0  sm:flex">
                      <button type="button" @click="sendMessage(newMessage.text)" :disabled="isLoading||calificando"
                        class="inline-flex items-center justify-center rounded-lg px-2 py-3 transition duration-500 ease-in-out text-white bg-blue-500 hover:bg-blue-400 focus:outline-none">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"
                          class="h-4 w-4 ml-2 transform rotate-90">
                          <path
                            d="M10.894 2.553a1 1 0 00-1.788 0l-7 14a1 1 0 001.169 1.409l5-1.429A1 1 0 009 15.571V11a1 1 0 112 0v4.571a1 1 0 00.725.962l5 1.428a1 1 0 001.17-1.408l-7-14z">
                          </path>
                        </svg>
                      </button>
                    </div>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
    </div>

    <LocationSection />


  </main>
</template>

<script setup lang="ts">
import NoticesSection from '../../sections/NoticesSection.vue'
import MisionVisionSection from '../../sections/MisionVisionSection.vue';
import LocationSection from '../../sections/LocationSection.vue';
import MainSection from '../../sections/MainSection.vue';
import BotIcon from '../icons/BotIcon.vue';
import UserIcon from '../icons/UserIcon.vue';
import FAB from '../FAB.vue';
import { ref } from 'vue';
import FaceHappyIcon from '../icons/FaceHappyIcon.vue';
import FaceNeutralIcon from '../icons/FaceNeutralIcon.vue'
import FaceSadIcon from '../icons/FaceSadIcon.vue'
import apiComuna from '../../api/apiComuna';
const isVisible = ref(false);
const isLoading = ref(false);
const timer = ref(1000)
interface Message {
  text: string;
  from: string;
  date: string
}

const calificando = ref(false);

const newMessage = ref<Message>({
  text: '',
  from: '',
  date: ''
});

const closeAssistant = () => {
  isVisible.value = false;

};
const messages = ref<Message[]>([
  {
    text: 'Hola, ¿en qué puedo ayudarte?',
    from: 'bot',
    date: new Date().toLocaleString()
  },
]);

const findMessagesSessionStorage = () => {
  // console.log('findMessagesSessionStorage');
  const messagesSessionStorage = sessionStorage.getItem('messages');
  const calificandoSessionStorage = sessionStorage.getItem('calificando');
  console.log(calificandoSessionStorage);
  if (calificandoSessionStorage) {
    calificando.value = calificandoSessionStorage === 'true'? true : false;
  }
  if (messagesSessionStorage) {
    messages.value = JSON.parse(messagesSessionStorage);
    // console.log(messages.value);
  }
};


const sendMessage = async (text: string) => {
  // almacenar los mensajes en session storage
  sessionStorage.setItem('messages', JSON.stringify(messages.value));
  isLoading.value = true;
  if (text.trim() === '') return;
  newMessage.value.text = text;
  newMessage.value.from = 'user';
  newMessage.value.date = new Date().toLocaleString();
  messages.value.push(newMessage.value);
  const messagesContainer = document.getElementById('messages-container');
  // scroll to bottom of messages container
  if (messagesContainer) {
    messagesContainer.scrollTop = messagesContainer.scrollHeight;
  }
  await apiComuna.post("chatbot/message-app", {
    message: newMessage.value.text
  }).then((response) => {
    const messageBot = {
      text: response.data.answer,
      from: 'bot',
      date: new Date().toLocaleString()
    };
    messages.value.push(messageBot);
    // almacenar los mensajes en session storage
    sessionStorage.setItem('messages', JSON.stringify(messages.value));
    // scroll to bottom of messages container

    newMessage.value = {
      text: '',
      from: '',
      date: ''
    };
    if (messagesContainer) {
      messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }
    waitForMessage()
    isLoading.value = false;

  }).catch((error) => {
    console.log(error);
    isLoading.value = false;

  }).finally(() => {
    if (messagesContainer) {
      messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }
    isLoading.value = false;
    const messageInput = document.getElementById('message-input');
    if (messageInput) {
      messageInput.focus();
    }
  })

};

const openChat = () => {
  isVisible.value = true;
  // console.log(isVisible.value);
  const messagesContainerChat = document.getElementById('messages-container');
  console.log(messagesContainerChat);
  // scroll to bottom of messages container
  if (messagesContainerChat) {
    console.log('scroll');
    messagesContainerChat.scrollTop = messagesContainerChat.scrollHeight;
  }
  if (messages.value.length > 1 && !calificando.value) {
    console.log('esperar');
    waitForMessage()
  }
  
};

const waitForMessage = () => {
  clearTimeout(timer.value)
  if (messages.value.length === 1) return
  timer.value = setTimeout(() => {
    calificando.value = true;
    sessionStorage.setItem('calificando', JSON.stringify(calificando.value));
    const messagesContainer = document.getElementById('messages-container');
    sessionStorage.setItem('messages', JSON.stringify(messages.value));
    if (messagesContainer) {
      messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }
  }, 10000)
};

const cancelCalificar =()=>{
  calificando.value = false;
  sessionStorage.setItem('calificando', JSON.stringify(calificando.value));
}

const calificar= async(cal:number)=>{
  console.log(cal);
  switch (cal) {
    case 1:
      await apiComuna.post("chatbot/calificar", {
        calificacion: 1
      }).then((response) => {
        console.log(response);
        calificando.value = false;
        sessionStorage.setItem('calificando', JSON.stringify(calificando.value));
      }).catch((error) => {
        console.log(error);
      }).finally(() => {
        const messagesContainer = document.getElementById('messages-container');
        if (messagesContainer) {
          messagesContainer.scrollTop = messagesContainer.scrollHeight;
        }
      })
      break;
    case 2:
      await apiComuna.post("chatbot/calificar", {
        calificacion: 2
      }).then((response) => {
        console.log(response);
        calificando.value = false;
        sessionStorage.setItem('calificando', JSON.stringify(calificando.value));
      }).catch((error) => {
        console.log(error);
      }).finally(() => {
        const messagesContainer = document.getElementById('messages-container');
        if (messagesContainer) {
          messagesContainer.scrollTop = messagesContainer.scrollHeight;
        }
      })
      break;
    case 3:
      await apiComuna.post("chatbot/calificar", {
        calificacion: 3
      }).then((response) => {
        console.log(response);
        calificando.value = false;
        sessionStorage.setItem('calificando', JSON.stringify(calificando.value));
      }).catch((error) => {
        console.log(error);
      }).finally(() => {
        const messagesContainer = document.getElementById('messages-container');
        if (messagesContainer) {
          messagesContainer.scrollTop = messagesContainer.scrollHeight;
        }
      })
      break;
    default:
      break;
  }


}


findMessagesSessionStorage();



</script>
<style scoped>
/* hacer el scrollbar de el container-messages mas delgado */
#messages-container::-webkit-scrollbar {
  width: 5px;
}
</style>
