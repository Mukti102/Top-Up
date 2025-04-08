import React from "react";
import CardProduct from "./CardProduct";

function BoxProduct({ children, number, title, description }) {
    return (
        <div className="md:rounded-xl rounded-lg dark:border-gray-800 border-gray-300 border-[0.1px] dark:text-dark-text  bg-white dark:bg-card shadow-sm md:shadow-md overflow-hidden h-max pb-3">
            {/* header box  */}
            <div className="w-full items-center mb-1  gap-3 flex dark:bg-zinc-700  bg-[#fdfdfd] shadow-sm dark:text-dark-text  text-gray-700">
                <span className="bg-primary dark:bg-secondary text-sm text-white font-semibold px-4 p-2.5">
                    {number}
                </span>
                <h2 className="text-sm font-medium">{title}</h2>
            </div>
            {/* content */}
            {children}
        </div>
    );
}

export default BoxProduct;
