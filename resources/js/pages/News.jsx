import Caraosel from "@/components/ui/Caraosel";
import NewsList from "@/components/ui/NewLists";
import MainLayout from "@/layouts/MainLayout";
import { formatDate } from "@/utils/methods";
import { usePage } from "@inertiajs/react";
import React from "react";

function News() {
    const { news } = usePage().props;
    const slider = news?.slice(0, 5);
    const tags = [...new Set(news?.flatMap((item) => item.tags) ?? [])];
    return (
        <div className="py-19">
            <div className="p-5 px-3 md:px-20">
                <Caraosel
                    key={slider?.map((item) => item.id).join("-")} // Gunakan ID unik
                    slider={slider}
                />
            </div>
            {/* cards */}
            <NewsList key={news?.length} categories={tags} news={news} />
        </div>
    );
}

export default News;

News.layout = (page) => <MainLayout>{page}</MainLayout>;
