import React from "react";
import CardProduct from "./CardProduct";

function BoxProduct({ children, number, title, description }) {
    return (
        <div className="rounded-xl col-span-2 border-gray-300 border-[0.1px] bg-white shadow-sm overflow-hidden h-max pb-3">
            {/* header box  */}
            <div className="w-full items-center  gap-3 flex  bg-gray-100 text-gray-700">
                <span className="bg-[var(--primary)] text-sm text-white font-semibold px-4 p-2.5">
                    {number}
                </span>
                <h2 className="text-sm font-medium">{title}</h2>
            </div>
            {/* content */}
            <div className="p-4 text-gray-800 text-sm">
                <div>
                    <h3 className="text-sm">{description}</h3>
                </div>
                {children}
            </div>
        </div>
    );
}

export default BoxProduct;
