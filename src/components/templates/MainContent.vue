<template>
  <main class="mx-5 bg-fifthColor xs:mx-14 lg:!mx-auto lg:max-w-5xl">
    <MainSection />
    <MisionVisionSection />
    <NoticesSection />
    <FAB @click="isVisible = !isVisible" />
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
                      <svg class="h-6 w-6" width="45"  height="45" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><rect width="48" height="48" fill="white" fill-opacity="0.01"/>
                      <path d="M14 14L34 34" stroke="#333" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
                      <path d="M14 34L34 14" stroke="#333" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/></svg>
                      <!-- <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                        class="h-6 w-6">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9">
                        </path>
                      </svg> -->
                    </button>
                  </div>
                </div>
                <div
                  class="flex flex-col space-y-4 p-3 overflow-y-auto scrollbar-thumb-blue scrollbar-thumb-rounded scrollbar-track-blue-lighter scrollbar-w-2 scrolling-touch">
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
                    <img v-if="message.from === 'bot'" src="../../assets/chatBot.png" alt="Asistente"
                      class="w-6 h-6 rounded-full order-1">
                    <img v-else src="../../assets/user.png" alt="Usuario"
                    class="w-6 h-6 rounded-full order-1">
                  </div>
                </div>
                <div class="border-t-2 border-gray-200 px-4 pt-4 mb-2 sm:mb-0">
                  <div class="relative flex">
                    <input type="text" placeholder="Escribe un mensaje..." v-model="newMessage.text"
                      v-on:keyup.enter="sendMessage(newMessage.text)"
                      class="w-full text-xs focus:outline-none focus:placeholder-gray-400 text-gray-600 placeholder-gray-600 pl-2 bg-gray-200 rounded-md py-3 ">
                    <div class="absolute right-0 items-center inset-y-0  sm:flex">
                      <button type="button" @click="sendMessage(newMessage.text)"
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
import FAB from '../FAB.vue';
import { ref } from 'vue';
import apiComuna from '../../api/apiComuna';
const isVisible = ref(false);
interface Message {
  text: string;
  from: string;
  date: string
}

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
const sendMessage = async (text: string) => {

  if (text.trim() === '') return;
  newMessage.value.text = text;
  newMessage.value.from = 'user';
  newMessage.value.date = new Date().toLocaleString();
  messages.value.push(newMessage.value);
  await apiComuna.post("chatbot", {
    message: newMessage.value.text
  }).then((response) => {
    console.log(response);
    const messageBot = {
      text: response.data.response,
      from: 'bot',
      date: new Date().toLocaleString()
    };
    messages.value.push(messageBot);
    newMessage.value = {
      text: '',
      from: '',
      date: ''
    };
  }).catch((error) => {
    console.log(error);
  });


};


</script>
