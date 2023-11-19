<script lang="ts" setup>
import apiComuna from '../api/apiComuna';
import Information from '@/interfaces/information';
import { ref } from 'vue';

const info = ref<Information>();

const getInformation = async () => {
    await apiComuna.get('information/history')
        .then(response => {
            info.value = response.data.history;
        })

        .catch(error => {
            console.log(error);
        });
}
getInformation();




</script>

<template>
    <!-- Hero Section Start -->
    <div class=" shadow-xl mx-auto px-5 overflow-x-hidden lg:overflow-x-visible bg-green-50">
        <section class="flex flex-col gap-1 md:flex-row flex-wrap py-2">
            <div class="flex-1">
                <p class="text-2xl xl:text-3xl font-serif font-bold py-1  font-theme-heading text-center ">Comuna Bambil Collao</p>
                <p class="text-center text-xs md:text-left md:text-sm ">{{ info?.information }}</p>
                
            </div>
            <div class="flex-1">
                <img v-if="info?.id_image" class=" rounded shadow-md mx-auto " :src="info.id_image_image.imagen" alt=''/>
                <img v-else class="z-10 w-full rounded " src="../assets/comuna.jpg" alt=''/>

            </div>
        </section>
    </div>
    <!-- Hero Section End -->
</template>
