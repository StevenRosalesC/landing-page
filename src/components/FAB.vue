<template>
    <div class="fixed bottom-6 right-6">
        <button class="bg-blue-500 hover:bg-blue-600 text-white rounded-full p-4 shadow-lg" @click="handleClick">
            <BotButtonIcon />
        </button>
    </div>
</template>
  
<script lang="ts" setup>
import BotButtonIcon from './icons/BotButtonIcon.vue';
const handleClick = () => {
    const messagesContainer = document.getElementById('messages-container');
    // scroll to bottom of messages container
    if (messagesContainer) {
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }
    const messageInput = document.getElementById('message-input');
    if (messageInput) {
        messageInput.focus();
    }
};
</script>
  