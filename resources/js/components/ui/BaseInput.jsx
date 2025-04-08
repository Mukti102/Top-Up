import { cn } from "@/lib/utils";
import React from "react";

function BaseInput({
    name,
    label,
    type = "text",
    placeholder,
    value,
    handleChange,
    autocomplete = "email",
    isRequired = false,
    className,
    error,
}) {
    return (
        <div>
            <label
                htmlFor={name}
                className="block dark:text-dark-text text-sm/6 font-medium text-gray-500"
            >
                {label}
            </label>
            <div className="mt-2">
                <input
                    id={name}
                    value={value}
                    name={name}
                    onChange={handleChange}
                    type={type}
                    required={false}
                    autoComplete={autocomplete}
                    placeholder={placeholder}
                    className={cn(
                        "block border-gray-300 dark:bg-card dark:border-stone-700 dark:text-dark-text  focus:border-transparent w-full rounded-md bg-white px-3 py-1.5 text-base text-gray-900 outline-0 focus:ring-0 -outline-offset-1 outline-gray-300 placeholder:text-gray-400 focus:outline-2 focus:-outline-offset-2 dark:focus:outline-secondary focus:outline-primary sm:text-sm/6",
                        className
                    )}
                />
                {error && (
                    <p className="text-red-400 text-[0.7rem] my-1">
                        {error === "validation.required"
                            ? `${label} wajib diisi`
                            : error}
                    </p>
                )}
            </div>
        </div>
    );
}

export default BaseInput;
