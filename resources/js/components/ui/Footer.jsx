import React from "react";
import { Link, router, usePage } from "@inertiajs/react";
import { route } from "ziggy-js";

function Footer({ logo }) {
    const { auth, Setting } = usePage().props;
    const menusAuth = [
        { name: "Beranda", link: "home" },
        { name: "Berita Dan Promo", link: "news.index" },
        { name: "Cek Transaksi", link: "cek.transaction" },
        { name: "Deposit Saldo", link: "deposit" },
        { name: "Syarat Dan Ketentuan", link: "terms" },
        { name: "Profile", link: "profile" },
    ];
    const menusGuest = [
        { name: "Beranda", link: "home" },
        { name: "Cek Status Transaksi", link: "cek.transaction" },
        { name: "Login Member", link: "login" },
        { name: "Daftar Member", link: "register.page" },
    ];

    const sosmed = [
        { name: "facebook", link: Setting?.["sosmed.facebook"] },
        { name: "instagram", link: Setting?.["sosmed.instagram"] },
        { name: "twitter", link: Setting?.["sosmed.twitter"] },
        { name: "youtube", link: Setting?.["sosmed.youtube"] },
    ];

    const informasi = [
        { name: "Berita Dan Promo", link: "news.index" },
        { name: "Daftar Harga", link: "pricelist" },
        { name: "Syarat Dan Ketentuan", link: "terms" },
    ];

    return (
        <footer className="bg-white dark:bg-card">
            <div className="mx-auto w-full max-w-screen-xl p-4 py-6 lg:py-8">
                <div className="md:flex md:justify-between">
                    <div className="mb-6 md:mb-0 ">
                        <Link href="/" className="flex  items-center">
                            <img
                                src={"/storage/" + logo}
                                className="h-8"
                                alt="FlowBite Logo"
                            />
                        </Link>
                        <p className="text-sm mt-2 md:w-[70%] text-gray-500 dark:text-gray-400">
                            Lorem ipsum dolor sit amet consectetur adipisicing
                            elit. Blanditiis ducimus numquam, doloremque at a ea
                            modi enim earum iusto quasi?
                        </p>
                    </div>
                    <div className="grid grid-cols-2 gap-2 sm:gap-6 sm:grid-cols-3">
                        <div>
                            <h2 className="md:mb-6 mb-3 text-sm font-semibold text-gray-900 uppercase dark:text-white">
                                Menu Cepat
                            </h2>
                            <ul className="text-gray-500 dark:text-gray-400 font-medium text-xs md:text-sm ">
                                {auth.user
                                    ? menusAuth.map((menu, index) => (
                                          <li
                                              className="mb-2.5 md:mb-4"
                                              key={index}
                                          >
                                              <Link
                                                  href={route(menu.link)}
                                                  className="hover:underline dark:hover:text-secondary hover:text-primary"
                                              >
                                                  {menu.name}
                                              </Link>
                                          </li>
                                      ))
                                    : menusGuest.map((menu, index) => (
                                          <li
                                              className="mb-2.5 md:mb-4"
                                              key={index}
                                          >
                                              <Link
                                                  href={route(menu.link)}
                                                  className="hover:underline dark:hover:text-secondary hover:text-primary"
                                              >
                                                  {menu.name}
                                              </Link>
                                          </li>
                                      ))}
                            </ul>
                        </div>
                        <div>
                            <h2 className="md:mb-6 mb-3 text-sm font-semibold text-gray-900 uppercase dark:text-white">
                                Informasi
                            </h2>
                            <ul className="text-gray-500 dark:text-gray-400 font-medium text-xs md:text-sm ">
                                {informasi?.map((item, index) => (
                                    <li key={index} className="mb-2.5 md:mb-3">
                                        <Link
                                            href={route(item.link)}
                                            className="hover:underline dark:hover:text-secondary hover:text-primary"
                                        >
                                            {item?.name}
                                        </Link>
                                    </li>
                                ))}
                            </ul>
                        </div>
                        <div>
                            <h2 className="md:mb-6 mb-3 text-sm font-semibold text-gray-900 uppercase dark:text-white">
                                Sosial Media
                            </h2>
                            <ul className="text-gray-500 dark:text-gray-400 font-medium text-xs md:text-sm ">
                                {sosmed?.map((item, index) => (
                                    <li key={index} className="mb-2.5 md:mb-3">
                                        <a
                                            href={item?.link}
                                            className="hover:underline capitalize dark:hover:text-secondary hover:text-primary"
                                        >
                                            {item?.name}
                                        </a>
                                    </li>
                                ))}
                            </ul>
                        </div>
                    </div>
                </div>
                <hr className="my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8" />
                <div className="sm:flex text-xs text-gray-400 sm:items-center sm:justify-between">
                    <p>© 2025 Topup Aja. All rights reserved.</p>
                </div>
            </div>
        </footer>
    );
}

export default Footer;
