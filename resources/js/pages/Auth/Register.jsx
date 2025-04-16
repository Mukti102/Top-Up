import { Link, useForm, usePage } from "@inertiajs/react";
import React from "react";
import MainLayout from "@/layouts/MainLayout";
import BaseInput from "@/components/ui/BaseInput";
import Breadcrumb from "@/components/ui/Breadcrumb";

export default function Register() {
    const { Setting } = usePage().props; // Mengambil data user dari Inertia
    const RegisterSVG = "/storage/" + Setting?.["register.svg"];
    const { data, setData, post, processing, errors } = useForm({
        name: "",
        email: "",
        phone: "",
        password: "",
        password_confirmation: "",
    });

    function submit(e) {
        e.preventDefault();
        post(route("register.post"), {
            preserveScroll: true,
        });
    }

    return (
        <div className="md:pt-10 dark:bg-dark pt-20 bg-white  ">
            <div className="h-max md:pb-0 pb-20 md:h-max px-0 md:px-0  grid grid-cols-1  md:grid-cols-2">
                <div className="flex  justify-between items-center ">
                    <img
                        className="mx-auto w-32 md:w-96"
                        src={RegisterSVG}
                        alt=""
                    />
                </div>
                <div className="flex min-h-full flex-1 flex-col justify-center px-3 md:px-6 py-7 md:py-12 lg:px-8">
                    <div className="sm:mx-auto sm:w-full sm:max-w-sm">
                        <h1 className="text-3xl dark:text-dark-text text-gray-600  text-black font-black">
                            Masuk Member
                        </h1>
                        <h2 className="mt-2 text-[0.9rem] dark:text-dark-text/70 font-normal text-gray-500">
                            Masukan nomor whatsapp dan password kamu untuk masuk
                        </h2>
                    </div>

                    <div className="md:mt-10 mt-5 sm:mx-auto sm:w-full sm:max-w-sm">
                        <form
                            onSubmit={submit}
                            action="#"
                            method="POST"
                            className="space-y-5"
                        >
                            <BaseInput
                                label={"Nama Lengkap"}
                                name={"name"}
                                handleChange={(e) =>
                                    setData("name", e.target.value)
                                }
                                error={errors.name}
                                value={data?.name}
                                autocomplete="name"
                                placeholder={"Masukkan Nama Lengkap"}
                                isRequired={true}
                                type="text"
                            />
                            <BaseInput
                                label={"Email"}
                                name={"email"}
                                value={data?.email}
                                handleChange={(e) =>
                                    setData("email", e.target.value)
                                }
                                error={errors.email}
                                autocomplete="email"
                                placeholder={"Masukkan Email"}
                                isRequired={true}
                                type="email"
                            />
                            <BaseInput
                                label={"Nomor Whatsapp"}
                                name={"phone"}
                                error={errors?.phone}
                                value={data?.phone}
                                handleChange={(e) =>
                                    setData("phone", e?.target?.value)
                                }
                                placeholder={"Masukkan Nomor WhatsApp Kamu"}
                                isRequired={true}
                                type="number"
                            />
                            <BaseInput
                                label={"Password"}
                                name={"password"}
                                value={data?.password}
                                isRequired={true}
                                error={errors?.password}
                                handleChange={(e) =>
                                    setData("password", e?.target?.value)
                                }
                                placeholder={"********"}
                                type="password"
                            />
                            <BaseInput
                                label={"Konfirmasi Password"}
                                name={"confirm"}
                                value={data?.password_confirmation}
                                isRequired={true}
                                error={errors.password_confirmation}
                                placeholder={"********"}
                                handleChange={(e) =>
                                    setData(
                                        "password_confirmation",
                                        e.target.value
                                    )
                                }
                                type="password"
                            />
                            <div>
                                <button
                                    type="submit"
                                    className="btn btn-md rounded-md py-5 dark:btn-secondary btn-primary w-full"
                                >
                                    Masuk Sekarang
                                </button>
                                <div className="text-sm space-y-3 font-medium my-3 text-gray-500 text-center">
                                    <p>
                                        Sudah Memiliki Akun{" "}
                                        <Link
                                            href={route("login")}
                                            className="text-primary dark:text-secondary"
                                        >
                                            Masuk
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

Register.layout = (page) => <MainLayout>{page}</MainLayout>;
