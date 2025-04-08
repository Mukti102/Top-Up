import React from "react";
import { formatRupiah } from "../../utils/methods";

export default function TablePricelist({ products }) {
    const calculatePremiumPrice = (price, discount) => {
        const premiumPrice = price - (price * discount) / 100;
        return premiumPrice;
    };
    return (
        <div class="relative overflow-x-auto    sm:rounded-lg">
            <table class="w-full text-sm text-left dark:border-stone-800 border-1 rtl:text-right text-gray-500">
                <thead class="text-xs  text-gray-100 uppercase dark:bg-secondary/90 bg-primary/90">
                    <tr>
                        <th scope="col" class="px-6 py-3">
                            Nama
                        </th>
                        <th scope="col" class="px-6 py-3">
                            Harga Basic
                        </th>
                        <th scope="col" class="px-6 py-3">
                            Harga Premium
                        </th>
                    </tr>
                </thead>
                <tbody>
                    {products?.map((item, index) => {
                        return (
                            <tr class="odd:bg-white dark:bg-card odd:dark:bg-card even:bg-gray-50 even:dark:bg-dark/30 border-b dark:border-stone-800 border-gray-200">
                                <th
                                    scope="row"
                                    class="md:px-6 px-2 py-4 font-medium text-gray-900 whitespace-nowrap flex gap-3 items-center"
                                >
                                    {/* img */}
                                    <div className="w-14 h-14 rounded-md overflow-hidden">
                                        <img
                                            className="w-full h-full object-cover"
                                            src={
                                                item?.brand?.image
                                                    ? "/storage/" +
                                                      item?.brand.image
                                                    : "https://i.pinimg.com/736x/da/7e/79/da7e79f22cf7c28ce6c4bd5006f8a131.jpg"
                                            }
                                            alt=""
                                        />
                                    </div>
                                    <div className="space-y-1 dark:text-dark-text">
                                        <h2>{item?.name}</h2>
                                        <p className="text-xs text-gray-500">
                                            {item?.brand?.name}
                                        </p>
                                    </div>
                                </th>
                                <td class="px-6 dark:text-dark-text/80 py-4">
                                    {formatRupiah(item?.total_price)}
                                </td>
                                <td class="px-6 dark:text-dark-text/80 py-4">
                                    {formatRupiah(
                                        calculatePremiumPrice(
                                            item?.total_price,
                                            item?.premium_price
                                        )
                                    )}
                                </td>
                            </tr>
                        );
                    })}
                </tbody>
            </table>
        </div>
    );
}
