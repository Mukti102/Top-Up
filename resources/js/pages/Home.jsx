import React, { useEffect } from "react";
import { IoIosSearch } from "react-icons/io";
import Header from "../components/Header";
import Hero from "../components/Hero";
import Recomended from "../components/Recomended";
import RecomendedCard from "../components/RecomenededCard";
import TabSection from "../components/TabSection";
import { Head } from "@inertiajs/react";
import MainLayout from "../layouts/MainLayout";

export default function Home({ ...props }) {
    const { BrandProduct, Categories } = props;
    return (
        <>
            <Head>
                <title>Topup</title>
                <meta name="description" content="topup product store" />
            </Head>
            <div className="pb-10">
                <Hero />
                <Recomended
                    title="Rekomendasi"
                    description="Berikut adalah beberapa produk yang kami rekomendasikan
                        untuk kamu."
                >
                    <RecomendedCard />
                    <RecomendedCard />
                    <RecomendedCard />
                </Recomended>
                <Recomended
                    title="Populer Sekarang!"
                    description="Berikut adalah beberapa produk yang kami rekomendasikan
                        untuk kamu."
                >
                    <RecomendedCard />
                    <RecomendedCard />
                    <RecomendedCard />
                </Recomended>
                <TabSection categories={Categories} />
            </div>
        </>
    );
}
Home.layout = (page) => <MainLayout>{page}</MainLayout>;
