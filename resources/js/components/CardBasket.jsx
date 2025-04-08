import React, { useEffect, useState } from "react";
import { BsBasket } from "react-icons/bs";
import useStore from "../store/AppStore";
import { cheking, formatRupiah } from "../utils/methods";
import { AnimatedModalTriger } from "./ui/AnimatedModalTriger";
import BoxModal from "./ui/BoxModal";
import withReactContent from "sweetalert2-react-content";
import Swal from "sweetalert2";
import { router, usePage } from "@inertiajs/react";
import { AiOutlineLoading3Quarters } from "react-icons/ai";
import Modal from "./ui/Modal";

function CardBasket({ handleSubmit, brand }) {
    const { auth } = usePage()?.props;
    const basket = useStore((state) => state.basket);
    const product = basket?.[0] || {}; // Cegah error jika basket kosong
    const quantity = useStore((state) => state.quantity);
    const voucherDiskon = useStore((state) => state.voucherDiskon);
    const paymentMethod = useStore((state) => state?.paymentMethod);
    const biaya = Number(paymentMethod?.[0]?.fee_fixed?.split(".")[0]) || 0;
    const getAll = useStore((state) => state.getAll); // Object
    const all = getAll(); // Ambil semua data
    const MySwal = withReactContent(Swal);
    const rules = brand?.rules?.field_input || [];
    const methodStore = useStore((state) => state?.paymentMethod);
    const { errors } = usePage().props;
    const [error, setError] = React.useState(null);
    const [isLoading, setIsLoading] = useState(false);
    const [isOpen, setIsOpen] = useState(false);
    useEffect(() => {
        setError(errors?.error);
        setIsOpen(false);
        if (errors?.error) {
            // click manasaja untuk tutup modal
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
        console.log(isPremium);
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
        <div className="hidden md:block">
            <div className="shadow-md  z-20 h-max p-4 dark:bg-card bg-white border-[#c4c4c4] dark:border-stone-600 border-1 border-dashed text-gray-800  mt-5 rounded-lg flex justify-center items-center">
                {basket?.length === 0 ? (
                    <h4 className="text-xs py-6 dark:text-dark-text text-[#5c5c5c]">
                        Belum ada item produk yang dipilih.
                    </h4>
                ) : (
                    <div className="w-full text-gray-800 rounded-lg">
                        <div className="flex items-center gap-4">
                            <img
                                src={
                                    product?.brand.image
                                        ? "/storage/" + product?.brand.image
                                        : "https://i.pinimg.com/736x/da/7e/79/da7e79f22cf7c28ce6c4bd5006f8a131.jpg"
                                }
                                alt="Kim Jieun"
                                className="w-16 h-16 rounded-md"
                            />
                            <div>
                                <h2 className="text-lg dark:text-dark-text font-semibold">
                                    {product?.name || "Produk Tidak Diketahui"}
                                </h2>
                                <p className="text-gray-500 dark:text-dark-text text-sm">
                                    {product?.brand?.name ||
                                        "Brand Tidak Diketahui"}
                                </p>
                            </div>
                        </div>
                        <div className="mt-4 text-sm space-y-3 border-t text-gray-500 dark:text-dark-text border-gray-300 pt-2">
                            <div className="flex  justify-between">
                                <span>Harga</span>
                                <span>
                                    {formatRupiah(product?.total_price || 0)}
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
                        </div>
                        <div className="mt-2 border-t border-gray-300 pt-2 flex justify-between text-lg dark:text-dark-text font-bold">
                            <span>Total Pembayaran</span>
                            <span className="text-orange-500">
                                {formatRupiah(total())}
                            </span>
                        </div>
                    </div>
                )}
            </div>
            <button
                className="w-full btn btn-primary dark:btn-secondary my-4"
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

export default CardBasket;
