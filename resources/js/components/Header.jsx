import React from "react";
import { IoIosSearch } from "react-icons/io";
import { FaUserCircle } from "react-icons/fa";
import { IoMdWallet } from "react-icons/io";
import { BsCalculator } from "react-icons/bs";
import { FiLogIn } from "react-icons/fi";
import { FaGlobeAsia } from "react-icons/fa";
import { Link } from "@inertiajs/react";
import Drawer from "./Drawer";

export default function Header() {
    return (
        <div className="fixed w-full z-50 top-0">
            <header className="bg-white dark:bg-red-300  shdow-lg py-4  w-full h-max text-[var(--primary)] p-2 flex items-center justify-between px-6">
                <div className="flex gap-4 items-center">
                    <Drawer />
                    {/* Logo */}
                    <Link
                        href="/"
                        className="flex items-center space-x-2  text-2xl font-bold"
                    >
                        <span className="text-3xl">MCY</span>
                    </Link>
                </div>
                {/* Language & Login */}
                <div className="flex items-center space-x-4">
                    <button className="btn btn-primary drawer-button">
                        <FiLogIn className="text-lg" />
                        <span>Masuk</span>
                    </button>
                </div>
            </header>
        </div>
    );
}
