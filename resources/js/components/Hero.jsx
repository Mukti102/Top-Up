import React from "react";
import { FaChevronLeft, FaChevronRight } from "react-icons/fa";
import { GrFormNext, GrNext } from "react-icons/gr";
import Aurora from "./Aurora";

function Hero() {
    const images = [
        "https://i.pinimg.com/736x/7f/d1/7e/7fd17e2ecf4fe813890e0a8080b5cbf8.jpg",
        "https://i.pinimg.com/736x/ee/ee/80/eeee808893281334712259335f4de5e9.jpg",
        "https://i.pinimg.com/736x/7f/d1/7e/7fd17e2ecf4fe813890e0a8080b5cbf8.jpg",
        "https://i.pinimg.com/736x/ee/ee/80/eeee808893281334712259335f4de5e9.jpg",
    ];

    return (
        <div className="p-0 mt-16 bg-slate-900 ">
            <div className="absolute w-full">
                <Aurora amplitude={0.5} />
            </div>
            <div className="p-10">
                <div
                    id="controls-carousel"
                    class="relative w-full rounded-3xl bg-amber-50"
                    data-carousel="static"
                >
                    {/* <!-- Carousel wrapper --> */}
                    <div class="relative h-56 rounded-3xl overflow-hidden  md:h-[480px]">
                        {images.map((image, index) => (
                            <div
                                key={index}
                                class="hidden duration-700 ease-in-out"
                                data-carousel-item
                            >
                                <img
                                    src="https://i.pinimg.com/736x/7f/d1/7e/7fd17e2ecf4fe813890e0a8080b5cbf8.jpg"
                                    class="absolute block w-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2"
                                    alt="item1"
                                />
                            </div>
                        ))}
                    </div>
                    {/* <!-- Slider controls --> */}
                    <button
                        type="button"
                        class="absolute top-0 start-0 z-30 flex items-center justify-center h-full px-4 cursor-pointer group focus:outline-none"
                        data-carousel-prev
                    >
                        <span class="inline-flex items-center justify-center w-12 h-12 rounded-full bg-white/30 dark:bg-gray-800/30">
                            <FaChevronLeft className="text-white text-lg" />
                            <span class="sr-only">Previous</span>
                        </span>
                    </button>
                    <button
                        type="button"
                        className="absolute top-0 end-0 z-30 flex items-center justify-center h-full px-4 cursor-pointer group focus-visible:outline-none"
                        data-carousel-next
                    >
                        <span className="inline-flex items-center justify-center w-12 h-12 rounded-full bg-white/30 dark:bg-gray-800/30">
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
