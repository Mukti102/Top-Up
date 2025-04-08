import React, { Children, useState } from "react";
import { AiOutlineLoading3Quarters } from "react-icons/ai";
import {
    Modal,
    ModalBody,
    ModalContent,
    ModalFooter,
    ModalTrigger,
} from "./Animated-modal";
import { motion } from "motion/react";

export function AnimatedModalTriger({
    children,
    text,
    icon,
    isLoading,
    bool,
    handleSubmit,
}) {
    return (
        <div className="py-5  flex items-center justify-center">
            <Modal>
                <ModalTrigger
                    bool={bool}
                    className=" text-white flex justify-center group/modal-btn  btn btn-primary text-sm w-full"
                >
                    <span className="text-center transition duration-500 ">
                        {text}
                    </span>
                </ModalTrigger>
                <ModalBody>
                    <ModalContent>{children}</ModalContent>
                    <ModalFooter className="gap-3 pb-5">
                        <button
                            onClick={handleSubmit}
                            className="btn btn-sm btn-primary rounded-full p-4 justify-center flex"
                        >
                            {isLoading ? (
                                <div className="flex items-center  justify-center gap-2 w-full ">
                                    <AiOutlineLoading3Quarters className="animate-spin" />
                                    <span>Processing…</span>
                                </div>
                            ) : (
                                "Lanjut Pembayaran"
                            )}
                        </button>
                    </ModalFooter>
                </ModalBody>
            </Modal>
        </div>
    );
}
