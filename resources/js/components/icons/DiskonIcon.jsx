import React from "react";

function DiskonIcon({ children }) {
    return (
        <div class="flex h-full w-fit items-center rounded-md bg-gradient-to-b p-1 from-[var(--primary)] to-[var(--primary)]/50 px-1.5 text-[10px] text-white font-semibold text-primary-foreground">
            Disc {children}
        </div>
    );
}

export default DiskonIcon;
