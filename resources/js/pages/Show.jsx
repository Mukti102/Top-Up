import React from "react";
import MainLayout from "../layouts/MainLayout";
import CardProduct from "../components/CardProduct";
import petir from "../../../public/icons/petir.gif";
import contactSupport from "../../../public/icons/contact-support.gif";
import secure from "../../../public/icons/secure.gif";
import BoxProduct from "../components/BoxProduct";
import { BsBasket, BsHeadset } from "react-icons/bs";
import CardHelp from "../components/CardHelp";
import CardBasket from "../components/CardBasket";

function Show(...props) {
    const { BrandProduct, products } = props[0];
    const icons = [
        {
            icon: "/icons/petir.gif", // ✅ Gunakan "/" untuk akses dari public/
            title: "Poses Cepat",
        },
        {
            icon: "/icons/contact-support.gif",
            title: "Dukungan Cepat",
        },
        {
            icon: "/icons/secure.gif",
            title: "Keamanan Terjamin",
        },
    ];

    return (
        <div className="">
            <div className="h-screen ">
                {/* thumbnail */}
                <div className="w-full overflow-hidden  mt-12 h-[27rem]">
                    <img
                        className="w-full object-cover h-full"
                        src="https://img.freepik.com/free-photo/natural-rock-formations-landscape_23-2151723110.jpg?t=st=1742822516~exp=1742826116~hmac=d18a2565332a4943cddf357f984d6443bcb234880df1f05d70f5148a324efa1d&w=1480"
                        alt=""
                    />
                </div>
                {/* end */}
                <div className="flex gap-20  bg-white    items-center">
                    {/* card */}
                    <div className="w-48 h-48 relative -top-20 shadow-md -right-10 rounded-3xl bg-amber-400"></div>
                    <div className="">
                        <div className="text-gray-800">
                            <h1 className="text-2xl font-semibold ">
                                {BrandProduct?.name}
                            </h1>
                            <p className="font-light text-sm">
                                Lorem, ipsum dolor.
                            </p>
                        </div>
                        <div className=" mt-4">
                            <ul className="flex gap-3 text-xs text-gray-800 font-light">
                                {icons?.map((item, index) => (
                                    <li
                                        key={index}
                                        className="relative pl-6 flex items-center gap-2  text-xs"
                                    >
                                        <span
                                            className="w-6  h-6 bg-contain bg-no-repeat"
                                            style={{
                                                backgroundImage: `url(${item?.icon})`,
                                            }}
                                        ></span>
                                        {item?.title}
                                    </li>
                                ))}
                            </ul>
                        </div>
                    </div>
                </div>
                {/* section2 */}
                <div className="grid relative grid-cols-3 gap-8 bg-gray-200  p-5">
                    <BoxProduct
                        number={"1"}
                        description={"🔥 Blessing of the Welkin Moon"}
                        title={"Pilih Package"}
                    >
                        {/* cards */}
                        <div className="grid overflow-hidden mt-4 grid-cols-3 gap-3">
                            {products.map((product, index) => (
                                <CardProduct
                                    key={index}
                                    product={product}
                                    index={index}
                                />
                            ))}
                        </div>
                    </BoxProduct>
                    <div className="sticky self-start top-5">
                        {/* need help */}
                        <CardHelp />
                        {/* keranjang */}
                        <CardBasket />
                    </div>
                </div>
            </div>
        </div>
    );
}

export default Show;

Show.layout = (page) => <MainLayout>{page}</MainLayout>;
