import { Link } from "@inertiajs/react";
import React from "react";
import { route } from "ziggy-js";

function Breadcrumb({ items }) {
    return (
        <>
            <nav className="flex" aria-label="Breadcrumb">
                <ol className="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
                    <li className="inline-flex items-center">
                        <a
                            href="/"
                            className="inline-flex items-center text-[10px] md:text-sm font-medium text-gray-700 hover:text-primary dark:text-gray-400 dark:hover:text-white"
                        >
                            <svg
                                className="md:w-3 md:h-3 w-3 h-3 me-2.5"
                                aria-hidden="true"
                                xmlns="http://www.w3.org/2000/svg"
                                fill="currentColor"
                                viewBox="0 0 20 20"
                            >
                                <path d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z" />
                            </svg>
                            Home
                        </a>
                    </li>
                    {items?.map((item, index) => {
                        if (item?.current) {
                            return (
                                <li aria-current="page">
                                    <div className="flex items-center">
                                        <svg
                                            className="rtl:rotate-180 md:w-3 md:h-3 w-2 h-2 text-gray-400 mx-1"
                                            aria-hidden="true"
                                            xmlns="http://www.w3.org/2000/svg"
                                            fill="none"
                                            viewBox="0 0 6 10"
                                        >
                                            <path
                                                stroke="currentColor"
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="m1 9 4-4-4-4"
                                            />
                                        </svg>
                                        <span className="ms-1 text-[10px] md:text-sm font-medium text-gray-500 md:ms-2 dark:text-gray-400">
                                            {item?.label}
                                        </span>
                                    </div>
                                </li>
                            );
                        } else {
                            return (
                                <li>
                                    <div className="flex items-center">
                                        <svg
                                            className="rtl:rotate-180 w-3 h-3 text-gray-400 mx-1"
                                            aria-hidden="true"
                                            xmlns="http://www.w3.org/2000/svg"
                                            fill="none"
                                            viewBox="0 0 6 10"
                                        >
                                            <path
                                                stroke="currentColor"
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="m1 9 4-4-4-4"
                                            />
                                        </svg>
                                        <Link
                                            href={route(item?.link)}
                                            className="ms-1 text-[10px] md:text-sm font-medium text-gray-700 hover:text-primary md:ms-2 dark:text-gray-400 dark:hover:text-white"
                                        >
                                            {item?.label}
                                        </Link>
                                    </div>
                                </li>
                            );
                        }
                    })}
                </ol>
            </nav>
        </>
    );
}

export default Breadcrumb;
