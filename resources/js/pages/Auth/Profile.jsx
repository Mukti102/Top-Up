import BaseInput from "@/components/ui/BaseInput";
import Breadcrumb from "@/components/ui/Breadcrumb";
import MainLayout from "@/layouts/MainLayout";
import { useForm, usePage } from "@inertiajs/react";
import React, { useEffect } from "react";
import Swal from "sweetalert2";

function Profile() {
    const items = [{ label: "Profile", link: "profile", current: true }];
    const { auth, flash } = usePage().props; // Ambil data user dari Inertia
    const { data, setData, post, processing, errors } = useForm({
        name: auth.user.name || "", // Default value
        phone: auth.user.phone || "",
        password: "",
        new_password: "",
        password_confirmation: "",
    });

    function submit(e) {
        e.preventDefault();
        post(route("profile.update"), {
            preserveScroll: true,
        });
    }
    useEffect(() => {
        if (flash?.message) {
            if (flash.status === "success") {
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
            } else {
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
                    title: flash.message,
                });
            }
        }
    }, [flash?.message]);

    return (
        <div className="bg-white dark:bg-dark min-h-screen px-2 md:px-10 pt-20 md:pt-24 text-black">
            <Breadcrumb items={items} />
            <div>
                <h1 className="text-2xl dark:text-dark-text py-4 md:py-8 font-bold text-gray-800">
                    Pengaturan Akun
                </h1>
                <form
                    onSubmit={submit}
                    className="grid grid-cols-1 lg:grid-cols-2 gap-4"
                >
                    <div className="col-span-1 space-y-4">
                        <BaseInput
                            name="name"
                            label="Nama Lengkap"
                            value={data.name}
                            handleChange={(e) =>
                                setData("name", e.target.value)
                            }
                        />
                        <BaseInput
                            name="phone"
                            label="Nomor Telepon"
                            value={data.phone}
                            handleChange={(e) =>
                                setData("phone", e.target.value)
                            }
                        />
                    </div>
                    <div className="col-span-1 space-y-4">
                        <BaseInput
                            name="password"
                            label="Password Saat Ini (Opsional)"
                            type="password"
                            value={data.password}
                            handleChange={(e) =>
                                setData("password", e.target.value)
                            }
                        />
                        <BaseInput
                            name="new_password"
                            type="password"
                            label="Password Baru (Opsional)"
                            value={data.new_password}
                            handleChange={(e) =>
                                setData("new_password", e.target.value)
                            }
                        />
                        <BaseInput
                            type="password"
                            name="password_confirmation"
                            label="Konfirmasi Password Baru"
                            value={data.password_confirmation}
                            handleChange={(e) =>
                                setData("password_confirmation", e.target.value)
                            }
                        />
                        <div className="w-full flex justify-end mt-5 md:mt-10">
                            <button
                                type="submit"
                                className="btn dark:btn-secondary btn-primary"
                            >
                                {processing ? "Menyimpan..." : "Simpan"}
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    );
}

export default Profile;

Profile.layout = (page) => <MainLayout>{page}</MainLayout>;
