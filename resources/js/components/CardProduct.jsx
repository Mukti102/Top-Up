import React from "react";
import FatsDeliver from "./icons/FatsDeliver";
import DiskonIcon from "./icons/DiskonIcon";
import diamond from "../../../public/icons/diamond.png";
function CardProduct({ product }) {
    return (
        <div className="bg-hray-300 shadow-xl  transition-all ease-in-out h-max  duration-300 group border-1 border-gray-200 hover:border-[var(--primary)]  rounded-xl">
            <div className="p-3">
                <h4 className="text-xs">{product?.name}</h4>
                <div className="flex gap-4 items-center">
                    <div className="w-10 group-hover:rotate-12 transition-all duration-300 h-10">
                        <img
                            className="bg-blend-difference w-full h-full"
                            src={diamond}
                            alt=""
                        />
                    </div>
                    <div>
                        <span className="text-[var(--primary)] font-semibold">
                            Rp{" "}
                            {Math.floor(
                                product?.total_price || 0
                            ).toLocaleString("id-ID")}
                        </span>

                        <span className="text-orange-600 mt-[0.1rem] line-through  block text-[0.6rem] italic font-light">
                            Rp{" "}
                            {Math.floor(
                                product?.total_price * 1.2 || 0
                            ).toLocaleString("id-ID")}
                        </span>
                    </div>
                </div>
            </div>
            <div className="flex p-1.5 justify-end border-t-[0.5px] border-gray-300  gap-2">
                <DiskonIcon>2%</DiskonIcon>
                <FatsDeliver />
            </div>
        </div>
    );
}

export default CardProduct;
