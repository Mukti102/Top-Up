import React, { useEffect, useState } from "react";
import CountdownTimer from "../components/ui/CountDownTimer";
import { motion } from "framer-motion";
import PercentageStatusPayment from "../components/ui/PercentageStatusPayment";
import DetailPembelian from "../components/ui/DEtailPembelian";
import DetailPembayaran from "../components/ui/DetailPembayaran";
import MainLayout from "../layouts/MainLayout";
function DetailTransaction({ transaction }) {
    const response = JSON.parse(transaction?.response);
    const expiredTime = response?.expired_time;
    return (
        <div className="md:p-5 p-1">
            <div className="space-y-1">
                <PercentageStatusPayment
                    transaction={transaction}
                    timeLeftPercentage={"20"}
                />
                <CountdownTimer
                    transaction={transaction}
                    expiredTime={expiredTime}
                />
            </div>

            <div className="grid grid-cols-1 md:grid-cols-12 gap-5 mt-5">
                {/* PEMBELIAN pindah ke atas di mobile, kanan di desktop */}
                <div className="md:col-span-4 order-1 md:order-2 space-y-5">
                    <DetailPembelian datas={transaction} />
                </div>

                {/* PEMBAYARAN pindah ke bawah di mobile, kiri di desktop */}
                <div className="md:col-span-8 order-2 md:order-1 w-full space-y-5">
                    <DetailPembayaran transaction={transaction} />
                </div>
            </div>
        </div>
    );
}

export default DetailTransaction;

DetailTransaction.layout = (page) => <MainLayout>{page}</MainLayout>;
