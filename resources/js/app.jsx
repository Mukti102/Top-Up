import "./bootstrap";
import { createInertiaApp } from "@inertiajs/react";
import { createRoot } from "react-dom/client";
import "../css/app.css";
import Aos from "aos";
import { usePage } from "@inertiajs/react";

import "aos/dist/aos.css";

// Ambil data halaman awal dari DOM
const initialPage = JSON.parse(document.getElementById("app").dataset.page);

// Dapatkan warna tema dari Setting di props awal
const themeColor = initialPage.props.Setting?.theme || "#fc5530";

createInertiaApp({
    progress: {
        delay: 250,
        color: themeColor || "#fc5530", // Default color, will be updated later if needed
        includeCSS: true,
        showSpinner: false,
    },
    title: (title) => `${title}`,
    resolve: (name) => {
        const pages = import.meta.glob("./Pages/**/*.jsx", { eager: true });
        return pages[`./Pages/${name}.jsx`];
    },
    setup({ el, App, props }) {
        const { Setting } = initialPage.props;
        const Title = Setting?.["seo.title"];
        const keywords = Setting?.["seo.keywords"];
        // Fungsi untuk mengambil warna tema dari Setting
        const getThemeColor = () => {
            return Setting?.["theme"] || "#fc5530"; // Mengambil warna dari Setting
        };
        // Update color di progress bar setelah theme color didapat
        const themeColor = getThemeColor(); // Dapatkan warna tema
        const progressSettings = {
            delay: 250,
            color: themeColor, // Gunakan warna tema yang diambil
            includeCSS: true,
            showSpinner: false,
        };

        // Update progress bar settings
        const { progress } = createInertiaApp({
            progress: progressSettings, // Update progress settings
            title: (title) => `${Title} | ${title}`,
            resolve: (name) => {
                const pages = import.meta.glob("./Pages/**/*.jsx", {
                    eager: true,
                });
                return pages[`./Pages/${name}.jsx`];
            },
            setup({ el, App, props }) {
                Aos.init({
                    duration: 1000, // Durasi animasi dalam milidetik
                    once: true, // Animasi hanya berjalan sekali saat scroll
                    easing: "ease-in-out", // Efek transisi
                });

                // Render aplikasi
                createRoot(el).render(<App {...props} />);
            },
        });
    },
});
