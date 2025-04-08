import React from "react";

export default function Items() {
    const icons = [
        {
            icon: "/icons/petir.gif", // ✅ Gunakan "/" untuk akses dari public/
            title: "Poses Cepat",
        },
        {
            icon: "/icons/contact-support.gif",
            title: "Dukungan Cepat",
        },
        {
            icon: "/icons/secure.gif",
            title: "Keamanan Terjamin",
        },
    ];
    return (
        <div className=" mt-4 md:static absolute right-0 md:px-0  px-4 left-0 bottom-2">
            <ul className="flex gap-3 text-xs   text-gray-800 font-light">
                {icons?.map((item, index) => (
                    <li
                        key={index}
                        className="relative md:pl-0 font-medium text-gray-600 flex items-center dark:text-dark-text gap-1 md:gap-2 text-[9px]  md:text-xs"
                    >
                        <span
                            className="md:w-6    md:h-6 w-5 h-5 bg-contain bg-no-repeat"
                            style={{
                                backgroundImage: `url(${item?.icon})`,
                            }}
                        ></span>
                        {item?.title}
                    </li>
                ))}
            </ul>
        </div>
    );
}
