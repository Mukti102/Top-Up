import React from "react";
import { BsHeadset } from "react-icons/bs";

function CardHelp() {
    return (
        <div className="w-full bg-white text-gray-500 border-gray-300 border-1 flex gap-3 items-center text-sm rounded-lg py-5 p-4 shadow-sm ">
            <span className="text-3xl">
                <BsHeadset />
            </span>
            <div>
                <h3 className="text-sm font-semibold">Butuh Bantuan ?</h3>
                <p className="text-xs">Kamu Bisa Hubungi Admin Disini</p>
            </div>
        </div>
    );
}

export default CardHelp;
