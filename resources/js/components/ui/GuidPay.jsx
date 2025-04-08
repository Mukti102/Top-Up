import React from "react";

function GuidPay({ guides }) {
    return (
        <div className="join join-vertical bg-transparent">
            {guides?.map((item, i) => (
                <div
                    key={i}
                    className="collapse h-max  collapse-arrow join-item dark:bg-card   bg-gray-50 text-gray-700 border border-gray-100 dark:border-stone-700"
                >
                    {/* Ubah input dari radio menjadi checkbox */}
                    <input type="checkbox" />
                    <div className="collapse-title dark:text-dark-text text-gray-600 font-semibold text-sm sm:text-base md:text-md truncate">
                        {item?.title}
                    </div>
                    <div className="collapse-content  space-y-2 text-xs">
                        {item?.steps?.map((e, i) => (
                            <div key={i} className="flex  gap-3">
                                {/* Angka dalam lingkaran */}
                                <span className="font-semibold inline-flex items-center justify-center rounded-full dark:bg-dark bg-gray-300 text-gray-500 dark:text-dark-text w-5 h-5 text-xs">
                                    {i + 1}
                                </span>
                                {/* Teks deskripsi */}
                                <p
                                    className="flex-1  dark:text-dark-text"
                                    dangerouslySetInnerHTML={{ __html: e }}
                                />
                            </div>
                        ))}
                    </div>
                </div>
            ))}
        </div>
    );
}

export default GuidPay;
