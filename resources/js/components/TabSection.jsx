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
        <div className="relative w-full mt-5 px-5">
            {/* Tab Navigation */}
            <div className="relative flex items-center justify-center">
                <button
                    className="absolute left-0 z-10 p-2 bg-[var(--primary)] text-white rounded-full md:hidden"
                    onClick={() => scroll(scrollRef, "left")}
                >
                    <FaChevronLeft />
                </button>

                <div
                    ref={scrollRef}
                    className="flex cursor-pointer group  w-full gap-4 overflow-x-auto  scroll-smooth scrollbar-hide whitespace-nowrap md:px-0 px-10 md:justify-start"
                >
                    {categories?.map((category, index) => (
                        <button
                            key={index}
                            onClick={() => handleTabClick(category?.name)}
                            className={`px-4 hover:bg-[var(--primary)] hover:text-white  cursor-pointer py-2 text-sm shadow-md rounded-lg font-medium ${
                                activeTab === category?.name
                                    ? "bg-[var(--primary)] text-white"
                                    : "bg-transparent border-1 border-[var(--primary)] text-primary"
                            }`}
                        >
                            {category?.name}
                        </button>
                    ))}
                </div>

                <button
                    className="absolute right-0 z-10 p-2 bg-[var(--primary)] text-white rounded-full md:hidden"
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
