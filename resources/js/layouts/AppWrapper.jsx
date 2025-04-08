// AppWrapper.jsx
import { Head } from "@inertiajs/react";
import { usePage } from "@inertiajs/react";

export default function AppWrapper({ children }) {
    const { Setting } = usePage().props;
    const seoTitle = Setting?.["seo.title"] || "Default Title";
    const seoKeywords = Setting?.["seo.keywords"] || "default,keywords";
    const seoDescription =
        Setting?.["seo.description"] || "Default description";

    return (
        <>
            <Head>
                <title>{seoTitle}</title>
                <meta name="keywords" content={seoKeywords} />
                <meta name="description" content={seoDescription} />
            </Head>
            {children}
        </>
    );
}
