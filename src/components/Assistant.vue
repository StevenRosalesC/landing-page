<template>
    <div v-if="isVisible" class="fixed bottom-16 right-4 bg-white shadow-md p-4 rounded-lg">
        <!-- Contenido del asistente personal -->
        <div>
            <h2 class="text-lg font-semibold">Asistente Personal</h2>
            <!-- Aquí puedes agregar contenido, como respuestas a preguntas, sugerencias, etc. -->
        </div>
        <button @click="closeAssistant" class="mt-2 text-sm text-gray-600 hover:text-gray-800">Cerrar</button>
    </div>
</template>
  
<script lang="ts" setup>
import { ref } from 'vue';

const isVisible = ref(false);
const closeAssistant = () => {
    isVisible.value = false;
};
</script>
  
<style scoped>
/* Estilos para el asistente personal */
</style>
  