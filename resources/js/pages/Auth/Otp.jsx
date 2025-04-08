import React, { useState } from "react";
import { router, useForm, usePage } from "@inertiajs/react";
import { route } from "ziggy-js";
import Swal from "sweetalert2";

function Otp() {
    const { Setting } = usePage().props; // Mengambil data user dari Inertia
    const OTPSvg = "/storage/" + Setting?.["OTP.svg"];
    const [message, setMessage] = useState("");
    const { data, setData, post, processing, errors } = useForm({
        otp: "",
    });

    const handleChange = (e, index) => {
        let value = e.target.value;
        if (!/^[0-9]?$/.test(value)) return;
        let otpArray = data.otp.split("");
        otpArray[index] = value;
        setData("otp", otpArray.join(""));

        if (value && e.target.nextSibling) {
            e.target.nextSibling.focus();
        }
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        setMessage("");
        if (data?.otp?.length < 6) {
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
                title: "Harap isi OTP Dengan Lengkap",
            });
            return;
        } else {
            post(route("verify.otp"), {
                preserveScroll: true,
            });
        }
    };

    const handleKeyDown = (e, index) => {
        if (
            e.key === "Backspace" &&
            !data.otp[index] &&
            e.target.previousSibling
        ) {
            let otpArray = data.otp.split("");
            otpArray[index - 1] = "";
            setData("otp", otpArray.join(""));
            e.target.previousSibling.focus();
        }
    };

    return (
        <div className="grid grid-cols-2  text-gray-600 dark:bg-dark  h-screen bg-white">
            <div className="w-full flex justify-center items-center ">
                <img className="w-96 h-96" src={OTPSvg} alt="" />
            </div>
            <div className="bg-white  flex justify-center items-center p-6 rounded-lg">
                <div>
                    <div className="mb-10">
                        <h2 className="text-5xl capitalize text-gray-600 font-black text-center mb-4">
                            Verify OTP
                        </h2>
                        <p className="text-gray-600 text-sm text-center mb-4">
                            Enter the OTP sent to your WhatsApp
                        </p>
                    </div>
                    {message && (
                        <p className="text-center text-red-500 mb-2">
                            {message}
                        </p>
                    )}
                    <form
                        onSubmit={handleSubmit}
                        className="flex flex-col items-center"
                    >
                        <div className="flex space-x-2 mb-4">
                            {[...Array(6)].map((_, index) => (
                                <input
                                    key={index}
                                    type="text"
                                    maxLength="1"
                                    value={data.otp[index] || ""}
                                    onKeyDown={(e) => handleKeyDown(e, index)}
                                    onChange={(e) => handleChange(e, index)}
                                    className="w-16 h-16 text-center text-lg border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-400"
                                />
                            ))}
                        </div>
                        {errors.otp && (
                            <p className="text-red-500 text-sm mt-1">
                                {errors.otp}
                            </p>
                        )}
                        <button
                            type="submit"
                            disabled={processing}
                            className="w-full btn btn-lg btn-primary dark:btn-secondary "
                        >
                            {processing ? "Verifying..." : "Verify OTP"}
                        </button>
                    </form>
                </div>
            </div>
        </div>
    );
}

export default Otp;
