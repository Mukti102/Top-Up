import "./bootstrap";
import { createInertiaApp } from "@inertiajs/react";
import { createRoot } from "react-dom/client";
import "../css/app.css";
import Aos from "aos";
import "aos/dist/aos.css";

// ⬇️ Ini penting biar semua file masuk ke build
const pages = import.meta.glob("./Pages/**/*.jsx", { eager: true });

for (const path in pages) {
    const page = pages[path];
    if (page) console.log(`Preloaded: ${path}`);
}

const initialPage = JSON.parse(document.getElementById("app").dataset.page);
const themeColor = initialPage.props.Setting?.theme || "#fc5530";

console.log("PAGES LOADED:");
console.log(Object.keys(pages));

createInertiaApp({
    progress: {
        delay: 250,
        color: themeColor,
        includeCSS: true,
        showSpinner: false,
    },
    title: (title) => `${title}`,
    resolve: (name) => pages[`./Pages/${name}.jsx`],
    setup({ el, App, props }) {
        Aos.init({ duration: 1000, once: true, easing: "ease-in-out" });
        createRoot(el).render(<App {...props} />);
    },
});
