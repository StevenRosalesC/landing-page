<script lang="ts" setup>
import apiComuna from '../api/apiComuna';
import Information from '@/interfaces/information';
import { ref } from 'vue';

const info = ref<Information>();

const getInformation = async () => {
    await apiComuna.get('information/history')
        .then(response => {
            info.value = response.data.history;
            console.log(info.value);
        })

        .catch(error => {
            console.log(error);
        });
}
getInformation();




</script>

<template>
    <!-- Hero Section Start -->
    <div class=" shadow-xl mx-auto px-5 overflow-x-hidden lg:overflow-x-visible ">
        <section class="grid mr-6 grid-cols-none md:grid-cols-2 lg:grid-cols-2 pb-16 pt-8 items-center ">
            <div class="lg:w-5/6 order-2 lg:order-none">
                <p class="text-2xl  xl:text-3xl font-bold font-theme-heading text-center ">Comuna Bambil Collao</p>
                <p class=" lg:text-sm mt-2 font-theme-content text-theme-grayish-blue text-left ml-2 lg:text-left">{{ info?.information }}</p>
                
            </div>
            <div class="relative order-1 mt-20 lg:order-none mb-20 lg:mt-0 lg:mb-0 lg:-mr-10 ">
                <img v-if="info?.id_image" class="z-10 w-full rounded" :src="info.id_image_image.imagen" />
                <img v-else class="z-10 w-full rounded" src="../assets/comuna.jpg" />
                <div class="-z-10 bg-theme-primary h-52 w-full sm:h-80 sm:w-full rounded-l-full absolute -right-28 md:-right-48 -bottom-8"></div>
            </div>
        </section>
    </div>
    <!-- Hero Section End -->
</template>
