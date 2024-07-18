import React from 'react';
import { Link } from 'react-router-dom';

const BeforeLoginHeader = () => {
  return (
    <header className="bg-blue p-4 text-white md:p-6 fixed w-full top-0 left-0 z-10">
      <nav className="flex justify-between mx-auto container items-center">
        <div>
            <Link to="/" className="text-xl font-bold md:text-3xl">TackleMaster</Link>
        </div>
        <div className="md:space-x-6 space-x-2 font-bold">
            <Link to="/login" className="text-sm hover:opacity-70 transition-all duration-300 md:text-lg">ログイン</Link>
            <Link to="/users/new" className="text-sm hover:opacity-70 transition-all duration-300 md:text-lg">新規登録</Link>
            <Link to="/explanation" className="text-sm hover:opacity-70 transition-all duration-300 md:text-lg">釣り入門</Link>
        </div>
      </nav>
    </header>
  );
};

export default BeforeLoginHeader;