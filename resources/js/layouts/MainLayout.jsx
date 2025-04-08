import React, { useEffect } from "react";
import Header from "../components/Header";
import Breadcrumb from "@/components/ui/Breadcrumb";
import { Head, usePage } from "@inertiajs/react";
import Footer from "@/components/ui/Footer";

export default function MainLayout({ children, items }) {
    const { Setting } = usePage().props; // Mengambil data user dari Inertia
    const title = Setting?.["seo.title"];
    const description = Setting?.["seo.description"];
    const keywords = Setting?.["seo.keywords"]?.join(",");
    const favicon = Setting?.["general.brand.favicon"];
    const logo = Setting["general.brand.logo"];
    // css variable diambil dari Setting
    const theme = Setting?.["theme"];
    const darkTheme = Setting?.["dark_theme"];

    useEffect(() => {
        if (theme) {
            // set var --color-primary
            document.documentElement.style.setProperty(
                "--color-primary",
                theme
            );
        }
    }, [theme]);

    useEffect(() => {
        document.documentElement.style.setProperty(
            "--color-secondary",
            darkTheme
        );
    }, [darkTheme]);

    return (
        <>
            <Head>
                <meta name="keywords" content={keywords} />
                <meta name="description" content={description} />
                <meta
                    name="theme-color"
                    content={Setting?.theme || "#fc5530"}
                />
                <link
                    rel="icon"
                    type="image/x-icon"
                    href={"/storage/" + favicon}
                />
            </Head>
            <div className="bg-slate-100 dark:bg-dark">
                <Header logo={logo} />
                <main className="">
                    {items && (
                        <div className="md:pt-24 pt-20  px-3 pb-6 md:px-10">
                            <Breadcrumb items={items} />
                        </div>
                    )}
                    {children}
                </main>
                <Footer logo={logo} />
            </div>
        </>
    );
}
