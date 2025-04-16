import React, { useEffect, useState } from "react";
import { FaChevronLeft, FaChevronRight } from "react-icons/fa";
import { GrFormNext, GrNext } from "react-icons/gr";
import Aurora from "./Aurora";
import "swiper/css";
import "swiper/css/navigation";
import { usePage } from "@inertiajs/react";
import { Swiper, SwiperSlide } from "swiper/react";
import { Autoplay, Navigation } from "swiper/modules";

function Hero() {
    const { Setting } = usePage().props; // Mengambil data user dari Inertia
    const slider = Setting?.slider?.map((item) => "/storage/" + item?.slide);
    const [images, setImages] = useState([]);
    const backgroundImage = Setting?.["background.home"];

    useEffect(() => {
        const timeout = setTimeout(() => {
            setImages(slider);
        }, 3000); // 3000 ms = 3 detik

        return () => clearTimeout(timeout); // clear timeout jika komponen di-unmount
    }, []);

    return (
        <div className="md:pt-16 relative oveflow-hidden min-h-[300px] md:min-h-[600px]  pt-12">
            <div className="absolute hidden dark:block z-10  w-full">
                <Aurora amplitude={0.5} />
            </div>
            <div className="absolute dark:block hidden overflow-hidden h-full  dark:block right-0 left-0 top-0 z-0">
                <img
                    src={`/storage/${backgroundImage}`}
                    className="w-full h-full object-cover"
                />
            </div>

            <div className="md:p-10   p-2.5 pb-2  md:pb-10 py-12">
                <div className="relative z-30  w-full md:rounded-3xl">
                    <Swiper
                        modules={[Navigation, Autoplay]}
                        navigation={{
                            prevEl: ".custom-prev",
                            nextEl: ".custom-next",
                        }}
                        autoplay={{ delay: 5000 }}
                        loop={true}
                        className="relative z-10 rounded-xl shadow-md md:rounded-3xl overflow-hidden md:h-[480px] h-42"
                    >
                        {images?.map((image, index) => (
                            <SwiperSlide key={index}>
                                <img
                                    src={image}
                                    alt={`item${index}`}
                                    className="h-full w-full object-cover"
                                />
                            </SwiperSlide>
                        ))}
                    </Swiper>

                    {/* Custom Navigation Buttons */}
                    <button
                        type="button"
                        className="custom-prev absolute top-0 -start-2 md:start-0 z-10 flex items-center justify-center h-full px-4 cursor-pointer group focus:outline-none"
                    >
                        <span className="inline-flex items-center justify-center md:w-12 md:h-12 w-8 h-8 rounded-full bg-white/30 dark:bg-gray-800/30">
                            <FaChevronLeft className="text-white text-lg" />
                            <span className="sr-only">Previous</span>
                        </span>
                    </button>
                    <button
                        type="button"
                        className="custom-next absolute top-0 -end-2 md:end-0 z-10 flex items-center justify-center h-full px-4 cursor-pointer group focus-visible:outline-none"
                    >
                        <span className="inline-flex items-center justify-center md:w-12 md:h-12 w-8 h-8 rounded-full bg-white/30 dark:bg-gray-800/30">
                            <FaChevronRight className="text-white text-lg" />
                            <span className="sr-only">Next</span>
                        </span>
                    </button>
                </div>
            </div>
        </div>
    );
}

export default Hero;
