import { usePage } from "@inertiajs/react";
import React from "react";
import { BsHeadset } from "react-icons/bs";

function CardHelp() {
    const { admin_phone } = usePage().props;
    // ganti menjadi di awali 62
    const adminNumber = admin_phone?.replace("0", "62");
    return (
        <a
            href={`https://wa.me/${adminNumber}`}
            className="w-full bg-white dark:bg-card dark:text-dark-text text-gray-500 md:mb-1 mb-0 border-gray-300 dark:border-stone-700 border-1 flex gap-3 items-center text-sm rounded-lg py-5 p-4 shadow-sm"
        >
            <span className="text-3xl">
                <BsHeadset />
            </span>
            <div>
                <h3 className="text-sm font-semibold">Butuh Bantuan ?</h3>
                <p className="text-xs">Kamu Bisa Hubungi Admin Disini</p>
            </div>
        </a>
    );
}

export default CardHelp;
