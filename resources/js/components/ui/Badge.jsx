import React from "react";
import { cn } from "../../lib/utils";

const statusStyles = {
    pending: "bg-yellow-100 text-yellow-800 border-yellow-300",
    processing: "bg-sky-100 text-sky-800 border-sky-400",
    success: "bg-green-100 text-green-800 border-green-400",
    failed: "bg-red-100 text-red-800 border-red-400",
    expired: "bg-gray-100 text-gray-800 border-gray-400",
};

function Badge({ children, className, status }) {
    return (
        <span
            className={cn(
                "text-xs font-medium  border-[1px] me-2 px-2.5 py-0.5 rounded-full",
                statusStyles[status] || "bg-gray-100 text-gray-800", // Default jika status tidak ditemukan
                className
            )}
        >
            {children}
        </span>
    );
}

export default Badge;
