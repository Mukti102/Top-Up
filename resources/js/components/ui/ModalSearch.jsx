import React, { useEffect, useState } from "react";
import Input from "../Input";
import axios from "axios";
import { Link } from "@inertiajs/react";

function ModalSearch({ isOpen, setIsOpen }) {
    const [value, setValue] = useState("");
    const [data, setData] = useState([]);
    const [loading, setLoading] = useState(false); // State untuk loading

    const getData = async () => {
        if (!value.trim()) {
            setData([]); // Kosongkan data jika input kosong
            return;
        }

        setLoading(true); // Set loading true sebelum fetch data
        try {
            const response = await axios.get("/api/brands", {
                params: { search: value },
            });
            setData(response.data);
        } catch (error) {
            console.error("Error fetching products:", error);
        } finally {
            setLoading(false); // Set loading false setelah selesai
        }
    };

    const handleChange = (e) => {
        setValue(e.target.value);
    };

    useEffect(() => {
        const delayDebounceFn = setTimeout(() => {
            getData();
        }, 500); // Menunda request API selama 500ms untuk mengurangi spam request

        return () => clearTimeout(delayDebounceFn); // Membersihkan timeout jika input berubah sebelum 500ms
    }, [value]);

    return (
        <div className="space-y-3 min-h-[130px]">
            <div className="text-gray-600">
                <Input
                    placeholder={"Search..."}
                    onChange={handleChange}
                    value={value}
                />
            </div>

            {/* Loading indicator */}
            {loading && (
                <p className="text-sm text-center text-gray-500">Mencari...</p>
            )}

            {/* Hasil pencarian */}
            {!loading && value && data.length === 0 && (
                <p className="text-sm text-center text-gray-500">
                    Tidak ada hasil ditemukan
                </p>
            )}

            <div className="max-h-[300px]  overflow-y-auto">
                {data.map((item, index) => (
                    <Link
                        href={route("show", { slug: item.slug })}
                        key={index}
                        className="flex border-b-gray-300 py-3 dark:hover:bg-zinc-700 hover:bg-gray-100 rounded-md px-2 border-b-[0.1px] items-center text-gray-600 gap-2"
                    >
                        {/* img */}
                        <div className="w-14 h-14 overflow-hidden rounded-md">
                            <img
                                className="w-full h-full object-cover"
                                src={
                                    item.image
                                        ? "/storage/" + item.image
                                        : "https://i.pinimg.com/736x/da/7e/79/da7e79f22cf7c28ce6c4bd5006f8a131.jpg"
                                }
                                alt=""
                            />
                        </div>
                        <div className="space-y-1 dark:text-dark-text">
                            <h3 className="font-semibold">{item.name}</h3>
                            <p className="text-xs">{item.category?.name}</p>
                        </div>
                    </Link>
                ))}
            </div>
        </div>
    );
}

export default ModalSearch;
