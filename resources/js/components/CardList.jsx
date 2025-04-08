import React from "react";
import Card from "./Card";
import { motion } from "framer-motion";

export default function CardList({ getTabData, activeTab, contentScrollRef }) {
    const containerVariants = {
        hidden: { opacity: 0 },
        show: {
            opacity: 1,
            transition: {
                staggerChildren: 0.15, // Jeda antara animasi tiap card
            },
        },
    };

    return (
        <>
            {/* Content List */}
            <motion.div
                ref={contentScrollRef}
                key={activeTab} // Memicu animasi setiap tab berubah
                variants={containerVariants}
                initial="hidden"
                animate="show"
                exit="hidden"
                className="relative md:min-h-[300px] mt-4"
            >
                <div className="grid md:grid-cols-6 grid-cols-3 gap-3 md:gap-4 ">
                    {getTabData().length === 0 && (
                        <div className="w-full md:h-[300px] flex justify-center items-center">
                            <h1 className="text-[#4e4e4e] text-2xl font-semibold">
                                Tidak ada data
                            </h1>
                        </div>
                    )}
                    {getTabData().map((item, index) => (
                        <Card
                            key={index}
                            item={item}
                            index={index}
                            activeTab={activeTab}
                        />
                    ))}
                </div>
            </motion.div>
        </>
    );
}
