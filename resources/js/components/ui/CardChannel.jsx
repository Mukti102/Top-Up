import useStore from "@/store/AppStore";
import { formatRupiah } from "@/utils/methods";
import { usePage } from "@inertiajs/react";
import React from "react";

function CardChannel({
    method = null,
    index,
    handleClick,
    methodStore,
    totalPrice,
}) {
    const { Setting, auth } = usePage().props;
    const logo = Setting?.["general.brand.logo"];
    const basket = useStore((state) => state.basket);
    const amount = basket[0]?.total_price * useStore((state) => state.quantity);
    const isValid = (minimumAmount, maxAmount) => {
        const minimun = Number(minimumAmount || 0);
        const max = Number(maxAmount || 0);
        const active =
            method?.type == "Saldo Member" ? auth?.user?.saldo : true;
        return amount >= minimun && amount <= max && active;
    };
    return (
        <button
            disabled={!isValid(method?.minimum_amount, method?.maximum_amount)}
            key={index}
            onClick={() => handleClick(method)}
            className={`  cursor-pointer  transition-all ease-in-out h-max py-1 md:h-28  duration-300 group border-2 active:border-transparent rounded-lg   md:rounded-xl ${
                method?.id == methodStore[0]?.id
                    ? "border-2 bg-primary/5 dark:bg-secondary/50 border-primary dark:border-secondary dark:text-dark-text  text-gray-800 "
                    : "border-gray-50 dark:border-stone-800 dark:hover:border-secondary shadow-sm dark:bg-dark/50 bg-slate-100  "
            } `}
        >
            <div className="md:p-3 p-1">
                <div className="flex w-14 md:w-16 flex-col gap-2 items-start">
                    <div className="transition-all duration-300">
                        <img
                            className={`bg-blend-difference object-cover w-full h-full ${
                                isValid(
                                    method?.minimum_amount,
                                    method?.maximum_amount
                                )
                                    ? ""
                                    : "grayscale"
                            } `}
                            src={
                                method?.img
                                    ? "/storage/" + method?.img
                                    : method?.img_url
                                    ? method?.img_url
                                    : "/storage/" + logo
                            }
                            alt=""
                        />
                    </div>
                    <div className="text-xs font-medium">
                        {/* total pembayaran */}
                        {formatRupiah(totalPrice(method))}
                    </div>
                </div>
            </div>
            <div className="flex p-1.5  dark:text-dark-text justify-start dark:border-stone-700 border-t-[0.5px] border-gray-300  gap-2 text-[9px] text-gray-600 italic">
                <p>Di cek Secara Otomatis</p>
            </div>
        </button>
    );
}

export default CardChannel;
