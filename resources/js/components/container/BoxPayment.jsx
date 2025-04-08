import React, { useState } from "react";
import BoxProduct from "../BoxProduct";
import useStore from "../../store/AppStore";
import { formatRupiah } from "../../utils/methods";
import CardChannel from "../ui/CardChannel";
import { usePage } from "@inertiajs/react";

function BoxPayment({ paymentMethods, brand }) {
    const { auth } = usePage().props;
    const basket = useStore((state) => state.basket);
    const quantity = useStore((state) => state.quantity);
    const addPaymentMethod = useStore((state) => state.addPaymentMethod);
    const methodStore = useStore((state) => state?.paymentMethod);
    const brandPaymentMethod =
        brand?.payment_methods?.length > 0
            ? brand?.payment_methods
            : paymentMethods;
    const type = [...new Set(brandPaymentMethod.map((e) => e?.type))];

    const totalPrice = (method = null) => {
        if (basket?.length > 0) {
            const isPremium = auth?.user && auth?.user?.level == "premium";
            const productPrice = isPremium
                ? basket[0]?.membership_price
                : basket[0]?.total_price;
            let totalProductPrice = productPrice * quantity;
            let fee = method?.fee_fixed?.split(".")[0] || 0; // Ambil fee admin
            const total = Number(totalProductPrice) + Number(fee);
            return total;
        }
        return null;
    };

    const handleClick = (p) => {
        if (basket?.length == 0) {
            return;
        }
        addPaymentMethod(p);
    };

    return (
        <>
            <BoxProduct number={"5"} title={"Pilih Metode Pembayaran"}>
                <div className="md:p-6 p-2  text-gray-800 dark:text-dark-text text-sm">
                    {type?.map((e) => {
                        const paymentMethods = brandPaymentMethod.filter(
                            (item) => item?.type === e
                        );

                        return (
                            <div key={e} className="mb-6">
                                <div className="mb-0">
                                    <h3 className="text-base  font-bold">
                                        {e}
                                    </h3>
                                </div>
                                {/* cards */}
                                <div className="grid grid-cols-2 gap-2  mt-2 md:mt-4 md:grid-cols-3 md:gap-3">
                                    {paymentMethods.map((method, index) => (
                                        <CardChannel
                                            index={index}
                                            method={method}
                                            handleClick={handleClick}
                                            methodStore={methodStore}
                                            totalPrice={totalPrice}
                                        />
                                    ))}
                                </div>
                            </div>
                        );
                    })}
                </div>
            </BoxProduct>
        </>
    );
}

export default BoxPayment;
