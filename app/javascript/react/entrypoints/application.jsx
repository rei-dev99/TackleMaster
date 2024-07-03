import React from 'react';
import { createRoot } from 'react-dom/client';
import ScrollComponent from '../components/ScrollComponent';

document.addEventListener("turbo:load", () => {
    const rootElement = document.createElement('div');
    document.body.appendChild(rootElement);
    const root = createRoot(rootElement);
    root.render(<ScrollComponent />);
});
