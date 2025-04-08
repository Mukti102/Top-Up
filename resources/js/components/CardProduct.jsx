import React from "react";
import FatsDeliver from "./icons/FatsDeliver";
import DiskonIcon from "./icons/DiskonIcon";
import useStore from "../store/AppStore";
import { usePage } from "@inertiajs/react";
function CardProduct({ product }) {
    const { auth } = usePage().props;
    const addToBasket = useStore((state) => state.storeProduct);
    const basket = useStore((state) => state.basket);
    const handleClick = () => {
        addToBasket(product);
    };

    const price = (product) => {
        let productPrice = product?.total_price;
        if (auth?.user && auth?.user?.level == "premium") {
            productPrice = product?.membership_price;
        }
        return productPrice;
    };

    return (
        <div
            key={product?.id}
            onClick={() => handleClick()}
            className={` cursor-pointer   transition-all ease-in-out h-max  duration-300 group border-2 border-transparent   rounded-xl ${
                product?.id === basket[0]?.id
                    ? "border-2 in-shadow dark:border-secondary border-primary dark:bg-secondary bg-primary dark:shadow-secondary shadow-md  text-white "
                    : "border-gray-100 border-1 bg-slate-100 dark:bg-dark/50 dark:border-stone-800   shadow-sm border-1 hover:border-primary"
            } `}
        >
            <div className="md:p-3 p-1.5">
                <h4 className="md:text-xs text-[10px] font-medium">
                    {product?.name}
                </h4>
                <div className="flex gap-2 md:gap-4 items-center">
                    <div className="md:w-10 md:h-10 w-8 h-8 group-hover:rotate-12 transition-all duration-300 ">
                        <img
                            className="bg-blend-difference w-full h-full"
                            src={
                                product?.icon
                                    ? "/storage/" + product?.icon
                                    : "/storage/" + product?.group?.image
                            }
                            alt=""
                        />
                    </div>
                    <div className="mt-1">
                        <span
                            className={`${
                                product?.id === basket[0]?.id && "text-white"
                            } font-semibold md:text-base text-xs`}
                        >
                            Rp{" "}
                            {Math.floor(price(product) || 0).toLocaleString(
                                "id-ID"
                            )}
                        </span>

                        <span
                            className={`${
                                product?.id === basket[0]?.id && "text-white"
                            } mt-[0.1rem] line-through  block text-[0.5rem] md:text-[0.6rem] italic font-light`}
                        >
                            Rp{" "}
                            {Math.floor(
                                price(product) * 1.2 || 0
                            ).toLocaleString("id-ID")}
                        </span>
                    </div>
                </div>
            </div>
            <div className="flex p-1.5 justify-end border-t-[0.5px] dark:border-stone-600 border-gray-300  gap-2">
                <DiskonIcon product={product}>2%</DiskonIcon>
                <FatsDeliver />
            </div>
        </div>
    );
}

export default CardProduct;
