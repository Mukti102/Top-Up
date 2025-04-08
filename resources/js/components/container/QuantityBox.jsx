import React from "react";
import BoxProduct from "../BoxProduct";
import Input from "../Input";
import useStore from "../../store/AppStore";

function QuantityBox() {
    const increas = useStore((state) => state.increasQuantity);
    const basket = useStore((state) => state.basket);
    const decreas = useStore((state) => state.decreasQuantity);
    const quantity = useStore((state) => state.quantity);
    return (
        <>
            <BoxProduct number={"3"} title={"Masukkan Jumlah Pembelian"}>
                <div className="flex gap-3 p-3 items-center">
                    <Input
                        value={quantity}
                        type="number"
                        placeholder="Jumlah Pembelian"
                    />
                    <div className="flex gap-1 pt-2 items-center">
                        <button
                            onClick={() => (basket.length > 0 ? increas() : "")}
                            className="btn btn-sm btn-primary"
                        >
                            +
                        </button>
                        <button
                            onClick={() =>
                                basket?.length > 0 ? decreas() : ""
                            }
                            className="btn btn-sm btn-primary"
                        >
                            -
                        </button>
                    </div>
                </div>
            </BoxProduct>
        </>
    );
}

export default QuantityBox;
