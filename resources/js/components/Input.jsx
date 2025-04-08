import React, { useEffect, useRef } from "react";
import { cn } from "../lib/utils";

function Input({
    label,
    placeholder,
    className,
    isRequired = false,
    type = "text",
    value = null,
    hasError = null,
    onChange,
    ...props
}) {
    const inputRef = useRef(null);
    useEffect(() => {
        if (hasError) {
            inputRef.current?.scrollIntoView({
                behavior: "smooth",
                block: "center",
            });
            inputRef.current?.focus();
        }
    }, [hasError]);
    return (
        <div className="text-gray-700  w-full flex flex-col space-y-2">
            <label
                htmlFor={label}
                className={`${
                    !label && "hidden"
                } text-sm font-semibold dark:text-dark-text text-gray-700`}
            >
                {label}
            </label>
            <input
                {...props}
                ref={inputRef}
                required={isRequired}
                id={label}
                value={value}
                type={type}
                placeholder={placeholder}
                autoComplete="off"
                onChange={onChange}
                className={cn(
                    "border border-gray-200 bg-gray-50 placeholder:text-gray-400 dark:bg-card dark:shadow-none dark:border-stone-700 dark:text-dark-text dark:focus:border-secondary outline-0  in-shadow text-sm focus:ring-primary  block w-full p-2 rounded-md",
                    className
                )}
            />
            {hasError && (
                <span className="text-red-500 text-xs">
                    This field is required
                </span>
            )}
        </div>
    );
}

export default Input;
