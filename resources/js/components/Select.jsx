import React from "react";
import { cn } from "../lib/utils";

function Select({ label, options = null, value = "", onChange, className }) {
    const selectOptions = Object.entries(options).map(([key, value]) => ({
        key,
        value,
    }));
    return (
        <div className="text-gray-700  w-full flex flex-col space-y-2">
            <label
                htmlFor={label}
                className={cn(
                    `${
                        label === null && "hidden"
                    } text-sm font-semibold dark:text-dark-text text-gray-700`,
                    className
                )}
            >
                {label}
            </label>
            <select
                value={value}
                id={label}
                onChange={onChange}
                className={cn(
                    "border border-slate-200 dark:bg-card dark:text-dark-text dark:border-stone-700 outline-none in-shadow text-sm focus:ring-primary focus:border-primary/10  block w-full p-2 rounded-md bg-gray-50",
                    className
                )}
            >
                <option className="" value="" disabled>
                    Pilih {label}
                </option>
                {selectOptions?.map((option, index) => (
                    <option key={index} value={option?.value}>
                        {option?.value}
                    </option>
                ))}
            </select>
        </div>
    );
}

export default Select;
