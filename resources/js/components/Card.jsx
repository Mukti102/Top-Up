import Aos from "aos";
import React, { useEffect } from "react";
import { motion } from "framer-motion";
import { Link } from "@inertiajs/react";
import { route } from "ziggy-js"; // Import Ziggy untuk menggunakan route()
function Card({ item, index, activeTab }) {
    const cardVariants = {
        hidden: { opacity: 0, y: 20 },
        show: { opacity: 1, y: 0, transition: { duration: 0.4 } },
    };
    return (
        <Link href={route("show", { slug: item.slug })}>
            <motion.div
                key={index}
                variants={cardVariants} // Set variants untuk animasi tiap card
                className="relative group transition ease-in duration-200 hover:scale-105 hover:border-2 border-transparent  hover:border-[var(--primary)] flex-shrink-0 w-44 h-64 shadow-lg rounded-3xl overflow-hidden"
            >
                <img
                    src="https://i.pinimg.com/736x/da/7e/79/da7e79f22cf7c28ce6c4bd5006f8a131.jpg"
                    alt={item.name}
                    className="w-full h-full object-cover rounded-t-lg"
                />
                {/* shadown on hover */}
                <div className="w-full h-full group-hover:opacity-100 transition-all duration-200 ease-in opacity-0 bg-gradient-to-b from-transparent via-transparent to-black absolute top-0 ">
                    <div className="w-full h-full bg-gradient-to-t from-transparent via-transparent to-black absolute bottom-0"></div>
                </div>
                {/* content */}
                <div className="absolute w-full transition-all duration-200 ease-in-out -bottom-96 group-hover:bottom-0">
                    <h1 className="absolute text-sm  text-start bottom-4 left-4 text-white font-semibold">
                        {item.name}
                        <p className="text-[10px] space-x-0.5 font-normal">
                            Lorem ipsum
                        </p>
                    </h1>
                </div>
            </motion.div>
        </Link>
    );
}

export default Card;
