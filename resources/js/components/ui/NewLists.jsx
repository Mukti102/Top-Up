import { dateFormat, formatDate } from "@/utils/methods";
import { Link } from "@inertiajs/react";
import React from "react";
import { route } from "ziggy-js";
import CardPost from "./CardPost";

function NewsList({ categories, news }) {
    return (
        <div className="container text-white  mx-auto  py-8">
            {categories.map((category, index) => {
                const articles = news?.filter((item) =>
                    item.tags.includes(category)
                );
                return (
                    <div
                        key={index}
                        className={`${
                            index % 2 === 0
                                ? "bg-black dark:bg-card"
                                : "bg-primary dark:bg-secondary"
                        } py-5 px-2 md:px-5`}
                    >
                        <h2 className="md:text-2xl text-xl font-bold  pb-2 mb-2 md:mb-4 capitalize">
                            {category}
                        </h2>
                        <div className="grid grid-cols-2 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
                            {articles.slice(0, 8).map((article, i) => (
                                <CardPost article={article} key={i} />
                            ))}
                        </div>
                    </div>
                );
            })}
        </div>
    );
}

export default NewsList;
