import { motion } from "framer-motion";
import { useState } from "react";
import { Copy, CheckCircle } from "lucide-react";
import { formatRupiah } from "../../utils/methods";
import Modal from "./Modal";
import { Link } from "@inertiajs/react";
import GuidPay from "./GuidPay";

const DetailPembayaran = ({ transaction }) => {
    const [copied, setCopied] = useState(false);
    const [loading, setLoading] = useState(false);
    const [isOpen, setIsOpen] = useState(false);
    const response = JSON.parse(transaction?.response);
    const copyToClipboard = () => {
        navigator.clipboard.writeText(response?.pay_code);
        setCopied(true);
        setTimeout(() => setCopied(false), 2000);
    };

    const downloadQr = (url) => {
        if (typeof document !== "undefined") {
            const fileName = url.split("/").pop();
            const aTag = document.createElement("a");
            aTag.href = url;
            aTag.setAttribute("download", fileName);
            document.body.append(aTag);
            aTag.click();
            document.body.removeChild(aTag);
        }
    };

    return (
        <motion.div
            className=" md:mx-auto w-full p-2 md:p-3 dark:bg-card  bg-white text-black dark:border-stone-700 border-gray-100 text-sm dark:shadow-md shadow-sm rounded-xl border"
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.5 }}
        >
            <h2 className="font-semibold text-base shadow-sm dark:bg-secondary  bg-primary text-white p-2 rounded-t-lg md:rounded-t-lg">
                Detail Pembayaran
            </h2>
            <div className="p-1">
                <DetailItem
                    label="Nomor Invoice"
                    value={transaction?.reference_number}
                    bold
                />
                <DetailItem
                    label="Status Transaksi"
                    value={
                        <span
                            className={`px-3 py-1 capitalize font-semibold rounded-full text-xs border-1 ${
                                transaction?.status == "pending"
                                    ? "border-yellow-300 bg-yellow-50 text-yellow-500"
                                    : transaction?.status == "failed"
                                    ? "border-red-300 bg-red-50 text-red-500"
                                    : "border-green-300 bg-green-50 text-green-500"
                            } `}
                        >
                            {transaction?.status === "processing"
                                ? "Pembayaran Berhasil"
                                : transaction?.status == "success"
                                ? "Selesai"
                                : transaction?.status == "failed"
                                ? "gagal"
                                : "Belum Bayar"}
                        </span>
                    }
                />
                <DetailItem
                    label="Total Pembayaran"
                    value={formatRupiah(transaction?.price)}
                    bold
                />
                <div className="border mt-7 flex flex-col dark:border-stone-700  border-gray-300 rounded-lg ">
                    <div className="border-b-1 dark:border-stone-700 border-gray-300 dark:text-dark-text py-5 flex justify-between px-4">
                        <div>
                            <img
                                className="w-16"
                                src={transaction?.payment_method?.img_url}
                                alt=""
                            />
                        </div>
                        <div>
                            <h3>{transaction?.payment_method?.name} VA</h3>
                        </div>
                    </div>
                    <div className="flex flex-col justify-center items-center">
                        <div className="py-1 mt-5 text-center">
                            <p className="text-sm font-semibold  dark:text-dark-text   text-gray-500">
                                Kode Pembayaran / VA
                            </p>
                        </div>
                        <div className="flex gap-2 dark:text-dark-text">
                            {response?.pay_code ? (
                                <>
                                    <p className="text-xl font-semibold">
                                        {response?.pay_code}
                                    </p>
                                    <button
                                        onClick={copyToClipboard}
                                        className="text-primary dark:text-secondary  mx-0.5 cursor-pointer hover:text-primary/80 transition"
                                    >
                                        {copied ? (
                                            <CheckCircle size={15} />
                                        ) : (
                                            <Copy size={15} />
                                        )}
                                    </button>
                                </>
                            ) : response?.pay_url ? (
                                <>
                                    <a href={response?.pay_url}>
                                        Lanjut Pembayaran
                                    </a>
                                </>
                            ) : response?.qr_url ? (
                                <div className="my-3  flex-col flex items-center">
                                    <div className="w-38 out-shadow p-1 rounded-md bg-">
                                        <img
                                            className="w-full bg-white "
                                            src={response?.qr_url}
                                            alt=""
                                        />
                                    </div>
                                    <button
                                        onClick={() =>
                                            downloadQr(response?.qr_url)
                                        }
                                        className="mx-auto btn-xs my-3 rounded-full text-[10px] bg-white shadow-sm p-1 cursor-pointer active:shadow-inner text-primary px-3"
                                    >
                                        {loading ? "Downloading..." : "Lihat"}
                                    </button>
                                </div>
                            ) : (
                                <>
                                    <h1 className="text-xl text-gray-400 font-bold my-1 ">
                                        -
                                    </h1>
                                </>
                            )}
                        </div>
                    </div>
                    <motion.button
                        onClick={() => setIsOpen(true)}
                        whileHover={{ scale: 1.02 }}
                        whileTap={{ scale: 0.95 }}
                        className="w-max mt-3 mb-5 shadow-md px-6 text-xs mx-auto cursor-pointer dark:bg-secondary bg-primary text-white py-2 rounded-full"
                    >
                        Petunjuk Pembayaran
                    </motion.button>
                    <Modal
                        isOpen={isOpen}
                        onClose={() => setIsOpen(false)}
                        title="Petunjuk Pembayaran"
                    >
                        <GuidPay guides={response?.instructions} />
                    </Modal>
                </div>
            </div>
        </motion.div>
    );
};

const DetailItem = ({ label, value, bold }) => (
    <div className="flex  dark:border-stone-600 border-gray-200 justify-between border-b items-center py-3 ">
        <span className="text-gray-600 dark:text-dark-text">{label}</span>
        <span
            className={
                bold ? "font-semibold dark:text-dark-text" : " text-gray-800"
            }
        >
            {value}
        </span>
    </div>
);

export default DetailPembayaran;
