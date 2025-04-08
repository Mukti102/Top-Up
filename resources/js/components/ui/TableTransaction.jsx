import React, { useState } from "react";
import Badge from "./Badge";
import { GiNetworkBars } from "react-icons/gi";
import {
    formatDate,
    formatRupiah,
    maskInvoice,
    maskPhone,
    maskPrice,
} from "../../utils/methods";
import { Link, router, usePage } from "@inertiajs/react";
import axios from "axios";
import { route } from "ziggy-js";

function TableTransaction({ transactions = [] }) {
    const { auth } = usePage().props;
    const encryptId = async (id) => {
        router.post(
            route("get.detail.transaction", {
                id,
            })
        );
    };
    return (
        <div className="relative overflow-x-auto my-5 shadow-sm rounded-sm">
            <table className="w-full text-sm text-left rtl:text-right text-gray-600">
                <thead className="text-xs dark:bg-secondary bg-primary/90  text-gray-100 uppercase">
                    <tr>
                        <th
                            scope="col"
                            className="px-0 text-cemd:nter px-3 py-2 md:py-4"
                        >
                            No
                        </th>
                        <th scope="col" className="md:px-6 px-3 py-2 md:py-4">
                            Tanggal
                        </th>
                        <th
                            scope="col"
                            className="md:px-6 px-3 py-2 md:py-4 whitespace-nowrap"
                        >
                            Nomor Invoice
                        </th>
                        <th scope="col" className="md:px-6 px-3 py-2 md:py-4">
                            No. Handphone
                        </th>
                        <th scope="col" className="md:px-6 px-3 py-2 md:py-4">
                            Harga
                        </th>
                        <th
                            scope="col"
                            className="md:px-6 px-3 py-2 md:py-4 md:whitespace-wrap whitespace-nowrap"
                        >
                            Status
                        </th>
                        {auth?.user && (
                            <th
                                scope="col"
                                className="md:px-6 px-3 py-2 md:py-4"
                            >
                                Aksi
                            </th>
                        )}
                    </tr>
                </thead>
                <tbody>
                    {transactions.length > 0 ? (
                        transactions.map((transaction, index) => (
                            <tr
                                key={index}
                                className="bg-white  dark:bg-card dark:text-dark-text md:text-xs text-xs dark:border-stone-700 border-gray-100 border-b"
                            >
                                <th
                                    scope="row"
                                    className="px-3 text-center  px-3 md:-500 py-2 md:py-4 font-normal whitespace-nowrap "
                                >
                                    {index + 1}
                                </th>
                                <th
                                    scope="row"
                                    className="px-3 md:px-6 py-2 md:py-4 font-normal whitespace-nowrap "
                                >
                                    {formatDate(transaction.updated_at)}
                                </th>
                                <td className="px-3 md:px-6 py-2 md:py-4 whitespace-nowrap">
                                    {maskInvoice(transaction.reference_number)}
                                </td>
                                <td className="px-3 md:px-6 py-2 md:py-4">
                                    {maskPhone(transaction.phone)}
                                </td>
                                <td className="px-3 md:px-6 py-2 md:py-4 whitespace-nowrap">
                                    {maskPrice(formatRupiah(transaction.price))}
                                </td>
                                <td className="px-3  md:px-6 py-2 md:py-4 capitalize md:whitespace-wrap whitespace-nowrap">
                                    <Badge
                                        className={"md:text-[10px] text-[9px]"}
                                        status={transaction.status}
                                    >
                                        {transaction.status == "pending"
                                            ? "Menunggu Pembayaran"
                                            : transaction.status == "processing"
                                            ? " Sedang Diproses..."
                                            : transaction.status == "failed"
                                            ? "Gagal"
                                            : "Selesai"}
                                    </Badge>
                                </td>
                                {auth?.user && (
                                    <td className="px-2 md:px-6 py-1.5 md:py-4 capitalize">
                                        <button
                                            onClick={() =>
                                                encryptId(transaction?.id)
                                            }
                                            className="btn btn-xs dark:btn-secondary btn-primary"
                                        >
                                            Lihat
                                        </button>
                                    </td>
                                )}
                            </tr>
                        ))
                    ) : (
                        <tr>
                            <td
                                colSpan="7"
                                className="text-center  py-4 text-gray-500"
                            >
                                <div className="w-full  flex flex-col justify-between items-center space-y-2 text-gray-300 py-8">
                                    <GiNetworkBars className="text-8xl" />
                                    <span className="font-semibold">
                                        Tidak ada transaksi tersedia
                                    </span>
                                </div>
                            </td>
                        </tr>
                    )}
                </tbody>
            </table>
        </div>
    );
}

export default TableTransaction;
