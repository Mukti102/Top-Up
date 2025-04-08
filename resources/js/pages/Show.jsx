import React, { useEffect, useRef, useState } from "react";
import MainLayout from "../layouts/MainLayout";
import BoxProduct from "../components/BoxProduct";
import CardHelp from "../components/CardHelp";
import CardBasket from "../components/CardBasket";
import QuantityBox from "../components/container/QuantityBox";
import BoxInputAkun from "../components/container/BoxInputAkun";
import BoxPackage from "../components/container/BoxPackage";
import BoxPayment from "../components/container/BoxPayment";
import useStore from "../store/AppStore";
import BoxPromo from "../components/container/BoxPromo";
import BoxContact from "../components/container/BoxContact";
import Items from "../components/Items";
import { Head } from "@inertiajs/react";
import CardBasketMobile from "./CardBasketMobile";

function Show(...props) {
    const [activeTab, setActiveTab] = useState("transaksi"); // Tambahkan state untuk tab
    const clean = useStore((state) => state?.clean);
    const acount = useStore((state) => state.acount);
    const basket = useStore((state) => state.basket);
    const contact = useStore((state) => state?.contact);
    const [isContactComplete, setIsContactComplete] = React.useState(true);
    const { BrandProduct, Setting, products, paymentMethods } = props[0];

    const sampul = Setting?.["background.show"];

    useEffect(() => {
        clean();
    }, []);

    const contactRef = useRef(null);

    useEffect(() => {
        if (!isContactComplete) {
            contactRef.current.scrollIntoView({
                behavior: "smooth",
                block: "start",
            });
        }
    }, [isContactComplete]);

    return (
        <>
            <Head>
                <title>{BrandProduct?.seo_title || BrandProduct?.name}</title>
                <meta
                    name="description"
                    content={BrandProduct?.seo_description || ""}
                />
            </Head>
            <div className="">
                <div className="">
                    {/* thumbnail */}
                    <div className="w-full   overflow-hidden h-[16rem]  md:h-[30rem]">
                        <img
                            className="w-full object-cover h-full"
                            src={
                                BrandProduct?.background_image
                                    ? `/storage/${BrandProduct?.background_image}`
                                    : `/storage/${sampul}`
                            }
                            alt=""
                        />
                    </div>
                    <div className="flex dark:bg-card   md:static relative  md:h-42 h-30 md:gap-10 gap-3 shadow-sm px-3 bg-white items-start md:items-center md:flex-row">
                        {/* Gambar */}
                        <div className="relative w-32 h-32 md:w-58  md:h-58 shadow-sm overflow-hidden rounded-2xl md:rounded-3xl bg-amber-400 -mt-13 md:mt-0 md:-top-20 md:-right-3">
                            <img
                                src={"/storage/" + BrandProduct?.image}
                                className="w-full h-full object-cover"
                                alt=""
                            />
                        </div>

                        {/* Nama dan Kategori + Items */}
                        <div className="flex  flex-col w-1/2 md:w-auto">
                            {/* Nama & Kategori */}
                            <div className="flex flex-row md:flex-col justify-start items-start gap-2 md:gap-2 mt-2 md:mt-0">
                                <div className="text-gray-800 dark:text-dark-text space-y-1 text-left">
                                    <h1 className="text-base md:text-2xl font-bold">
                                        {BrandProduct?.name}
                                    </h1>
                                    <p className="font-medium text-gray-500 text-[10px] md:text-base">
                                        {BrandProduct?.category?.name}
                                    </p>
                                </div>
                            </div>

                            {/* Items */}
                            <div className="mt-1">
                                <Items />
                            </div>
                        </div>
                    </div>

                    <div className="grid relative md:hidden mt-2 grid-cols-1 md:grid-cols-3 gap-5 dark:bg-dark  bg-gray-100 p-1.5  md:p-5">
                        <div className="">
                            {/* Navigasi Tab */}
                            <div className="grid grid-cols-2 gap-2 mb-4 shadow-sm dark:bg-card bg-white p-1 rounded-md">
                                <button
                                    onClick={() => setActiveTab("transaksi")}
                                    className={`btn rounded-md  btn-sm  border-none ${
                                        activeTab === "transaksi"
                                            ? "text-white dark:btn-secondary btn-primary shadow-sm border-b-2 border-primary"
                                            : "text-gray-500 dark:text-dark-text bg-transparent border-none shadow-none hover:text-gray-700"
                                    }`}
                                >
                                    Transaksi
                                </button>
                                <button
                                    onClick={() => setActiveTab("deskripsi")}
                                    className={`btn btn-sm rounded-md   border-none ${
                                        activeTab === "deskripsi"
                                            ? "text-white dark:btn-secondary btn-primary  shadow-sm border-b-2 border-primary"
                                            : "text-gray-500 dark:text-dark-text bg-transparent border-none shadow-none hover:text-gray-700"
                                    }`}
                                >
                                    Keterangan
                                </button>
                            </div>
                            {/* Konten Tab */}
                            {activeTab == "transaksi" ? (
                                <div className="space-y-5">
                                    <BoxPackage products={products} />
                                    <BoxInputAkun brand={BrandProduct} />
                                    <div hidden>
                                        <QuantityBox />
                                    </div>
                                    <BoxPromo />
                                    <div ref={contactRef}>
                                        <BoxContact />
                                    </div>
                                    <BoxPayment
                                        paymentMethods={paymentMethods}
                                        brand={BrandProduct}
                                    />
                                </div>
                            ) : (
                                <div className="rounded-lg">
                                    <BoxProduct number={"6"} title="Deskripsi">
                                        <article
                                            className="prose px-4 py-2 dark:text-dark-text text-gray-600 text-sm w-full space-y-1 prose:text-gray-600"
                                            dangerouslySetInnerHTML={{
                                                __html: BrandProduct?.description,
                                            }}
                                        />
                                    </BoxProduct>
                                </div>
                            )}
                        </div>
                    </div>

                    <div className="grid relative pb-20 grid-cols-1 md:grid-cols-3 gap-5 bg-gray-100 dark:bg-dark p-1.5 md:p-5">
                        <div className="col-span-2 hidden md:block space-y-4">
                            <BoxPackage products={products} />
                            <BoxInputAkun brand={BrandProduct} />
                            <div hidden>
                                <QuantityBox />
                            </div>
                            <BoxPromo />
                            <div ref={contactRef}>
                                <BoxContact />
                            </div>
                            <BoxPayment
                                paymentMethods={paymentMethods}
                                brand={BrandProduct}
                            />
                        </div>

                        {/* ✅ Bungkus sticky-nya dalam container pembatas */}
                        <div className="relative">
                            <div className="sticky top-24 w-full z-20">
                                <CardHelp />
                                <CardBasket brand={BrandProduct} />
                                <CardBasketMobile brand={BrandProduct} />
                            </div>
                        </div>

                        {/* Deskripsi sebagai akhir section */}
                        <div className="col-span-3 md:block hidden relative">
                            <BoxProduct number={"6"} title="Deskripsi">
                                <article
                                    className="prose px-4 py-2 text-gray-600 dark:text-dark-text text-sm w-full space-y-1 prose:text-gray-600"
                                    dangerouslySetInnerHTML={{
                                        __html: BrandProduct?.description,
                                    }}
                                />
                            </BoxProduct>
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
}

export default Show;

Show.layout = (page) => <MainLayout>{page}</MainLayout>;
