import { motion, AnimatePresence } from "framer-motion";
import { createPortal } from "react-dom";

const Modal = ({ isOpen, onClose, title, children }) => {
    return createPortal(
        <AnimatePresence>
            {isOpen && (
                <>
                    {/* Overlay */}
                    <motion.div
                        className="fixed inset-0  bg-opacity-20 backdrop-blur-xs z-50"
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        exit={{ opacity: 0 }}
                        onClick={onClose}
                    />

                    {/* Modal Content */}
                    <motion.div
                        className="fixed top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 dark:bg-card bg-white max-h-screen overflow-y-auto p-6 rounded-2xl shadow-lg z-50 max-w-xl w-full"
                        initial={{ y: 50, opacity: 0, scale: 0.9 }}
                        animate={{ y: 0, opacity: 1, scale: 1 }}
                        exit={{ y: 50, opacity: 0, scale: 0.9 }}
                        transition={{
                            type: "spring",
                            stiffness: 200,
                            damping: 20,
                        }}
                        onClick={(e) => e.stopPropagation()} // Supaya klik di dalam modal tidak menutup modal
                    >
                        {/* Header */}
                        <div className="flex justify-between items-center mb-4">
                            <h2 className="text-lg dark:text-dark-text text-gray-700 font-semibold">
                                {title}
                            </h2>
                            <button
                                onClick={onClose}
                                className="text-gray-500 hover:text-gray-700"
                            >
                                ✕
                            </button>
                        </div>

                        {/* Modal Body */}
                        <div>{children}</div>
                    </motion.div>
                </>
            )}
        </AnimatePresence>,
        document.body
    );
};

export default Modal;
