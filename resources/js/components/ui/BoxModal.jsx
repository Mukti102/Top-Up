import React from "react";
import useStore from "../../store/AppStore";
import { cheking, formatRupiah } from "../../utils/methods";
import { Link } from "@inertiajs/react";

function BoxModal() {
    const getAll = useStore((state) => state.getAll); // Object
    const all = getAll(); // Ambil semua data
    const isComplete = cheking(all);
    const accounts = Object.entries(all?.acount).map(([key, value]) => ({
        key,
        value,
    }));
    return (
        <div className="text-gray-900 text-start">
            <h1 className="font-bold text-2xl">Konfirmasi Pembelian</h1>
            {/* product */}
            <div className="mt-4 mb-2 rounded-lg  border-gray-200 border-[1px]  bg-gray-50 text-xs">
                <div className="flex justify-between border-gray-200  border-b p-2.5">
                    <span className="text-gray-800 text-xs">Nominal</span>
                    <span className="font-medium">{all?.basket[0]?.name}</span>
                </div>
                {accounts?.map((item, index) => (
                    <div
                        key={index}
                        className="flex justify-between border-gray-200  border-b p-2.5"
                    >
                        <span className="text-gray-800 text-xs">
                            {item?.key}
                        </span>
                        <span className="font-medium">{item?.value}</span>
                    </div>
                ))}
                <div className="flex justify-between border-gray-200  border-b p-2.5">
                    <span className="text-gray-800 text-xs">Nomor HP</span>
                    <span className="font-medium">
                        {all?.contact?.Telephone}
                    </span>
                </div>
                <div className="flex justify-between border-gray-200  border-b p-2.5">
                    <span className="text-gray-800 text-xs">Email</span>
                    <span className="font-medium">
                        {all?.contact?.Email ? all?.contact?.Email : "-"}
                    </span>
                </div>
                <div className="flex justify-between border-gray-200  border-b p-2.5">
                    <span className="text-gray-800 text-xs">
                        Metode Pembayaran
                    </span>
                    <span className="font-medium">
                        {all?.paymentMethod[0]?.name}
                    </span>
                </div>
                <div className="flex justify-between p-2.5">
                    <span className="text-gray-800 text-xs">
                        Total Pembayaran
                    </span>
                    <span className="font-medium text-blue-600">
                        {formatRupiah(
                            (all?.basket[0]?.total_price || 0) * all?.quantity +
                                Number(all?.paymentMethod[0]?.fee_fixed)
                        )}
                    </span>
                </div>
            </div>
            <div className="text-xs mt-5 text-gray-600">
                <p>
                    Dengan klik tombol Lanjutkan Pembayaran, kamu sudah
                    menyetujui{" "}
                    <Link className="text-primary hover:underline">
                        Syarat & Ketentuan
                    </Link>{" "}
                    yang berlaku
                </p>
            </div>
        </div>
    );
}

export default BoxModal;
