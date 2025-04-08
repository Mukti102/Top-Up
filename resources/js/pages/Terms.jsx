import MainLayout from "@/layouts/MainLayout";
import { usePage } from "@inertiajs/react";
import React from "react";

function Terms({ terms }) {
    const brand = usePage().props?.Setting?.["general.brand_name"];
    return (
        <div className="min-h-screen py-20 md:py-24 dark:bg-dark dark:text-white bg-white text-gray-800 p-2 md:p-5">
            <h1 className="text-center font-semibold text-lg md:text-xl">
                Syarat Dan Ketentuan {brand}
            </h1>
            <article
                className="prose prose-headings:font-bold mt-2 dark:text-gray-100 md:text-base text-sm md:px-4 py-2 text-gray-900 space-y-1"
                dangerouslySetInnerHTML={{ __html: terms?.value }}
            />
        </div>
    );
}

export default Terms;

Terms.layout = (page) => <MainLayout children={page} />;
