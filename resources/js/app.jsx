import "./bootstrap";
import { createInertiaApp } from "@inertiajs/react";
import { createRoot } from "react-dom/client";
import "../css/app.css";
import Aos from "aos";
import "aos/dist/aos.css";

createInertiaApp({
    title: (title) => `My App - ${title}`,
    resolve: (name) => {
        const pages = import.meta.glob("./Pages/**/*.jsx", { eager: true });
        return pages[`./Pages/${name}.jsx`];
    },
    setup({ el, App, props }) {
        Aos.init({
            duration: 1000, // Durasi animasi dalam milidetik
            once: true, // Animasi hanya berjalan sekali saat scroll
            easing: "ease-in-out", // Efek transisi
        });
        createRoot(el).render(<App {...props} />);
    },
});
