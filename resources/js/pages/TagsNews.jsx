import MainLayout from "@/layouts/MainLayout";
import React from "react";
import { Link } from "@inertiajs/react";
import { dateFormat, formatDate } from "@/utils/methods"; // Pastikan fungsi ini sudah ada
import CardPost from "@/components/ui/CardPost";
import Breadcrumb from "@/components/ui/Breadcrumb";
import { route } from "ziggy-js";

function TagsNews({ news, tag }) {
    const links = [
        { label: "Berita", link: "news.index", current: false },
        { label: tag, link: news?.title, current: true },
    ];
    const latest = news?.slice(0, 5);
    return (
        <div className="md:pt-24 pt-20 md:px-10 px-2 dark:bg-dark bg-gray-50">
            <Breadcrumb items={links} />
            <div className="py-6  min-h-screen">
                <div className="max-w-7xl mx-auto">
                    {/* Main Content */}
                    <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
                        {/* Article Content */}
                        <article className="lg:col-span-2  overflow-hidden">
                            {/* Featured Image */}
                            <Link
                                href={`/news/${news[0]?.title}`}
                                className=" relative  overflow-hidden"
                            >
                                <img
                                    src={
                                        news[0]?.thumbnail
                                            ? `/storage/${news[0]?.thumbnail}`
                                            : "https://i.pinimg.com/474x/b3/c8/31/b3c831ecff785cbb3e3ec2969ec16f7e.jpg"
                                    }
                                    alt={news[0]?.title}
                                    className="w-full md:h-96 h-72  object-cover object-center"
                                />
                                <div className="w-full p-3 md:p-5 h-full    bg-gradient-to-b from-transparent via-transparent flex items-end to-black   absolute bottom-0">
                                    <div className="space-y-2">
                                        <h1 className="md:text-3xl text-xl font-medium">
                                            {news[0]?.title}
                                        </h1>
                                        <span className="text-sm font-light">
                                            {dateFormat(news[0]?.created_at)}
                                        </span>
                                    </div>
                                </div>
                            </Link>

                            {news?.length > 0 && (
                                <section className="mt-6">
                                    <h2 className="md:text-3xl dark:text-dark-text text-xl font-bold text-gray-900 mb-4 md:mb-8">
                                        {tag}
                                    </h2>
                                    <div className="grid grid-cols-2 md:grid-cols-2 lg:grid-cols-3 gap-3 md:gap-6">
                                        {news?.map((item) => (
                                            <CardPost
                                                className={
                                                    "text-gray-700 dark:text-dark-text"
                                                }
                                                article={item}
                                                key={item.id}
                                            />
                                        ))}
                                    </div>
                                </section>
                            )}
                        </article>
                        {/* Sidebar */}
                        <aside className="lg:col-span-1">
                            {/* Latest News */}
                            <div className="rounded-xl mb-3 md:mb-6">
                                <h2 className="text-xl font-bold dark:text-dark-text text-gray-900 mb-3 md:mb-4">
                                    Berita Terbaru
                                </h2>
                                <div className="md:space-y-2 space-y-3 dark:text-dark-text text-gray-500 ">
                                    {latest?.length == 0 && (
                                        <h1 className="text-center text-sm">
                                            Tidak ada berita terbaru
                                        </h1>
                                    )}
                                    {latest.map((item) => (
                                        <Link
                                            href={`/news/${item.title}`}
                                            key={item.id}
                                            className="group flex items-center space-x-3 dark:hover:bg-card hover:bg-gray-50 md:p-2 p-0 rounded-lg transition"
                                        >
                                            <img
                                                src={
                                                    item?.thumbnail
                                                        ? `/storage/${item?.thumbnail}`
                                                        : "https://i.pinimg.com/474x/b3/c8/31/b3c831ecff785cbb3e3ec2969ec16f7e.jpg"
                                                }
                                                alt={item.title}
                                                className="w-32 h-16 object-cover rounded"
                                            />
                                            <div className="space-y-2">
                                                <h3 className="text-sm dark:text-dark-text font-semibold text-gray-900 group-hover:text-primary dark:group-hover:text-secondary">
                                                    {item.title}
                                                </h3>
                                                <p className="text-xs dark:text-dark-text text-gray-500">
                                                    {formatDate(
                                                        item.created_at
                                                    )}
                                                </p>
                                            </div>
                                        </Link>
                                    ))}
                                </div>
                            </div>
                        </aside>
                    </div>
                </div>
            </div>
        </div>
    );
}

TagsNews.layout = (page) => <MainLayout>{page}</MainLayout>;

export default TagsNews;
