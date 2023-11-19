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
        <section class="py-4 md:py-5">
            <div class="md:w-4/5  mx-auto">
                <p class="text-center font-serif text-xl md:text-3xl">Comuna</p>
                <p class="text-center text-sm md:text-base md:text-left">
                    La comuna Bambil Collao se caracteriza por su gente trabajadora y emprendedora, 
                    que se dedica a la agricultura, ganadería, comercio y artesanía. 
                </p>
            </div>
            <div class="flex py-2">
                <div v-for="(info,index) in information" :key="index" class="flex-1 ">
                    <p class="text-center cursor-pointer text-base md:text-xl font-semibold hover:font-bold hover:text-theme-secondary" :class="isOpen === index ? 'border-b-4 border-green-200' : ''"
                    @click="isOpen= index">
                        {{ info.category === 'mision' ? 'Misión' : 'Visión'  }}
                    </p>

                </div>
            </div>

            <div class="py-2 md:py-4">
                <!-- Tab Content -->
                <template v-for="(info, index) in information" :key="index">
                    <div v-show="isOpen === index" class="flex flex-col-reverse gap-4 md:flex-row ">
                        <div class="flex-1">
                            <img class="w-full h-52 rounded object-cover" :src="info.id_image_image.imagen" />
                        </div>
                        <div class="flex-1">
                            <p class="text-xl md:text-2xl font-semibold font-serif text-center lg:text-left">{{
                                info.category === 'mision' ? 'Misión' : 'Visión' }}</p>
                            <p
                                class="mt-3 font-theme-content text-xs  text-theme-grayish-blue text-left md:text-base lg:text-left">
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
