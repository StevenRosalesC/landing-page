<script lang="ts" setup>
import { ref } from 'vue';
interface Info {
    id: number;
    name: string;
    details: {
        imageUrl: string;
        title: string;
        description: string;
        link: string;
    }
}


const visionMision = {
    'info': {
        id: 1,
        name: 'Visión',
        details:{
            imageUrl: "images/vision.jpg",
            title: 'Visión',
            description: 'Ser una empresa líder en el sector de la construcción, reconocida por su calidad, seguridad y cumplimiento, que busca satisfacer las necesidades de nuestros clientes, a través de un equipo humano comprometido y altamente calificado.',
            link: "#",
        }

    },
    'mision': {
        id: 2,
        name: 'Misión',
        details:{
            imageUrl: "images/mision.jpg",
            title: 'Misión',
            description: 'Somos una empresa dedicada a la construcción de obras civiles, con altos estándares de calidad, seguridad y cumplimiento, que busca satisfacer las necesidades de nuestros clientes, a través de un equipo humano comprometido y altamente calificado.',
            link: "#",
        }
    }
    
}
let isOpen = ref(1);

</script>

<template>
    <!-- Features Section Start -->
    <div id="comuna" class="container mx-auto px-5">
        <section class="py-16">
            <div class="w-4/5 md:w-3/5 mx-auto">
                <h2 class="text-3xl md:text-4xl font-semibold font-theme-heading text-center">Comuna</h2>
                <p class="text-theme-grayish-blue text-center mt-7 font-theme-content text-lg"> La comuna Bambil Collao se caracteriza por su gente trabajadora y emprendedora, que se dedica a la agricultura, ganadería, comercio y artesanía. </p>
            </div>

            <div class="mt-10">
                <ul class="flex flex-col items-center md:flex-row justify-center font-theme-heading">
                    <li v-for="info in visionMision" :key="info.id" :class="isOpen === info.id ? 'md:border-b-4 md:border-theme-secondary' : ''" class="w-full md:w-56 cursor-pointer hover:text-theme-secondary transition duration-200 border-b-2 border-t-2 md:border-t-0 flex justify-center">
                        <a @click.prevent="isOpen = info.id" href="#" :class="isOpen === info.id ? ' border-theme-secondary' : ''" class="py-5  md:border-b-0 border-b-4">{{ info.name }}</a>
                    </li>
                </ul>
            </div>

            <div class="mt-16">
                <!-- Tab Content -->
                <template v-for="info in visionMision" :key="info.id">
                    <div v-show="isOpen === info.id" class="grid gap-32 lg:grid-cols-2 items-center">
                        <div class="relative">
                            <img class="z-10 w-full" :src="info.details.imageUrl" />
                            <div class="-z-10 bg-theme-primary h-52 w-96 sm:h-80 sm:w-full rounded-r-full absolute -left-56 -bottom-16"></div>
                        </div>
                        <div>
                            <h3 class="font-theme-heading text-2xl md:text-3xl font-medium text-center lg:text-left">{{ info.details.title }}</h3>
                            <p class="mt-7 font-theme-content text-lg text-theme-grayish-blue text-center lg:text-left">{{ info.details.description }}</p>
                        </div>
                    </div>
                </template>
                <!-- Tab Content -->
            </div>
        </section>
    </div>
    <!-- Features Section End -->
</template>
