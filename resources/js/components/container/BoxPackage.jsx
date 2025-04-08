import React from "react";
import CardProduct from "../CardProduct";
import BoxProduct from "../BoxProduct";

function BoxPackage({ products }) {
    // Mengambil daftar unik dari tipe produk
    const groups = [...new Set(products?.map((item) => item?.group?.name))];

    return (
        <BoxProduct number={"1"} title={"Pilih Package"}>
            <div className="md:p-4 p-2 dark:text-dark-text  text-gray-800 text-sm">
                {groups?.map((group, index) => (
                    <div key={index} className="md:mb-6">
                        <h3 className="text-sm font-medium">{group}</h3>
                        {/* Filter produk berdasarkan tipe */}
                        <div className="grid overflow-hidden py-1 pt-3 md:mt-4 pb-4 grid-cols-2 md:grid-cols-3 gap-2 md:gap-4">
                            {products
                                .filter(
                                    (product) => product?.group?.name === group
                                )
                                .map((product, productIndex) => (
                                    <CardProduct
                                        key={product.id || productIndex}
                                        product={product}
                                        index={productIndex}
                                    />
                                ))}
                        </div>
                    </div>
                ))}
            </div>
        </BoxProduct>
    );
}

export default BoxPackage;
