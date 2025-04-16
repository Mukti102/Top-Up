import { Link, useForm, usePage } from "@inertiajs/react";
import React, { useEffect } from "react";
import { route } from "ziggy-js";
import Swal from "sweetalert2";
import "animate.css";
import Breadcrumb from "@/components/ui/Breadcrumb";
import MainLayout from "@/layouts/MainLayout";
import BaseInput from "@/components/ui/BaseInput";

export default function Login() {
    const { Setting, flash } = usePage().props; // Mengambil data user dari Inertia
    const loginSVG = "/storage/" + Setting?.["login.svg"];
    const { data, setData, post, processing, errors } = useForm({
        phone: "",
        password: "",
        remember: false,
    });

    function submit(e) {
        e.preventDefault();
        post(route("login.post"), {
            preserveScroll: true,
        });
    }

    useEffect(() => {
        if (flash?.message) {
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
                title: flash.message,
            });
        }
    }, [flash?.message]);

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
        <div className="bg-white dark:bg-dark px-1 md:px-10 pt-22 md:pt-5">
            <div className="bg-white dark:bg-dark h-max md:pb-0 pb-20 md:h-screen px-0 md:px-0 grid grid-cols-1 md:grid-cols-2">
                <div className="flex justify-between items-center">
                    <img
                        className="mx-auto w-32 md:w-96"
                        src={loginSVG || "./login.svg"}
                        alt="Login"
                    />
                </div>
                <div className="flex min-h-full flex-1 flex-col justify-center px-3 md:px-6 py-7 md:py-12 lg:px-8">
                    <div className="sm:mx-auto sm:w-full sm:max-w-sm">
                        <h1 className="text-3xl text-gray-600 dark:text-dark-text font-black">
                            Masuk Member
                        </h1>
                        <h2 className="mt-2 text-[0.9rem] dark:text-dark-text/60 font-normal text-gray-500">
                            Masukan nomor WhatsApp dan password kamu untuk masuk
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

                            {/* Input Password */}
                            <BaseInput
                                label="Password"
                                name="password"
                                value={data.password}
                                placeholder={"**********"}
                                handleChange={(e) =>
                                    setData("password", e.target.value)
                                }
                                isRequired={true}
                                type="password"
                                error={errors.password}
                            />

                            {/* Tombol Login */}
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
                                        "Masuk"
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
                                        href={route("forgot.page")}
                                        className="text-primary dark:text-secondary"
                                    >
                                        Lupa Password
                                    </Link>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    );
}

Login.layout = (page) => <MainLayout>{page}</MainLayout>;
