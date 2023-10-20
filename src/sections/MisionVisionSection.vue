<script lang="ts">
import { defineComponent, ref } from 'vue';
import  apiComuna from '../api/apiComuna'
import Information from '../interfaces/information';
export default defineComponent({
    setup() {
        const information = ref<Information[]>([]);
        const getInformation = async () => {
            await apiComuna.get('information')
                .then(response => {
                    console.log(response);

                    information.value = response.data.misionVision;
                })

                .catch(error => {
                    console.log(error);
                });
        }
        let isOpen = ref(1);
        getInformation();
        return {
            isOpen,
            information,

        }
    }
})

</script>

<template>
    <!-- Features Section Start -->
    <div id="comuna" class="mx-auto px-5 shadow-xl">
        <section class="py-16">
            <div class="w-4/5 md:w-3/5 mx-auto">
                <h2 class="text-3xl md:text-4xl font-semibold font-theme-heading text-center">Comuna</h2>
                <p class="text-theme-grayish-blue text-center mt-7 font-theme-content text-lg"> La comuna Bambil Collao se
                    caracteriza por su gente trabajadora y emprendedora, que se dedica a la agricultura, ganadería, comercio
                    y artesanía. </p>
            </div>

            <div class="mt-10">
                <ul class="flex flex-col items-center md:flex-row justify-center font-theme-heading">
                    <li v-for="(info, index) in information" :key="index"
                        :class="isOpen === index ? 'md:border-b-4 md:border-theme-secondary' : ''"
                        class="w-full md:w-56 cursor-pointer hover:text-theme-secondary transition duration-200 border-b-2 border-t-2 md:border-t-0 flex justify-center">
                        <a @click.prevent="isOpen = index" href="#"
                            :class="isOpen === index ? ' border-fourthColor font-bold' : ''"
                            class="py-5  md:border-b-0 border-b-4">{{ info.category === 'mision' ? 'Misión' : 'Visión' }}</a>
                    </li>
                </ul>
            </div>

            <div class="mt-16">
                <!-- Tab Content -->
                <template v-for="(info, index) in information" :key="index">
                    <div v-show="isOpen === index" class="grid  gap-32  md:grid-cols-2 lg:grid-cols-2 items-center">
                        <div class="relative">
                            <img class="z-10 w-full rounded" :src="info.id_image_image.imagen" />
                            <div
                                class="-z-10 bg-theme-primary h-52 w-96 sm:h-80 sm:w-full rounded-r-full absolute -left-56 -bottom-16">
                            </div>
                        </div>
                        <div>
                            <h3 class="font-theme-heading text-2xl md:text-3xl font-medium text-center lg:text-left">{{
                                info.category === 'mision' ? 'Misión' : 'Visión' }}</h3>
                            <p
                                class="mt-7 font-theme-content text-lg text-theme-grayish-blue text-left md:text-sm lg:text-left">
                                {{
                                    info.information }}</p>
                        </div>
                    </div>
                </template>
                <!-- Tab Content -->
            </div>
        </section>
    </div>
</template>
