import { cn } from "@/lib/utils";
import { dateFormat } from "@/utils/methods";
import { Link } from "@inertiajs/react";
import React from "react";
import { route } from "ziggy-js";

function CardPost({ article, className }) {
    return (
        <Link
            key={article.id}
            href={route("news.show", article.title)}
            className="group "
        >
            <div className="overflow-hidden">
                <img
                    src={
                        article?.thumbnail &&
                        !article?.thumbnail.startsWith("https://via")
                            ? "/storage/" + article?.thumbnail
                            : "https://i.pinimg.com/474x/b3/c8/31/b3c831ecff785cbb3e3ec2969ec16f7e.jpg"
                    }
                    alt={article.title}
                    width={400}
                    height={250}
                    className="w-full h-24 md:h-40 object-cover"
                />
                <div
                    className={cn(
                        className,
                        "md:py-4 py-2  space-y-1 md:space-y-1"
                    )}
                >
                    <h3 className="md:text-[1rem] text-xs font-semibold  transition duration-200">
                        {article.title}
                    </h3>
                    <p className="md:text-xs text-[10px]">
                        {dateFormat(article.created_at)}
                    </p>
                </div>
            </div>
        </Link>
    );
}

export default CardPost;
