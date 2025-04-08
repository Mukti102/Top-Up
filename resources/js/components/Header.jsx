import React from "react";
import { IoIosSearch } from "react-icons/io";
import { FaUserCircle } from "react-icons/fa";
import { IoMdWallet } from "react-icons/io";
import { BsCalculator, BsSearch } from "react-icons/bs";
import { FiLogIn } from "react-icons/fi";
import { FaGlobeAsia } from "react-icons/fa";
import { Link } from "@inertiajs/react";
import Drawer from "./Drawer";
import Modal from "./ui/Modal";
import Input from "./Input";
import ModalSearch from "./ui/ModalSearch";
import Toggle from "./ui/Toggle";

export default function Header({ logo }) {
    const [isOpen, setIsOpen] = React.useState(false);
    return (
        <div className="fixed w-full bg-gray-50 dark:bg-dark  z-50  top-0">
            <header className=" shadow-sm  shdow-lg py-3  w-full h-max dark:text-secondary text-primary p-2 flex items-center justify-between px-2 md:px-6">
                <div className="flex gap-1 z-10 md:gap-5 items-center">
                    <Drawer logo={logo} />
                    {/* Logo */}
                    <Link
                        href="/"
                        className="flex h-10 md:max-h-[150px]  w-28 md:w-36  overflow-hidden items-center space-x-2  text-2xl font-bold"
                    >
                        <img
                            className="w-full object-cover  h-full"
                            src={"/storage/" + logo}
                            alt=""
                        />
                    </Link>
                </div>
                {/* Language & Login */}
                <div className="flex items-center  space-x-2 mx-2">
                    <button
                        className="p-2   dark:text-secondary text-primary rounded-full drawer-button"
                        onClick={() => setIsOpen(true)}
                    >
                        <BsSearch className="md:text-2xl text-xl" />
                    </button>
                    <div className="z-0">
                        <Toggle />
                    </div>
                    <Modal
                        onClose={() => setIsOpen(false)}
                        isOpen={isOpen}
                        on
                        title="Petunjuk Pembayaran"
                    >
                        <ModalSearch />
                    </Modal>
                </div>
            </header>
        </div>
    );
}
