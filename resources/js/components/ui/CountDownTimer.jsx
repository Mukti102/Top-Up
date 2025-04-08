import { useState, useEffect } from "react";
import { motion, AnimatePresence } from "framer-motion";

const CountdownTimer = ({ expiredTime, transaction }) => {
    const status = transaction?.status_payment;
    const [isSuccess, setIsSuccess] = useState(false);
    const [timeLeft, setTimeLeft] = useState({
        days: 0,
        hours: 0,
        minutes: 0,
        seconds: 0,
    });

    useEffect(() => {
        if (!expiredTime || status === "success" || status === "expired")
            return;
        const updateTimer = () => {
            const now = Math.floor(Date.now() / 1000);
            const diff = expiredTime - now;

            if (diff <= 0) {
                setTimeLeft(null);
                return;
            }

            setTimeLeft({
                days: Math.floor(diff / 86400),
                hours: Math.floor((diff % 86400) / 3600),
                minutes: Math.floor((diff % 3600) / 60),
                seconds: diff % 60,
            });
        };

        updateTimer();
        const interval = setInterval(updateTimer, 1000);
        return () => clearInterval(interval);
    }, [expiredTime, status]);

    return (
        <div className="flex flex-col items-center gap-4   text-black rounded-lg">
            <div className="flex gap-3 text-center">
                {Object.entries(
                    timeLeft
                        ? timeLeft
                        : {
                              days: 0,
                              hours: 0,
                              minutes: 0,
                              seconds: 0,
                          }
                )?.map(([label, value]) => (
                    <div
                        key={label}
                        className="flex dark:shadow-md shadow-sm border-[1px] dark:border-stone-700  border-gray-50 bg-gray-50 dark:bg-card  flex-col items-center p-2 md:p-3 rounded-lg w-18 md:w-20 dark:text-dark-text"
                    >
                        <AnimatePresence mode="popLayout">
                            <motion.span
                                key={value}
                                initial={{ opacity: 0, y: -10 }}
                                animate={{ opacity: 1, y: 0 }}
                                exit={{ opacity: 0, y: 10 }}
                                transition={{ duration: 0.3 }}
                                className="text-2xl font-bold"
                            >
                                {value}
                            </motion.span>
                        </AnimatePresence>
                        <span className="md:text-sm text-xs dark:text-dark-text text-gray-600">
                            {label.charAt(0).toUpperCase() + label.slice(1)}
                        </span>
                    </div>
                ))}
            </div>
        </div>
    );
};

export default CountdownTimer;
