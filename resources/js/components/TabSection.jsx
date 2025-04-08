import { useRef, useState } from "react";
import { FaChevronLeft, FaChevronRight } from "react-icons/fa";
import CardList from "./CardList";

export default function TabSection({ categories }) {
    const [activeTab, setActiveTab] = useState(categories[0]?.name);
    const scrollRef = useRef(null);
    const contentScrollRef = useRef(null);

    const scroll = (ref, direction) => {
        if (ref.current) {
            ref.current.scrollBy({
                left: direction === "left" ? -200 : 200,
                behavior: "smooth",
            });
        }
    };

    const handleTabClick = (category) => {
        setActiveTab(category);

        // Scroll ke awal daftar card saat tab berubah
        if (contentScrollRef.current) {
            contentScrollRef.current.scrollTo({ left: 0, behavior: "smooth" });
        }
    };

    const getTabData = () => {
        let category = categories.find(
            (category) => category.name === activeTab
        );
        let brands = category?.brands;
        return brands;
    };

    return (
        <div className="relative w-full mt-5 px-2 md:px-5">
            {/* Tab Navigation */}
            <div className="relative flex items-center justify-center">
                <button
                    className="absolute left-0 z-10 p-2 bg-primary dark:bg-secondary text-white rounded-md md:hidden"
                    onClick={() => scroll(scrollRef, "left")}
                >
                    <FaChevronLeft />
                </button>

                <div
                    ref={scrollRef}
                    className="flex cursor-pointer group  w-full gap-3 md:gap-4 overflow-x-auto  scroll-smooth scrollbar-hide whitespace-nowrap md:pr-1 pr-10 pl-10 md:pl-0 md:px-0 py-2 md:px-10 md:justify-start"
                >
                    {categories?.map((category, index) => (
                        <button
                            key={index}
                            onClick={() => handleTabClick(category?.name)}
                            className={`md:px-4  px-2.5 dark:shadow-md cursor-pointer py-1.5 md:py-2 md:text-sm text-sm  rounded-sm md:rounded-lg font-medium ${
                                activeTab === category?.name
                                    ? "bg-primary dark:bg-secondary text-white hover:bg-primary dark:hover:bg-secondary dark:bg-secondary"
                                    : "bg-gray-50 dark:bg-card  hover:bg-primary dark:hover:bg-secondary dark:bg-card hover:text-white  shadow-sm  border-primary dark:hover:text-white text-primary dark:text-secondary"
                            }`}
                        >
                            {category?.name}
                        </button>
                    ))}
                </div>

                <button
                    className="absolute right-0 z-10 p-2 bg-primary dark:bg-secondary text-white rounded-md md:hidden"
                    onClick={() => scroll(scrollRef, "right")}
                >
                    <FaChevronRight />
                </button>
            </div>

            <CardList
                getTabData={getTabData}
                contentScrollRef={contentScrollRef}
                activeTab={activeTab}
            />
        </div>
    );
}
