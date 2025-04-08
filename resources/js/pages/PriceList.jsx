import React, { useState } from "react";
import MainLayout from "../layouts/MainLayout";
import Select from "../components/Select";
import TablePricelist from "../components/ui/TablePricelist";
import Breadcrumb from "@/components/ui/Breadcrumb";

function PriceList(props) {
    const { categories, products } = props;

    const [category, setCategory] = useState(
        categories.length > 0 ? categories[0].name : null
    );

    // Ambil daftar brand dari kategori pertama sebagai default
    const initialBrands =
        categories.find((c) => c.name === category)?.brands || [];
    const [brand, setBrand] = useState(
        initialBrands.length > 0 ? initialBrands[0].name : null
    );

    // Ambil daftar kategori
    const kategori = categories.length > 0 ? categories.map((e) => e.name) : [];

    // Filter brand berdasarkan kategori yang dipilih
    const filterBrands = categories.find((e) => e.name === category);
    const brands = filterBrands ? filterBrands.brands?.map((e) => e.name) : [];

    // Handle perubahan kategori
    const handleChangeCategory = (e) => {
        const selectedCategory = e.target.value;
        setCategory(selectedCategory);

        // Ambil daftar brand dari kategori yang dipilih
        const selectedBrands =
            categories.find((c) => c.name === selectedCategory)?.brands || [];

        // Atur brand ke brand pertama jika ada, jika tidak, kosongkan
        setBrand(selectedBrands.length > 0 ? selectedBrands[0].name : null);
    };

    // Handle perubahan brand
    const handleChangeBrand = (e) => setBrand(e.target.value);

    const filteredProducts = products.filter((e) => {
        if (!brand) return true; // Jika brand belum dipilih, tampilkan semua produk
        return e?.brand?.name === brand;
    });

    return (
        <div className="min-h-screen pb-10 space-y-3 md:space-y-7 text-gray-700 px-2 md:px-10 ">
            {/* Header */}
            <div>
                <h1 className="md:text-3xl text-xl  dark:text-dark-text font-bold">
                    Daftar Harga
                </h1>
            </div>
            <div className=" bg-white space-y-2 dark:bg-card dark:shadow-md  p-4 rounded-sm  shadow-sm rounded-sm">
                {/* Filter */}
                <div className="flex justify-between    gap-3 md:gap-10">
                    <div className="w-full">
                        <Select
                            className={"md:text-md text-sm"}
                            label={"Pilih Kategori"}
                            options={kategori}
                            onChange={handleChangeCategory}
                            value={category}
                        />
                    </div>
                    <div className="w-full">
                        <Select
                            className={"md:text-md text-sm"}
                            label={"Pilih Brand"}
                            options={brands}
                            onChange={handleChangeBrand}
                            value={brand}
                            disabled={!brands.length} // Disable jika tidak ada brand
                        />
                    </div>
                </div>
                <div className="mt-7">
                    <TablePricelist products={filteredProducts} />
                </div>
            </div>
        </div>
    );
}

export default PriceList;

PriceList.layout = (page) => (
    <MainLayout items={[{ label: "Daftar Harga", current: true }]}>
        {page}
    </MainLayout>
);
