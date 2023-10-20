import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue()],
  // definir el puerto
  server: {
    port: 3030,
  },
  preview: {
    port: 8080,
  },
})
