import React, { useEffect, useState } from "react";
import { motion } from "framer-motion";
function PercentageStatusPayment({ transaction, timeLeftPercentage }) {
    const [status, setStatus] = useState(transaction?.status);
    const [percentage, setPercentage] = useState({});
    const checkStatus = (transaction) => {
        if (transaction?.status_payment === "expired") {
            setStatus("Kadaluarsa");
            setPercentage({
                width: "100%",
                color: "bg-red-500",
                description:
                    "Transaksi Kadaluarsa 😣, Kamu Melebiihi Batas Waktu Pembayaran , Lakukan Transaksi Ulang Untuk Melanjutkan",
            });
        } else if (transaction?.status === "success") {
            setStatus("Transaki complete");
            setPercentage({
                width: "100%",
                color: "bg-green-500",
                description:
                    "Transaksi selesai. Terimakasi Sudah bertranksaksi di ... 👌",
            });
        } else if (transaction?.status === "processing") {
            setStatus("Pembayaran Berhasil Dan Sedang Diproses");
            setPercentage({
                width: "70%",
                color: "bg-cyan-500",
                description:
                    "Kami Sudah Menerima Pembayaran Anda, Dan Sedang Diproses",
            });
        } else if (
            status?.status_payment === "failed" ||
            transaction?.status == "failed"
        ) {
            setStatus("Pembayaran Gagal");
            setPercentage({
                width: "100%",
                color: "bg-red-500",
                decription: "Pembayaran Gagal, Silahkan Coba Lagi",
            });
        } else {
            setStatus("Menunggu Pembayaran");
            setPercentage({
                width: `${timeLeftPercentage}%`,
                color: "bg-yellow-500",
                description:
                    " Segera lakukan pembayaran sebelum batas waktu yang ditentukan",
            });
        }
    };

    useEffect(() => {
        checkStatus(transaction);
    }, [transaction]);
    return (
        <div className="flex flex-col md:px-0 px-2 items-center pt-20 w-full py-5 space-y-2">
            <h2 className="md:text-2xl text-center text-lg dark:text-dark-text  text-black font-bold">
                {status}
            </h2>
            <motion.div className="w-full inner-shadow max-w-2xl h-2.5  md:h-4 mt-0 md:mt-3 rounded-full  relative overflow-hidden">
                <motion.div
                    className={`absolute h-full ${percentage.color}`}
                    initial={{ width: `0%` }}
                    animate={{ width: `${percentage?.width}` }}
                    transition={{ duration: 1, ease: "easeOut" }}
                />
            </motion.div>
            <p className="text-gray-600 text-[11px] dark:text-dark-text text-center md:text-sm">
                {percentage?.description}
            </p>
        </div>
    );
}

export default PercentageStatusPayment;
