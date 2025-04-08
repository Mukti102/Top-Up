import { Autoplay, Navigation, Pagination } from "swiper/modules";
import { Swiper, SwiperSlide } from "swiper/react";
import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/pagination";
import { formatDate } from "@/utils/methods";

function Caraosel({ slider }) {
    return (
        <div className="relative">
            {/* Custom tombol */}
            <div className="absolute z-10 top-1/2 left-2 -translate-y-1/2">
                <button className="swiper-button-prev-custom bg-black/70  p-2 text-black rounded-xs shadow">
                    <svg
                        class="w-4 h-4 md:w-6 md:h-6 text-white dark:text-dark-text rtl:rotate-180"
                        aria-hidden="true"
                        xmlns="http://www.w3.org/2000/svg"
                        fill="none"
                        viewBox="0 0 6 10"
                    >
                        <path
                            stroke="currentColor"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            d="M5 1 1 5l4 4"
                        />
                    </svg>
                    <span class="sr-only">Previous</span>
                </button>
            </div>
            <div className="absolute z-10 top-1/2 right-2 -translate-y-1/2">
                <button className="swiper-button-next-custom bg-black/80 p-2 rounded-sm shadow">
                    <svg
                        class="w-4 h-4 md:w-6 md:h-6 text-white dark:text-dark-text rtl:rotate-180"
                        aria-hidden="true"
                        xmlns="http://www.w3.org/2000/svg"
                        fill="none"
                        viewBox="0 0 6 10"
                    >
                        <path
                            stroke="currentColor"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            d="m1 9 4-4-4-4"
                        />
                    </svg>
                    <span class="sr-only">Next</span>
                </button>
            </div>
            <Swiper
                modules={[Navigation, Pagination, Autoplay]}
                spaceBetween={30}
                centeredSlides={true}
                pagination={{ clickable: false }}
                navigation={{
                    nextEl: ".swiper-button-next-custom",
                    prevEl: ".swiper-button-prev-custom",
                }}
                autoplay={{ delay: 5000 }}
                className="mySwiper"
            >
                {slider?.map((item) => (
                    <SwiperSlide key={item.id}>
                        <div className="relative h-56 md:h-[32rem]">
                            <img
                                src={`${window.location.origin}/storage/${item.thumbnail}`}
                                className="w-full h-full object-cover"
                                alt={item.title}
                                loading="lazy"
                            />
                            <div className="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black/90 p-4 md:p-10">
                                <h2 className="text-white text-xl md:text-3xl">
                                    {item.title}
                                </h2>
                                <p className="text-gray-300 text-sm mt-2">
                                    {formatDate(item.created_at)}
                                </p>
                            </div>
                        </div>
                    </SwiperSlide>
                ))}
            </Swiper>
        </div>
    );
}

export default Caraosel;
