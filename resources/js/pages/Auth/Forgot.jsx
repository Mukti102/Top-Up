import { Link, useForm, usePage } from "@inertiajs/react";
import React, { useEffect } from "react";
import { route } from "ziggy-js";
import Swal from "sweetalert2";
import "animate.css";
import BaseInput from "@/components/ui/BaseInput";
import MainLayout from "@/layouts/MainLayout";

export default function Forgot() {
    const { Setting } = usePage().props; // Mengambil data user dari Inertia
    const ForgotSvg = "/storage/" + Setting?.["forgot.svg"];
    const { data, setData, post, processing, errors } = useForm({
        phone: "",
    });

    function submit(e) {
        e.preventDefault();
        post(route("forgot.post"), {
            preserveScroll: true,
        });
    }

    useEffect(() => {
        if (errors.message) {
            setData("phone", "");
            setData("password", "");
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
            <div className="bg-white dark:bg-dark md:pt-10 pt-22 h-max md:pb-0 pb-20 md:h-screen px-0 md:px-28 grid grid-cols-1 md:grid-cols-2">
                <div className="flex justify-between items-center">
                    <img
                        className="mx-auto w-32 md:w-96"
                        src={ForgotSvg}
                        alt="forgot password"
                    />
                </div>
                <div className="flex min-h-full flex-1 flex-col justify-center px-3 md:px-6 py-7 md:py-12 lg:px-8">
                    <div className="sm:mx-auto sm:w-full sm:max-w-sm">
                        <h1 className="text-3xl dark:text-dark-text text-gray-600 font-black">
                            Lupa Password Member
                        </h1>
                        <h2 className="mt-2 text-[0.9rem] dark:text-dark-text/80 font-normal text-gray-500">
                            Masukan nomor whatsapp kamu untuk mereset password
                        </h2>
                    </div>

                    <div className="md:mt-10 mt-5 sm:mx-auto sm:w-full sm:max-w-sm">
                        <form onSubmit={submit} className="space-y-5">
                            {/* Input phone */}
                            <BaseInput
                                label="Nomor Telephone/WhatsApp"
                                name="phone"
                                value={data.phone}
                                placeholder={"08****"}
                                autocomplete={false}
                                handleChange={(e) =>
                                    setData("phone", e.target.value)
                                }
                                isRequired={true}
                                type="number"
                                error={errors.phone}
                            />

                            {/* Tombol submit */}
                            <div>
                                <button
                                    type="submit"
                                    className={`btn btn-md rounded-md py-5 dark:btn-secondary btn-primary w-full disabled:bg-gray-300`}
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

                                {/* Link ke Register & Lupa Password */}
                                <div className="text-sm space-y-3 font-medium my-3 text-gray-500 text-center">
                                    <p>
                                        Belum Punya Akun?{" "}
                                        <Link
                                            href={route("register.page")}
                                            className="text-primary dark:text-secondary"
                                        >
                                            Daftar Sekarang
                                        </Link>
                                    </p>
                                    <Link
                                        href={route("login")}
                                        className="text-primary dark:text-secondary"
                                    >
                                        Masuk Sekarang
                                    </Link>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </>
    );
}

Forgot.layout = (page) => <MainLayout>{page}</MainLayout>;
