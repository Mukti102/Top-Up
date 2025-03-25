import React from "react";
import styled from "styled-components";

const RecomendedCard = () => {
    return (
        <StyledWrapper>
            <div className="card border-[0.1px] border-gray-600  rounded-lg">
                <div className="flex h-full gap-3 items-center">
                    {/* img */}
                    <div className="h-full w-1/5 rounded-lg overflow-hidden">
                        <img
                            src="https://i.pinimg.com/474x/55/03/ab/5503ab70accdb521ad9c2f593cd89830.jpg"
                            className=""
                            alt=""
                        />
                    </div>
                    <div className="space-y-[3px]">
                        <h1 className="text-sm font-semibold">
                            Genshin Impact
                        </h1>
                        <p className="text-xs text-gray-300">
                            Lorem ipsum dolor sit amet.
                        </p>
                    </div>
                </div>
            </div>
        </StyledWrapper>
    );
};

const StyledWrapper = styled.div`
    .card {
        --white: hsl(0, 0%, 100%);
        --black: hsl(240, 15%, 9%);
        --paragraph: hsl(0, 0%, 83%);
        --line: hsl(240, 9%, 17%);
        --primary: hsl(189, 92%, 58%);

        position: relative;

        display: flex;
        flex-direction: column;
        gap: 1rem;

        padding: 0.6rem;
        width: 100%;
        height: 100px;
        background-color: hsla(240, 15%, 9%, 1);
        background-image: radial-gradient(
                at 88% 40%,
                hsla(240, 15%, 9%, 1) 0px,
                transparent 85%
            ),
            radial-gradient(
                at 49% 30%,
                hsla(240, 15%, 9%, 1) 0px,
                transparent 85%
            ),
            radial-gradient(
                at 14% 26%,
                hsla(240, 15%, 9%, 1) 0px,
                transparent 85%
            ),
            radial-gradient(at 0% 64%, hsl(189, 99%, 26%) 0px, transparent 85%),
            radial-gradient(at 41% 94%, hsl(189, 97%, 36%) 0px, transparent 85%),
            radial-gradient(
                at 100% 99%,
                hsl(188, 94%, 13%) 0px,
                transparent 85%
            );

        border-radius: 1rem;
        box-shadow: 0px -16px 24px 0px rgba(255, 255, 255, 0.25) inset;
    }

    .card .card__border {
        overflow: hidden;
        pointer-events: none;

        position: absolute;
        z-index: -10;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);

        width: calc(100% + 2px);
        height: calc(100% + 2px);
        background-image: linear-gradient(
            0deg,
            hsl(0, 0%, 100%) -50%,
            hsl(0, 0%, 40%) 100%
        );

        border-radius: 1rem;
    }

    .card .card__border::before {
        content: "";
        pointer-events: none;

        position: fixed;
        z-index: 200;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%), rotate(0deg);
        transform-origin: left;

        width: 200%;
        height: 10rem;
        background-image: linear-gradient(
            0deg,
            hsla(0, 0%, 100%, 0) 0%,
            hsl(189, 100%, 50%) 40%,
            hsl(189, 100%, 50%) 60%,
            hsla(0, 0%, 40%, 0) 100%
        );

        animation: rotate 8s linear infinite;
    }

    @keyframes rotate {
        to {
            transform: rotate(360deg);
        }
    }
`;

export default RecomendedCard;
