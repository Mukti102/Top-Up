import React from "react";
import RecomendedCard from "./RecomenededCard";

function Recomended({ title, description, children }) {
    return (
        <>
            <div className="md:px-5  py-2 px-1 md:py-5 ">
                <div className="">
                    <h2 className="md:text-lg text-sm text-gray-700 dark:text-dark-text font-bold flex items-center gap-2">
                        <span>✨</span> {title}
                    </h2>
                    <p className="text-[10px] pl-3 md:pl-8 text-gray-400 mb-1.5 md:mb-4">
                        {description}
                    </p>
                </div>
                <div className="grid  grid-cols-2 md:grid-cols-3 gap-2">
                    {children}
                </div>
            </div>
        </>
    );
}

export default Recomended;
