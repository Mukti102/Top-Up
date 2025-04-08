import { Link, useForm, usePage } from "@inertiajs/react";
import React, { useEffect } from "react";
import { route } from "ziggy-js";
import Swal from "sweetalert2";
import "animate.css";
import BaseInput from "@/components/ui/BaseInput";
import { useParams } from "react-router-dom";
import MainLayout from "@/layouts/MainLayout";

export default function Reset(props) {
    const { phone, flash, Setting } = usePage().props;
    const ResetSvg = "/storage/" + Setting?.["reset.svg"];
    const { data, setData, post, processing, errors } = useForm({
        password: "",
        password_confirmation: "",
        phone: props.phone,
    });

    function submit(e) {
        e.preventDefault();
        post(route("reset.post"), {
            preserveScroll: true,
        });
    }

    useEffect(() => {
        if (errors.message) {
            setData("password", "");
            setData("password_confirmation", "");
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
                        src={ResetSvg}
                        alt="forgot password"
                    />
                </div>
                <div className="flex min-h-full flex-1 flex-col justify-center px-3 md:px-6 py-7 md:py-12 lg:px-8">
                    <div className="sm:mx-auto sm:w-full sm:max-w-sm">
                        <h1 className="text-3xl dark:text-dark-text text-gray-600 font-black">
                            Reset Password
                        </h1>
                        <h2 className="mt-2 dark:text-dark-text/60 text-[0.9rem] font-normal text-gray-500">
                            Masukan password baru dan konfirmasi password baru
                            kamu
                        </h2>
                    </div>

                    <div className="md:mt-10 mt-5 sm:mx-auto sm:w-full sm:max-w-sm">
                        <form onSubmit={submit} className="space-y-5">
                            {/* Input otp */}
                            <BaseInput
                                label="Password Baru"
                                name="password"
                                value={data.otp}
                                placeholder={"Masukkan Password Baru Kamu"}
                                autocomplete={false}
                                handleChange={(e) =>
                                    setData("password", e.target.value)
                                }
                                isRequired={true}
                                type="text"
                                error={errors.password}
                            />
                            <BaseInput
                                label="Konfirmasi Password Baru"
                                name="password_confirmation"
                                value={data.otp}
                                placeholder={"Konfirmasi Password Baru Kamu"}
                                autocomplete={false}
                                handleChange={(e) =>
                                    setData(
                                        "password_confirmation",
                                        e.target.value
                                    )
                                }
                                isRequired={true}
                                type="text"
                                error={errors.password_confirmation}
                            />

                            {/* Tombol submit */}
                            <div className="space-y-3">
                                <button
                                    type="submit"
                                    className={`btn btn-md rounded-md py-5 dark:btn-secondary dark:btn-secondary btn-primary w-full disabled:bg-gray-300`}
                                >
                                    {/* spiner */}
                                    {processing ? (
                                        <div className="space-x-3 flex items-center">
                                            <span className="loading loading-spinner loading-xs"></span>
                                            <span>Loading...</span>
                                        </div>
                                    ) : (
                                        "Reset Password"
                                    )}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </>
    );
}

Reset.layout = (page) => <MainLayout>{page}</MainLayout>;
