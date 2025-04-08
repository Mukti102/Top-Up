import { Link } from "@inertiajs/react";
import React from "react";

const RecomendedCard = ({ item }) => {
    return (
        <Link
            href={`/order/${item?.slug}`}
            className="relative flex flex-col gap-4 p-1.5 md:p-2 w-full h-16 md:h-[100px] md:rounded-lg rounded-md
                   bg-gradient-to-tr  from-primary/70 to-primary dark:from-secondary/60 dark:to-secondary
                   shadow-sm dark:shadow-md overflow-hidden group transition-all duration-300 hover:brightness-105 hover:scale-[1.01]"
        >
            {/* Updated background pattern dengan diagonal lines */}
            <div
                className="absolute inset-0 
                          bg-[url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI4IiBoZWlnaHQ9IjgiPjxwYXRoIGQ9Ik0tMSAxIGwyIC0yIE0wIDggbDggLTggTTYgMCBsMiAyaC0yIiBzdHJva2U9InJnYmEoMjU1LDI1NSwyNTUsMC4xNSkiIHN0cm9rZS13aWR0aD0iMSIvPjwvc3ZnPg==')] 
                          bg-repeat 
                          bg-[size:14px_14px]
                          opacity-30
                          z-0 
                          pointer-events-none"
            ></div>
            <div className="relative z-10 flex h-full gap-2.5 md:gap-3 items-center">
                {/* Image */}
                <div className="h-full w-1/3 md:w-1/5 rounded-md md:rounded-lg overflow-hidden shadow-inner">
                    <img
                        src={`/storage/${item?.image}`}
                        alt={item?.name}
                        className="w-full h-full object-cover"
                    />
                </div>

                {/* Text Content */}
                <div className="space-y-0.5 md:space-y-1">
                    <h1 className="text-[10px] md:text-sm font-semibold text-white dark:text-white truncate">
                        {item?.name}
                    </h1>
                    <p className="text-[10px] md:text-xs font-medium text-white dark:text-gray-200 truncate">
                        {item?.category?.name}
                    </p>
                </div>
            </div>
        </Link>
    );
};

export default RecomendedCard;
