import { Link, router, useForm, usePage } from "@inertiajs/react";
import React, { useEffect } from "react";
import { route } from "ziggy-js";
import Swal from "sweetalert2";
import "animate.css";
import BaseInput from "@/components/ui/BaseInput";
import MainLayout from "@/layouts/MainLayout";

export default function OtpForgotPassword() {
    const { phone, flash, Setting } = usePage().props;
    const OTPSvg = "/storage/" + Setting?.["OTP.svg"];
    const { data, setData, post, processing, errors } = useForm({
        otp: "",
        phone: phone,
    });

    function submit(e) {
        e.preventDefault();
        post(route("verify.otp.password"), {
            preserveScroll: true,
        });
    }

    const sendOtpAgain = () => {
        if (!phone) {
            Swal.fire({
                icon: "error",
                title: "Gagal!",
                text: "Nomor telepon tidak ditemukan.",
            });
            return;
        }

        router.post(
            route("forgot.post"),
            { phone },
            {
                preserveScroll: true,
                onSuccess: (page) => {
                    Swal.fire({
                        icon: "success",
                        title: "OTP telah dikirim kembali!",
                        toast: true,
                        position: "top-end",
                        showConfirmButton: false,
                        timer: 3000,
                        timerProgressBar: true,
                    });
                },
                onError: (errors) => {
                    Swal.fire({
                        icon: "error",
                        title: "Gagal mengirim ulang OTP",
                        text: errors.phone || "Terjadi kesalahan. Coba lagi.",
                    });
                },
            }
        );
    };

    useEffect(() => {
        if (flash?.success) {
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
                title: flash.success,
            }); // Menampilkan alert saat OTP dikirim ulang
        }
    }, [flash]);

    useEffect(() => {
        if (errors.message) {
            setData("otp", "");
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
    }, [errors.message]);

    return (
        <>
            <div className="bg-white dark:bg-dark md:pt-0 pt-9 h-max md:pb-0 pb-20 md:h-screen px-0 md:px-28 grid grid-cols-1 md:grid-cols-2">
                <div className="flex justify-between items-center">
                    <img
                        className="mx-auto w-32 md:w-96"
                        src={OTPSvg}
                        alt="forgot password"
                    />
                </div>
                <div className="flex min-h-full flex-1 flex-col justify-center px-3 md:px-6 py-7 md:py-12 lg:px-8">
                    <div className="sm:mx-auto sm:w-full sm:max-w-sm">
                        <h1 className="text-3xl dark:text-dark-text text-gray-600 font-black">
                            Verifikasi OTP NAMA
                        </h1>
                        <h2 className="mt-2 text-[0.9rem] dark:text-dark-text/90 font-normal text-gray-500">
                            Masukkan kode otp yang kami kirimkan ke nomor
                            whatsapp {phone}
                        </h2>
                    </div>

                    <div className="md:mt-10 mt-5 sm:mx-auto sm:w-full sm:max-w-sm">
                        <form onSubmit={submit} className="space-y-5">
                            {/* Input otp */}
                            <BaseInput
                                label="Masukkan OTP"
                                name="otp"
                                value={data.otp}
                                placeholder={"Kode OTP"}
                                autocomplete={false}
                                handleChange={(e) =>
                                    setData("otp", e.target.value)
                                }
                                isRequired={true}
                                type="number"
                                error={errors.otp}
                            />

                            {/* Tombol submit */}
                            <div className="space-y-3">
                                <button
                                    type="submit"
                                    className={`btn btn-md rounded-md py-5 btn-primary dark:btn-secondary w-full disabled:bg-gray-300`}
                                >
                                    {/* spiner */}
                                    {processing ? (
                                        <div className="space-x-3 flex items-center">
                                            <span className="loading loading-spinner loading-xs"></span>
                                            <span>Loading...</span>
                                        </div>
                                    ) : (
                                        "Lupa Password"
                                    )}
                                </button>
                            </div>
                        </form>
                        <button
                            onClick={() => sendOtpAgain()}
                            className={`btn my-3 btn-md rounded-md bg-gray-200 py-5 btn-primary/60 dark:text-gray-800 dark:btn-secondary/60 w-full disabled:bg-gray-300`}
                        >
                            Kirim Ulang
                        </button>
                    </div>
                </div>
            </div>
        </>
    );
}

OtpForgotPassword.layout = (page) => <MainLayout>{page}</MainLayout>;
