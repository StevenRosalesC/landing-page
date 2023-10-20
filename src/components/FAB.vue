<template>
    <div class="fixed bottom-6 right-6">
        <button class="bg-blue-500 hover:bg-blue-600 text-white rounded-full p-4 shadow-lg" @click="handleClick">
            <i class="fas fa-plus"></i>
        </button>
    </div>
</template>
  
<script lang="ts" setup>
const handleClick = () => {
    console.log('FAB clicked');
};
</script>
  