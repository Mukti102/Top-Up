import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import tailwindcss from '@tailwindcss/vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
    plugins: [
        laravel({
            input: "resources/js/app.jsx",
            refresh: true,
        }),
        react(),
        tailwindcss(),
        
    ],
    // server: {
    //     host: '0.0.0.0',
    //     port: 5173,
    //     strictPort: true,
    //     hmr: {
    //         protocol: 'ws',
    //       host: '192.168.248.45', // ganti dengan IP address komputer kamu
    //       port: 5173,
    //     },
    //     cors: true, // <- ini penting untuk allow CORS
    //   },
});