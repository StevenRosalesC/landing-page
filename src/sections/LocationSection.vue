<script lang="ts" setup>
import { ref } from "vue";

let isOpen = ref(1);
</script>

<template>
    <!-- Questions Section Start -->
    <div id="location" class="mx-auto md:w-3/4 py-3">
        <section class="">
            <div class="">
                <h2 class="text-center font-semibold font-serif text-xl md:text-2xl">Ubicación</h2>
                <p class="text-center font-sans text-sm md:text-xl">La comuna Bambil Collao está ubicada en Sta. Elena - Parroquia Colonche</p>
            </div>

            <div class=" w-full lg:w-3/5">
            </div>
            <div class="mapa">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3987.4845036976058!2d-80.65723262576253!3d-1.9598173980224185!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x902dd00ad3b3106d%3A0x18ff9cc5561eac86!2sBambil%20Collao!5e0!3m2!1ses-419!2sec!4v1698342874224!5m2!1ses-419!2sec" width="800" height="600" style="border:0;"  loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </section>
    </div>
</template>
<style scoped>
/* hacer el mapa responsive */
.mapa {
    padding-bottom: 56.25%;
    height: 0;
    overflow: hidden;
    max-width: 100%;
}
</style>

