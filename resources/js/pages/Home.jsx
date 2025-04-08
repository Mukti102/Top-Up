import React, { useEffect, useState } from "react";
import { IoIosSearch } from "react-icons/io";
import Header from "../components/Header";
import Hero from "../components/Hero";
import Recomended from "../components/Recomended";
import RecomendedCard from "../components/RecomenededCard";
import TabSection from "../components/TabSection";
import { Head, usePage } from "@inertiajs/react";
import MainLayout from "../layouts/MainLayout";
import Modal from "@/components/Modal";

export default function Home({ ...props }) {
    const { BrandProduct, Categories } = props;
    const { Setting } = usePage().props;
    const Rekomendasi = BrandProduct?.filter(
        (item) => item?.isRecommended == 1
    );
    const Populer = BrandProduct?.filter((item) => item?.isPopular == 1);
    return (
        <>
            <Head>
                <title>Home</title>
                <meta
                    name="description"
                    content={Setting?.["seo.description"]}
                />
            </Head>
            <div className="md:pb-10 pb-5">
                <Hero />
                <Recomended
                    title="Rekomendasi"
                    description="Berikut adalah beberapa produk yang kami rekomendasikan
                        untuk kamu."
                >
                    {Rekomendasi?.map((item, index) => (
                        <RecomendedCard item={item} key={index} />
                    ))}
                </Recomended>
                <Recomended
                    title="Populer Sekarang!"
                    description="Berikut adalah beberapa produk yang kami rekomendasikan
                        untuk kamu."
                >
                    {Populer?.map((item) => (
                        <RecomendedCard item={item} key={item.id} />
                    ))}
                </Recomended>
                <TabSection categories={Categories} />
            </div>
        </>
    );
}

Home.layout = (page) => {
    return <MainLayout>{page}</MainLayout>;
};
