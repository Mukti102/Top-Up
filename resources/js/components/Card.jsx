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
                className="relative shadow-sm group transition ease-in duration-200 hover:scale-105 hover:border-2 border-transparent  hover:border-primary dark:hover:border-secondary flex-shrink-0 w-full h-34 md:h-52 md:rounded-3xl rounded-xl overflow-hidden"
            >
                <img
                    src={
                        item.image
                            ? "/storage/" + item.image
                            : "https://i.pinimg.com/736x/da/7e/79/da7e79f22cf7c28ce6c4bd5006f8a131.jpg"
                    }
                    alt={item.name}
                    className="w-full h-full object-cover"
                />
                {/* shadown on hover */}
                <div className="w-full h-full group-hover:opacity-100 transition-all duration-200 ease-in md:opacity-0 opacity-70 bg-gradient-to-b from-transparent via-transparent to-black absolute top-0 ">
                    <div className="w-full h-full bg-gradient-to-t from-transparent via-transparent to-black absolute bottom-0"></div>
                </div>
                {/* content */}
                <div className="absolute w-full transition-all duration-200 ease-in-out bottom-0 md:-bottom-96 group-hover:bottom-0">
                    <h1 className="absolute text-[10px] md:text-sm  text-start bottom-2 md:bottom-4 md:left-4 left-1.5 text-white font-semibold">
                        {item.name}
                        <p className="md:text-[10px] space-x-0.5 text-[7px] font-normal">
                            {item?.name}
                        </p>
                    </h1>
                </div>
            </motion.div>
        </Link>
    );
}

export default Card;
