import MainLayout from "@/layouts/MainLayout";
import React from "react";
import { Link } from "@inertiajs/react";
import { dateFormat, formatDate } from "@/utils/methods"; // Pastikan fungsi ini sudah ada
import CardPost from "@/components/ui/CardPost";
import Breadcrumb from "@/components/ui/Breadcrumb";

function NewsDetail({ news, related }) {
    const links = [
        { label: "Berita", link: "news.index", current: false },
        { label: news?.title, link: news?.title, current: true },
    ];
    return (
        <div className="md:pt-24 pt-20 px-3 md:px-10 dark:bg-dark bg-gray-50">
            <Breadcrumb items={links} />
            <div className="md:py-8 py-3 min-h-screen">
                <div className="max-w-7xl mx-auto">
                    {/* Main Content */}
                    <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
                        {/* Article Content */}
                        <article className="lg:col-span-2 overflow-hidden">
                            {/* Featured Image */}
                            <img
                                src={`/storage/${news?.thumbnail}`}
                                alt={news?.title}
                                className="w-full h-50 md:h-96 object-cover object-center"
                            />

                            {/* Article Header */}
                            <div className="p-0 dark:text-dark-text text-gray-900 md:p-0">
                                <div className="space-y-2">
                                    <h1 className="text-xl md:text-4xl font-bold  mt-5 ">
                                        {news?.title}
                                    </h1>
                                    <p className="text-gray-600 dark:text-dark-text md:text-sm text-xs">
                                        {dateFormat(news?.created_at)}
                                    </p>
                                </div>
                                {/* Article Body */}
                                <article
                                    className="prose pt-3 dark:text-dark-text text-sm md:text-base md:mt-6 max-w-none text-gray-800"
                                    dangerouslySetInnerHTML={{
                                        __html: news?.content,
                                    }}
                                />
                                {/* tags */}
                                <div>
                                    <div
                                        className="flex
                                    font-semibold text-sm text-gray-600
                                    items-center dark:text-dark-text flex-wrap gap-2 mt-6"
                                    >
                                        <span>Tags :</span>
                                        {news?.tags?.map((tag) => (
                                            <Link
                                                href={`/tags/${tag}`}
                                                key={tag}
                                                className="hover:text-primary dark:hover:text-secondary"
                                            >
                                                #{tag}
                                            </Link>
                                        ))}
                                    </div>
                                </div>
                            </div>
                        </article>
                        {/* Sidebar */}
                        <aside className="lg:col-span-1">
                            {/* Latest News */}
                            <div className="rounded-xl mb-3 md:mb-6">
                                <h2 className="text-xl font-bold dark:text-dark-text text-gray-900 mb-4">
                                    Berita Terbaru
                                </h2>
                                <div className="space-y-3.5 text-gray-500 ">
                                    {related?.length == 0 && (
                                        <h1 className="text-center text-sm">
                                            Tidak ada berita terbaru
                                        </h1>
                                    )}
                                    {related.map((item) => (
                                        <Link
                                            href={`/news/${item.title}`}
                                            key={item.id}
                                            className="group flex items-center space-x-3 dark:hover:bg-card py-1 hover:bg-gray-50 p-0 rounded-lg transition"
                                        >
                                            <img
                                                src={
                                                    item?.thumbnail &&
                                                    !item?.thumbnail.startsWith(
                                                        "https://via"
                                                    )
                                                        ? "/storage/" +
                                                          item?.thumbnail
                                                        : "https://i.pinimg.com/474x/b3/c8/31/b3c831ecff785cbb3e3ec2969ec16f7e.jpg"
                                                }
                                                alt={item.title}
                                                className="w-32 h-16 object-cover rounded"
                                            />
                                            <div className="space-y-2">
                                                <h3 className="text-sm dark:text-dark-text font-semibold text-gray-900 group-hover:text-primary dark:group-hover:text-secondary">
                                                    {item.title}
                                                </h3>
                                                <p className="text-xs text-gray-500">
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

                    {/* Related News */}
                    {related?.length > 0 && (
                        <section className="md:mt-16 mt-4">
                            <h2 className="md:text-2xl dark:text-dark-text text-xl font-bold text-gray-900 mb-3 md:mb-8">
                                Berita Terkait
                            </h2>
                            <div className="grid grid-cols-2 md:grid-cols-2 lg:grid-cols-4 gap-3 md:gap-6">
                                {related.map((item) => (
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
                </div>
            </div>
        </div>
    );
}

NewsDetail.layout = (page) => <MainLayout>{page}</MainLayout>;

export default NewsDetail;
