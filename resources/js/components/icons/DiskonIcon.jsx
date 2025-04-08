import React from "react";
import useStore from "../../store/AppStore";

function DiskonIcon({ children, product }) {
    const basket = useStore((state) => state.basket);
    return (
        <div
            className={`flex h-full w-fit shadow-sm items-center rounded-sm   p-1 px-1.5 text-[7px] md:text-[9px]  font-semibold ${
                product?.id === basket[0]?.id
                    ? "bg-gray-50 text-primary dark:text-secondary"
                    : "border-0 bg-gradient-to-b dark:from-secondary dark:to-secondary  from-primary to-primary/70 dark:text-white text-white"
            } text-primary-foreground dark:text-secondary`}
        >
            Discon {children}
        </div>
    );
}

export default DiskonIcon;
