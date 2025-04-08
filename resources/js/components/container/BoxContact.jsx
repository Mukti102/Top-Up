import React from "react";
import BoxProduct from "../BoxProduct";
import Input from "../Input";
import useStore from "../../store/AppStore";

function BoxContact() {
    const setContact = useStore((state) => state.setContact);
    const contact = useStore((state) => state?.contact);

    const handleChange = (key, value) => {
        setContact({
            ...contact,
            [key]: value,
        });
    };
    return (
        <>
            <BoxProduct number={"4"} title={"Cara Menghubungi Anda"}>
                <div className="p-3 space-y-3">
                    {/* <Input
                        label={"Email (Optional)"}
                        value={contact["Email"] || ""}
                        onChange={(e) =>
                            handleChange(e.target.id, e.target.value)
                        }
                        type="email"
                        placeholder={"Masukkan Email Anda"}
                    /> */}
                    <Input
                        label={"Telephone"}
                        value={contact["Telephone"] || ""}
                        isRequired={true}
                        onChange={(e) =>
                            handleChange(e.target.id, e.target.value)
                        }
                        type="number"
                        placeholder={"Masukkan Nomor Yang Bisa Di Hubungi"}
                    />
                    <p className="italic text-[11px] text-gray-500 dark:text-gray-400">
                        Nomor ini akan digunakan untuk menghubungi anda
                    </p>
                </div>
            </BoxProduct>
        </>
    );
}

export default BoxContact;
