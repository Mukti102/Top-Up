import BoxProduct from "@/components/BoxProduct";
import Input from "@/components/Input";
import Breadcrumb from "@/components/ui/Breadcrumb";
import MainLayout from "@/layouts/MainLayout";
import { formatRupiah } from "@/utils/methods";
import { Link, router, useForm } from "@inertiajs/react";
import React, { useEffect } from "react";
import { MdManageHistory } from "react-icons/md";
import Swal from "sweetalert2";
import { route } from "ziggy-js";

function Deposit(props) {
    const { paymentMethods } = props;
    const items = [{ label: "Deposit", current: true }];
    const type = [...new Set(paymentMethods.map((e) => e?.type))];
    const [methodStore, setMethodStore] = React.useState(null);
    const { data, setData, post, processing, errors } = useForm({
        amount: "",
        payment_method: "",
    });

    useEffect(() => {
        if (errors?.message) {
            setData("amount", "");
            setData("payment_method", "");
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
                icon: "error",
                title: errors.message,
            });
        }
    }, [errors?.message]);

    const submit = (e) => {
        e.preventDefault();
        post(route("deposit.post"), {
            preserveScroll: true,
        });
    };

    const formatCurrency = (value) => {
        // Hapus semua karakter kecuali angka
        const numericValue = value.replace(/\D/g, "");

        // Format ke bentuk ribuan dengan koma
        return new Intl.NumberFormat("id-ID").format(numericValue);
    };

    const getRawAmount = () => {
        return Number(data.amount.replace(/\D/g, "")) || 0;
    };

    const isValid = (minimumAmount, maxAmount) => {
        const rawAmount = getRawAmount();
        const minimun = Number(minimumAmount || 0);
        const max = Number(maxAmount || 0);
        return rawAmount >= minimun && rawAmount <= max;
    };

    return (
        <form
            onSubmit={submit}
            className="pt-8 text-gray-600 space-y-10 px-2 md:px-7"
        >
            <div className="md:px-20 px-1 pt-14 space-y-5">
                <Breadcrumb items={items} />
                <div className="flex justify-between">
                    {/* balance */}
                    <div className="space-y-3">
                        <div className="text-3xl dark:text-dark-text font-semibold">
                            <h2>Deposit Saldo</h2>
                        </div>
                        <div>
                            <h3 className="text-sm dark:text-dark-text/60 text-gray-500">
                                Saldo Member
                            </h3>
                            <span className="text-black dark:text-dark-text font-semibold text-[1.2rem]">
                                Rp 0
                            </span>
                        </div>
                    </div>
                    {/* history button */}
                    {/* <div>
                        <button className="btn rounded-full btn-md btn-primary">
                            <MdManageHistory className="text-2xl" />
                            Riwayat Deposit
                        </button>
                    </div> */}
                </div>
                <div></div>
                <BoxProduct title={"Masukkan Jumlah Deposit"} number={"1"}>
                    <div className="md:w-1/3 w-[80%] p-3">
                        <Input
                            label={"Jumlah Deposit"}
                            placeholder={"Masukkan Jumlah Deposit"}
                            isRequired={true}
                            value={data.amount}
                            type="text"
                            hasError={errors?.amount}
                            onChange={(e) => {
                                const rawValue = e.target.value;
                                const numericValue = rawValue.replace(
                                    /\D/g,
                                    ""
                                ); // Hanya angka
                                setData("amount", formatCurrency(numericValue)); // Format ke ribuan
                            }}
                            onKeyDown={(e) => {
                                if (["-", "+", "e"].includes(e.key)) {
                                    e.preventDefault();
                                }
                            }}
                        />
                    </div>
                </BoxProduct>
                <BoxProduct title={"Pilih Metode Pembayaran"} number={"2"}>
                    <div className="w-full p-2.5 md:p-5 space-y-3">
                        {type?.map((method, index) => {
                            const methods = paymentMethods.filter(
                                (e) => e?.type == method
                            );
                            return (
                                <div key={index}>
                                    <div className="font-semibold">
                                        <h1>{method}</h1>
                                    </div>
                                    <div className="grid mt-3 grid-cols-2 md:grid-cols-4 space-y-3 gap-2 md:gap-3">
                                        {methods?.map((item) => (
                                            <div
                                                disabled={
                                                    !isValid(
                                                        item?.minimum_amount,
                                                        item?.maximum_amount
                                                    )
                                                }
                                                key={item.id}
                                                onClick={() => {
                                                    setMethodStore(item);
                                                    setData(
                                                        "payment_method",
                                                        item.id
                                                    );
                                                }}
                                                className={`cursor-pointer transition-all ease-in-out h-28 duration-300 group border-2 active:border-transparent rounded-xl ${
                                                    methodStore?.id === item.id
                                                        ? "border-2 dark:text-dark-text dark:bg-secondary/5 bg-primary/5 border-primary dark:border-secondary text-gray-800 dark:shadow-0 "
                                                        : "border-gray-50 shadow-sm dark:border-stone-800 dark:hover:border-secondary dark:bg-dark/50 bg-slate-50"
                                                }`}
                                            >
                                                <div className="p-3">
                                                    <div className="flex w-16 flex-col gap-2 items-start">
                                                        <img
                                                            className={`bg-blend-difference object-cover w-full h-full filter ${
                                                                isValid(
                                                                    item?.minimum_amount,
                                                                    item?.maximum_amount
                                                                )
                                                                    ? ""
                                                                    : "grayscale"
                                                            }`}
                                                            src={
                                                                item?.img ||
                                                                item?.img_url
                                                            }
                                                            alt=""
                                                        />
                                                        <div className="text-xs font-medium">
                                                            {getRawAmount()
                                                                ? formatRupiah(
                                                                      (Number(
                                                                          item?.fee_fixed
                                                                      ) || 0) +
                                                                          getRawAmount()
                                                                  )
                                                                : "0"}
                                                        </div>
                                                    </div>
                                                </div>
                                                <div className="flex p-1.5 justify-start dark:border-stone-700 dark:text-dark-text/60 border-t-[0.5px] border-gray-300 gap-2 text-[9px] text-gray-600 italic">
                                                    <p>
                                                        Di cek Secara Otomatis
                                                    </p>
                                                </div>
                                            </div>
                                        ))}
                                    </div>
                                </div>
                            );
                        })}
                    </div>
                    <div className="text-xs p-6 italic">
                        <p>
                            Dengan klik tombol Deposit, kamu sudah menyetujui
                            <Link
                                href="/terms"
                                className="text-primary dark:text-secondary"
                            >
                                {" "}
                                Syarat & Ketentuan
                            </Link>{" "}
                            yang berlaku
                        </p>
                    </div>
                </BoxProduct>
            </div>
            <div className="fixed bottom-0 right-0 left-0 w-full flex justify-between md:px-20 items-center p-3 dark:bg-card bg-white">
                <div>
                    <h4 className="md:text-xs dark:text-dark-text text-[10px] text-gray-500">
                        Total Pembayaran
                    </h4>
                    <h1 className="font-semibold dark:text-dark-text text-sm md:text-lg">
                        {getRawAmount()
                            ? formatRupiah(
                                  (Number(methodStore?.fee_fixed) || 0) +
                                      getRawAmount()
                              )
                            : "-"}
                    </h1>
                    <h4 className="ms:text-xs text-[10px] dark:text-dark-text/80 mt-1 text-gray-500">
                        Metode pembayaran:{" "}
                        {methodStore ? methodStore.type : "-"}
                    </h4>
                </div>
                <div>
                    <button
                        type="submit"
                        className="btn rounded-full px-9 md:px-20 btn-lg text-sm md:text-sm dark:btn-secondary btn-primary  md:btn-wide btn-md"
                        disabled={!data.amount || !data.payment_method}
                    >
                        Deposit
                    </button>
                </div>
            </div>
        </form>
    );
}

export default Deposit;

Deposit.layout = (page) => <MainLayout>{page}</MainLayout>;
