import React, { useState, useRef } from "react";
import { IoMdMenu } from "react-icons/io";
import { Link, router, usePage } from "@inertiajs/react";
import { route } from "ziggy-js";
import { IoClose } from "react-icons/io5";
import { formatRupiah } from "@/utils/methods";

function Drawer({ logo }) {
    const { auth } = usePage().props; // Mengambil data user dari Inertia
    const drawerRef = useRef(null);

    const closeDrawer = () => {
        if (drawerRef.current) {
            drawerRef.current.checked = false;
        }
    };

    return (
        <div className="drawer  w-max">
            <input
                id="my-drawer"
                type="checkbox"
                className="drawer-toggle"
                ref={drawerRef}
            />
            <div className="drawer-content">
                <label
                    htmlFor="my-drawer"
                    className="md:text-xl text-lg p-1 md:out-shadow w-max rounded-md flex items-center cursor-pointer"
                >
                    <IoMdMenu className="md:text-4xl text-3xl" />
                </label>
            </div>
            <div className="drawer-side  text-black">
                <label htmlFor="my-drawer" className="drawer-overlay"></label>
                <ul className="menu bg-gray-50 dark:bg-dark relative  text-black w-full  min-h-full md:w-96 p-4">
                    <button
                        onClick={closeDrawer}
                        className="absolute text-2xl text-primary dark:text-secondary top-3 right-3"
                    >
                        <IoClose />
                    </button>
                    <div className="w-40 mt-2 h-10">
                        <img src={"/storage/" + logo} alt="Logo" />
                    </div>
                    {auth.user ? (
                        <AuthSidebar
                            user={auth.user}
                            closeDrawer={closeDrawer}
                        />
                    ) : (
                        <GuestSidebar closeDrawer={closeDrawer} />
                    )}
                </ul>
            </div>
        </div>
    );
}

export default Drawer;
const AuthSidebar = ({ user, closeDrawer }) => {
    const menusAuth = [
        { name: "Beranda", link: "home" },
        { name: "Berita Dan Promo", link: "news.index" },
        { name: "Cek Transaksi", link: "cek.transaction" },
        { name: "Deposit Saldo", link: "deposit" },
        { name: "Syarat Dan Ketentuan", link: "terms" },
        { name: "Profile", link: "profile" },
    ];

    const logout = () => {
        router.post(route("logout"));
    };

    return (
        <>
            <div className="flex gap-3  items-center mt-12">
                <div className="avatar">
                    <div className="w-14 rounded-full">
                        <img
                            src={
                                // user.avatar ||
                                "https://tse4.mm.bing.net/th?id=OIP.dDKYQqVBsG1tIt2uJzEJHwHaHa&pid=Api&P=0&h=180"
                            }
                        />
                    </div>
                </div>
                <div className="space-y-0.5">
                    <h1 className="text-sm dark:text-dark-text font-medium">
                        {user.name}
                    </h1>
                    <h3 className="text-sm dark:text-dark-text/70 text-gray-500 font-medium">
                        {user.phone}
                    </h3>
                </div>
            </div>
            <div className="mt-4 mb-3 space-y-4">
                <div className="w-full dark:bg-card bg-gray-100 shadow-sm border-[1px] p-4 rounded-lg border-gray-200 dark:border-stone-700 flex justify-between">
                    <div>
                        <h3 className="text-gray-700 dark:text-dark-text">
                            Level Member
                        </h3>
                        <h2 className="font-semibold dark:text-dark-text/70 text-gray-600">
                            {user.level}
                        </h2>
                    </div>
                    <button className="btn bg-transparent hover:bg-primary dark:hover:bg-secondary hover:text-white text-primary dark:text-secondary border-primary dark:border-secondary btn-sm shadow-none">
                        Upgrade
                    </button>
                </div>
                <div className="w-full dark:bg-card bg-gray-100 shadow-sm border-[1px] p-4 rounded-lg border-gray-200 dark:border-stone-700 flex justify-between">
                    <div>
                        <h3 className="text-gray-700 dark:text-dark-text">
                            Saldo
                        </h3>
                        <h2 className="font-semibold dark:text-dark-text/70 text-gray-600">
                            {formatRupiah(user.saldo) || "0"}
                        </h2>
                    </div>
                    <Link
                        href={route("deposit")}
                        onClick={closeDrawer}
                        className="btn bg-transparent  hover:bg-primary dark:hover:bg-secondary hover:text-white text-primary dark:text-secondary border-primary dark:border-secondary btn-sm shadow-none"
                    >
                        Deposit
                    </Link>
                </div>
            </div>
            <ul className="text-base">
                {menusAuth.map((item, index) => (
                    <ol
                        key={index}
                        className="py-3 hover:text-primary  dark:text-dark-text dark:hover:text-secondary  text-[0.9rem] border-b border-gray-200 dark:border-stone-700"
                    >
                        <Link
                            href={route(item.link)}
                            className="p-0"
                            onClick={closeDrawer}
                        >
                            {item.name}
                        </Link>
                    </ol>
                ))}
            </ul>

            {/* Tombol Logout */}
            <form onSubmit={logout} className="mt-4 w-full">
                <button
                    type="submit"
                    className="w-full btn dark:btn-secondary btn-primary w-full  text-white text-sm py-2 hover:bg-priamry/80 rounded-md"
                >
                    Keluar
                </button>
            </form>
        </>
    );
};

const GuestSidebar = ({ closeDrawer }) => {
    const menus = [
        { name: "Beranda", link: "home" },
        { name: "Berita Dan Promo", link: "news.index" },
        { name: "Daftar Harga", link: "pricelist" },
        { name: "Cek Status Transaksi", link: "cek.transaction" },
        { name: "Syarat Dan Ketentuan", link: "terms" },
    ];

    return (
        <>
            <div className="grid mt-14  grid-cols-2 my-3 gap-3">
                <Link
                    onClick={closeDrawer}
                    href={route("login")}
                    className="btn btn-md rounded-full dark:btn-secondary btn-primary"
                >
                    Masuk
                </Link>
                <Link
                    onClick={closeDrawer}
                    href={route("register.page")}
                    className="btn btn-md dark:bg-card rounded-full btn-neutral"
                >
                    Daftar
                </Link>
            </div>
            <ul>
                {menus?.map((item, index) => (
                    <ol
                        key={index}
                        className="py-3 hover:text-primary  dark:text-dark-text text-[0.9rem] dark:hover:text-secondary dark:border-stone-700 border-b border-gray-200"
                    >
                        <Link
                            href={route(item.link)}
                            className="p-0"
                            onClick={closeDrawer}
                        >
                            {item.name}
                        </Link>
                    </ol>
                ))}
            </ul>
        </>
    );
};
