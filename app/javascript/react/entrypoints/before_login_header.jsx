import React from "react";
import { createRoot } from "react-dom/client";
import { BrowserRouter } from "react-router-dom";
import BeforeLoginHeader from "../components/BeforeLoginHeader";

document.addEventListener('turbo:load', () => {
    const container = document.getElementById('before-login-header');
    if (container) {
        const root = createRoot(container);
        root.render(
            <BrowserRouter>
                <BeforeLoginHeader />
            </BrowserRouter>
        );
    }
});