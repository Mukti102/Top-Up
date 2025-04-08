import React, { useState } from "react";
import BoxProduct from "../BoxProduct";
import CardProduct from "../CardProduct";
import Input from "../Input";
import { BsTicketPerforatedFill } from "react-icons/bs";
import { GiTicket } from "react-icons/gi";
import { useForm, usePage } from "@inertiajs/react";
import axios from "axios";
import { AiOutlineLoading3Quarters } from "react-icons/ai";
import Swal from "sweetalert2";
import useStore from "@/store/AppStore";
import Modal from "../ui/Modal";
function BoxPromo() {
    const { kupon } = usePage().props;
    const [kode, setKode] = useState("");
    const basket = useStore((state) => state.basket);
    const voucherDiskon = useStore((state) => state.voucherDiskon);
    const setVoucherDiskon = useStore((state) => state.setVoucherDiskon);
    const [error, setError] = useState(null);
    const [loading, setLoading] = useState(false);
    const [isOpen, setIsOpen] = useState(false);
    const handleSubmit = async (e) => {
        e.preventDefault();

        if (basket.length == 0) {
            Swal.fire({
                title: "Error",
                text: "Pilih produk terlebih dahulu",
                icon: "error",
            });
            return;
        }

        setLoading(true);
        setError(null);

        try {
            const response = await axios.post(route("get.diskon"), {
                code: kode,
            });
            setVoucherDiskon(response.data); // Simpan respons diskon
            const Toast = Swal.mixin({
                toast: true,
                position: "top-end",
                showConfirmButton: false,
                timer: 3000,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener("mouseenter", Swal.stopTimer);
                    toast.addEventListener("mouseleave", Swal.resumeTimer);
                },
            });
            Toast.fire({
                icon: "success",
                title: "Kode Promo Berhasil Digunakan",
            });
        } catch (err) {
            setError(err.response?.data?.message || "Terjadi kesalahan");
            Swal.fire({
                title: "Error",
                text: err.response?.data?.message || "Terjadi kesalahan",
                icon: "error",
            });
        } finally {
            setLoading(false);
        }
    };

    return (
        <>
            <BoxProduct number={"3"} title={"Kode Promo"}>
                <form
                    onSubmit={handleSubmit}
                    className="flex gap-3 p-3 items-center"
                >
                    <Input
                        onChange={(e) => setKode(e.target.value)}
                        value={kode}
                        type="text"
                        placeholder="Masukkan Kode Promo"
                    />
                    <div className="flex gap-1 items-center">
                        <button
                            type="submit"
                            className="btn btn-sm btn-primary dark:btn-secondary"
                        >
                            {loading ? (
                                <div className="flex items-center  justify-center gap-2 w-full">
                                    <AiOutlineLoading3Quarters className="animate-spin" />
                                    <span>Processing…</span>
                                </div>
                            ) : (
                                "Gunakan"
                            )}
                        </button>
                    </div>
                </form>
                <button className="flex mx-3  gap-2 btn btn-xs btn-primary dark:btn-secondary">
                    <span className="text-lg">
                        <GiTicket />
                    </span>
                    <button onClick={() => setIsOpen(true)}>
                        Pakai Promo Yang Tersedia
                    </button>
                    <Modal
                        onClose={() => setIsOpen(false)}
                        isOpen={isOpen}
                        title="Voucer Promo yang tersedia"
                    >
                        <h1 className="text-center dark:text-gray-500 text-gray-300">
                            Belum Ada promo
                        </h1>
                    </Modal>
                </button>
            </BoxProduct>
        </>
    );
}

export default BoxPromo;
