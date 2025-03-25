import React from "react";
import { BsBasket } from "react-icons/bs";

function CardBasket() {
    return (
        <div>
            <div className="shadow-md h-32 bg-white border-[#c4c4c4] border-1 border-dashed mt-5 rounded-lg flex justify-center items-center ">
                <h4 className="text-xs text-[#5c5c5c]">
                    Belum ada item produk yang dipilih.
                </h4>
            </div>
            <button className="flex shadow-md gap-2 justify-center items-center text-xs bg-[var(--primary)] py-2.5 w-full mt-3 cursor-pointer hover:bg-[var(--primary)]/90 rounded-lg">
                <BsBasket />
                <span>Pesan Sekaarang</span>
            </button>
        </div>
    );
}

export default CardBasket;
