import { motion } from "framer-motion";
import { formatDate } from "../../utils/methods";

const DetailPembelian = ({ datas = null }) => {
    // "27 Maret 2025 20:24:19"
    const product = datas?.product;
    const data = {
        kategori: product?.brand?.name,
        nominal: product?.name,
        username: "username",
        whatsapp: datas?.phone,
        waktuTransaksi: formatDate(datas?.created_at),
    };
    return (
        <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.5 }}
            className="max-w-md mx-auto text-sm dark:bg-card bg-white shadow-sm rounded-md md:rounded-lg p-2 md:p-3 dark:border-stone-700 border border-gray-100"
        >
            <div className="bg-primary dark:bg-secondary text-white text-sm font-semibold md:rounded-t-lg p-2">
                Detail Pembelian
            </div>
            <div className="p-1.5 space-y-3 text-gray-700">
                <DetailItem label="Kategori" value={data.kategori} bold />
                <DetailItem label="Nominal" value={data.nominal} bold />
                <DetailItem
                    label="Nomor WhatsApp"
                    value={data.whatsapp}
                    masked
                />
                <DetailItem
                    label="Waktu Transaksi"
                    value={data.waktuTransaksi}
                    bold
                />
            </div>
        </motion.div>
    );
};

const DetailItem = ({ label, value, bold, masked }) => {
    return (
        <motion.div
            initial={{ opacity: 0, x: -10 }}
            animate={{ opacity: 1, x: 0 }}
            transition={{ duration: 0.3 }}
            className="flex dark:border-stone-600 border-gray-200 text-xs px-1 items-center py-1 justify-between border-b"
        >
            <span className="text-gray-600 dark:text-dark-text">{label}</span>
            <span
                className={
                    bold
                        ? "font-semibold dark:text-dark-text"
                        : "dark:text-dark-text"
                }
            >
                {masked ? maskPhone(value) : value}
            </span>
        </motion.div>
    );
};

const maskPhone = (phone) => {
    return phone.replace(/(\d{3})\d+(\d{3})/, "$1******$2");
};

export default DetailPembelian;
