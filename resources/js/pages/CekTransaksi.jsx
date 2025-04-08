import React, { useEffect, useRef, useState } from "react";
import MainLayout from "../layouts/MainLayout";
import Input from "../components/Input";
import { BsSearch } from "react-icons/bs";
import TableTransaction from "../components/ui/TableTransaction";
import axios from "axios";
import "animate.css";
import Swal from "sweetalert2";
import Breadcrumb from "@/components/ui/Breadcrumb";
import { Head } from "@inertiajs/react";

function CekTransaksi(props) {
    const breadcrumbItems = [
        { label: "Cek Transaksi", href: "/cek/transaksi", current: true },
    ];

    const { transactions } = props;
    const [value, setValue] = useState("");
    const [isLoading, setIsLoading] = useState(false);
    const [data, setData] = useState([]);
    const [hasSearched, setHasSearched] = useState(false);
    useEffect(() => {
        if (transactions?.length > 0) {
            setData(transactions);
        }
    }, []);

    const tableRef = useRef(null);
    useEffect(() => {
        if (hasSearched && data?.length > 0) {
            tableRef.current?.scrollIntoView({ behavior: "smooth" });
        }
    }, [data, hasSearched]);

    const handleSubmit = async (e) => {
        e.preventDefault();
        setIsLoading(true);

        const response = await axios
            .post("/api/cek/transaksi", {
                reference_number: value,
            })
            .then((res) => {
                setIsLoading(false);
                setData([res?.data]);
                Swal.fire({
                    title: "Berhasil",
                    text: "Cek di Table Bawah",
                    icon: "success",
                    showClass: {
                        popup: `
                        animate__animated
                        animate__fadeInUp
                        animate__faster
                      `,
                    },
                    hideClass: {
                        popup: `
                        animate__animated
                        animate__fadeOutDown
                        animate__faster
                      `,
                    },
                });
                setHasSearched(true); // Tandai bahwa pencarian telah dilakukan
            })
            .catch((err) => {
                setIsLoading(false);
                setData([]);
                const message = err?.response?.data?.message;
                Swal.fire({
                    title: "Not Found",
                    text: message,
                    icon: "info",
                    showClass: {
                        popup: `
                        animate__animated
                        animate__fadeInUp
                        animate__faster
                      `,
                    },
                    hideClass: {
                        popup: `
                        animate__animated
                        animate__fadeOutDown
                        animate__faster
                      `,
                    },
                });
            });
    };

    return (
        <>
            <Head>
                <title>Cek Transaksi</title>
            </Head>
            <div className="space-y-10 px-3 md:px-7 pb-10">
                {/* main */}
                <div className="mdLspace-y-6 space-y-3 dark:text-dark-text  text-gray-800">
                    {/* text */}
                    <div className="md:space-y-4 space-y-2 w-full">
                        <h1 className="md:text-3xl  text-xl font-bold">
                            Lacak pesanan kamu dengan nomor invoice!
                        </h1>
                        <p className="md:text-sm text-xs dark:text-dark-text/60 text-gray-600">
                            Pesanan Kamu tidak terdaftar meskipun Kamu yakin
                            telah memesan? Harap tunggu 1-5 menit. Tetapi jika
                            pesanan masih belum muncul, Kamu bisa Hubungi Kami.
                        </p>
                    </div>
                    <form
                        onSubmit={handleSubmit}
                        className="md:w-1/2 w-[90%] space-y-2 md:space-y-3"
                    >
                        <Input
                            className={"border-[1px] border-gray-200"}
                            label={"Masukkan No Invoice Kamu"}
                            placeholder={"TRX-xxxxx"}
                            isRequired={false}
                            type="text"
                            value={value}
                            onChange={(e) => setValue(e?.target.value)}
                        />
                        <button
                            type="submit"
                            className="btn 
                            md:btn-sm btn-sm btn-primary dark:btn-secondary flex gap-2"
                        >
                            {" "}
                            {isLoading ? (
                                <div className="flex gap-2">
                                    <span className="loading loading-xs loading-spinner text-white"></span>
                                    <span>Loading...</span>
                                </div>
                            ) : (
                                <>
                                    <BsSearch />
                                    Cek Transaksi
                                </>
                            )}
                        </button>
                    </form>
                </div>
                {/* tables result transaksi */}
                <div>
                    <div className="space-y-1 w-full md:w-[60%] text-gray-700">
                        <h3 className="font-bold text-xl dark:text-dark-text text-gray-600">
                            Transaksi Realtime
                        </h3>
                        <p className="md:text-[0.8rem] dark:text-dark-text/60 text-xs text-gray-500">
                            Ini adalah transaksi real-time dari semua pengguna.
                            Informasi yang tersedia mencakup tanggal transaksi,
                            kode invoice, nomor ponsel, harga, dan status.,
                            untuk bisa melihat detail transaksi pribadi silahkan
                            singin terlebih dahulu
                        </p>
                    </div>
                    <div ref={tableRef}>
                        <TableTransaction transactions={data} />
                    </div>
                </div>
            </div>
        </>
    );
}

CekTransaksi.layout = (page) => (
    <MainLayout
        items={[
            { label: "Cek Transaksi", link: "cek.transaction", current: true },
        ]}
    >
        {page}
    </MainLayout>
);
export default CekTransaksi;
