import React, { useEffect, useState } from "react";
import useStore from "../store/AppStore";
import { cheking, formatRupiah } from "../utils/methods";
import withReactContent from "sweetalert2-react-content";
import Swal from "sweetalert2";
import { router, usePage } from "@inertiajs/react";
import { AiOutlineLoading3Quarters } from "react-icons/ai";

function CardBasketMobile({ handleSubmit, brand }) {
    const basket = useStore((state) => state.basket);
    const product = basket?.[0] || {};
    const quantity = useStore((state) => state.quantity);
    const voucherDiskon = useStore((state) => state.voucherDiskon);
    const paymentMethod = useStore((state) => state?.paymentMethod);
    const biaya = Number(paymentMethod?.[0]?.fee_fixed?.split(".")[0]) || 0;
    const getAll = useStore((state) => state.getAll);
    const all = getAll();
    const MySwal = withReactContent(Swal);
    const rules = brand?.rules?.field_input || [];
    const { errors, auth } = usePage().props;
    const [error, setError] = React.useState(null);
    const [isLoading, setIsLoading] = useState(false);
    const [isOpen, setIsOpen] = useState(false);

    useEffect(() => {
        setError(errors?.error);
        setIsOpen(false);
        if (errors?.error) {
            MySwal.fire({
                icon: "warning",
                title: "Transaksi Gagal",
                text: error,
                confirmButtonText: "OK",
            });
        }
    }, [errors]);

    const total = () => {
        const isPremium = auth?.user && auth?.user?.level == "premium";
        const productPrice = !isPremium
            ? product?.total_price
            : product?.membership_price;
        const result =
            (productPrice || 0) * quantity +
            biaya -
            ((voucherDiskon?.discount || 0) / 100) *
                ((productPrice || 0) * quantity + biaya);
        return result;
    };

    const checkSaldoMember = () => {
        if (
            auth?.user &&
            methodStore[0]?.type === "Saldo Member" &&
            auth?.user?.saldo < total()
        ) {
            return true;
        }
        return false;
    };

    const checkAllData = () => {
        const { voucherDiskon, ...data } = all;
        const isComplete = cheking(data);
        const account = all?.acount;
        const isAccountComplete = (account, rules) => {
            return rules.every(
                (rule) =>
                    account.hasOwnProperty(rule.label) &&
                    account[rule.label] !== ""
            );
        };

        const result = isComplete && isAccountComplete(account, rules);
        if (result === false) {
            MySwal.fire({
                icon: "warning",
                title: "Data belum lengkap",
                text: "Silahkan lengkapi data terlebih dahulu sebelum melakukan pembayaran.",
                confirmButtonText: "OK",
            });
            setIsOpen(false);
        } else if (checkSaldoMember()) {
            MySwal.fire({
                icon: "warning",
                title: "Saldo Tidak Cukup",
                text: "Harap deposit saldo untuk bisa menggunakan saldo member.",
                confirmButtonText: "OK",
            });
        } else {
            handleSendRequest();
            setIsOpen(true);
        }
    };

    const transformData = (data) => {
        return {
            costumer_number: data.acount,
            email: data?.contact?.Email,
            phone: data?.contact?.Telephone,
            quantity: data.quantity,
            product_id: data.basket[0]?.id || null,
            payment_method_id: data.paymentMethod[0]?.id || null,
            voucher_id: data.voucherDiskon.id || null,
        };
    };

    const handleSendRequest = () => {
        setIsLoading(true);
        router.post("/transaction", transformData(all), {
            onSuccess: () => {
                setIsLoading(false);
                setIsOpen(false);
            },
            onError: () => {
                setIsLoading(false);
                setIsOpen(false);
            },
        });
    };

    return (
        <div className="md:static md:hidden join join-vertical h-max fixed bottom-0 w-full pr-3">
            <div className="collapse collapse-arrow join-item rounded-md text-gray-400 dark:border-stone-600 border-[#c4c4c4] border-1 border-dashed">
                <input
                    type="checkbox"
                    id="basket-collapse"
                    className="hidden"
                />
                {basket?.length === 0 ? (
                    <div className="collapse-title pl-10 dark:text-dark-text dark:bg-card bg-white text-center rounded-lg">
                        <h4 className="text-xs py-2 text-[#5c5c5c]">
                            Belum ada item produk yang dipilih.
                        </h4>
                    </div>
                ) : (
                    <>
                        <label
                            htmlFor="basket-collapse"
                            className="collapse-title dark:bg-card bg-white rounded-md p-4"
                        >
                            <div className="flex items-center gap-2.5">
                                <img
                                    src={
                                        brand?.image
                                            ? "/storage/" + brand?.image
                                            : "https://i.pinimg.com/736x/da/7e/79/da7e79f22cf7c28ce6c4bd5006f8a131.jpg"
                                    }
                                    alt="Kim Jieun"
                                    className="w-16 h-16 object-cover rounded-md"
                                />
                                <div className="space-y-1.5">
                                    <h2 className="text-sm dark:text-dark-text text-gray-700 font-semibold">
                                        {product?.name ||
                                            "Produk Tidak Diketahui"}
                                    </h2>
                                    <p className="text-gray-500 dark:text-dark-text/60 text-xs">
                                        {product?.brand?.name ||
                                            "Brand Tidak Diketahui"}
                                    </p>
                                </div>
                            </div>
                        </label>
                        <div className="collapse-content dark:bg-card bg-white">
                            <div className="text-sm space-y-3 border-t text-gray-500 dark:text-dark-text border-gray-300 pt-2 px-0">
                                <div className="flex justify-between">
                                    <span>Harga</span>
                                    <span>
                                        {formatRupiah(
                                            product?.total_price || 0
                                        )}
                                    </span>
                                </div>
                                <div className="flex justify-between">
                                    <span>Jumlah Pembelian</span>
                                    <span>{quantity}</span>
                                </div>
                                <div className="flex justify-between">
                                    <span>Biaya</span>
                                    <span>{formatRupiah(biaya)}</span>
                                </div>
                                <div className="mt-2 border-t border-gray-300 pt-2 flex justify-between text-lg font-bold">
                                    <span>Total Pembayaran</span>
                                    <span className="text-orange-500">
                                        {formatRupiah(total())}
                                    </span>
                                </div>
                            </div>
                        </div>
                    </>
                )}
            </div>
            <button
                className="w-full btn dark:btn-secondary dark:text-white btn-primary rounded-md my-2 md:my-4"
                onClick={() => checkAllData()}
            >
                {isLoading ? (
                    <div className="flex items-center justify-center gap-2 w-full">
                        <AiOutlineLoading3Quarters className="animate-spin" />
                        <span>Processing…</span>
                    </div>
                ) : (
                    "Pesan Sekarang"
                )}
            </button>
        </div>
    );
}

export default CardBasketMobile;
