import React from "react";
import BoxProduct from "../BoxProduct";
import Input from "../Input";
import Select from "../Select";
import useStore from "../../store/AppStore";
import { defaultFieldUserId } from "../../utils/methods";

function BoxInputAkun({ brand }) {
    const acount = useStore((state) => state.acount); // array []
    const setAcount = useStore((state) => state.setAcount);

    const fieldInputs = brand?.rules?.field_input || defaultFieldUserId; // Pastikan tidak undefined

    // Fungsi untuk menyimpan perubahan input ke store
    const handleChange = (key, value) => {
        setAcount({
            ...acount, // Menjaga data sebelumnya
            [key]: value, // Perbarui field yang berubah
        });
    };

    return (
        <div>
            <BoxProduct number={"2"} title={"Masukkan Data Akun"}>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-3 p-3">
                    {fieldInputs.map((e, i) =>
                        e?.type_status === "select" ? (
                            <Select
                                key={i}
                                label={e?.label}
                                value={acount[e?.label] || ""}
                                options={e?.options || null} // Pastikan ada options
                                onChange={(e) =>
                                    handleChange(
                                        e?.label || e.target.id,
                                        e?.target.value
                                    )
                                }
                            />
                        ) : (
                            <Input
                                key={i}
                                label={e?.label}
                                type="text"
                                placeholder={e?.placeholder}
                                value={acount[e?.label] || ""}
                                onChange={(e) =>
                                    handleChange(
                                        e?.label || e.target.id,
                                        e.target.value
                                    )
                                }
                            />
                        )
                    )}
                </div>
            </BoxProduct>
        </div>
    );
}

export default BoxInputAkun;
