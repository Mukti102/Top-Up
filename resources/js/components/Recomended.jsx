import React from "react";
import RecomendedCard from "./RecomenededCard";

function Recomended({ title, description, children }) {
    return (
        <>
            <div className="px-5 py-5 ">
                <div className="">
                    <h2 className="text-lg text-gray-700 font-bold flex items-center gap-2">
                        <span>✨</span> {title}
                    </h2>
                    <p className="text-xs pl-8 text-gray-400 mb-4">
                        {description}
                    </p>
                </div>
                <div className="grid grid-cols-3 gap-3">{children}</div>
            </div>
        </>
    );
}

export default Recomended;
