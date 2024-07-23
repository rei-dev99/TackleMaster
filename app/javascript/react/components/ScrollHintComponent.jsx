import React, { useEffect } from 'react';
import ScrollHint from 'scroll-hint';

const ScrollComponent = () => {
    useEffect(() => {
      new ScrollHint('.js-scrollable');
    }, []);
    return null; // コンテンツを返さない
};

export default ScrollComponent;
