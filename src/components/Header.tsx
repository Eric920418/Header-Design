import React, { useState } from 'react';
import { Search, User, Menu, X } from 'lucide-react';

export function Header() {
  const [menuOpen, setMenuOpen] = useState(false);

  const navItems = [
    '廚房產品',
    '靈感案例',
    '門市服務',
    '優惠活動',
    '品牌承諾',
    '我要加盟'
  ];

  return (
    <header className="w-full">
      {/* 上方區塊 - Logo 和圖示 */}
      <div className="bg-gradient-to-r from-[#C4A574] to-[#D4B887] px-6 py-4">
        <div className="max-w-7xl mx-auto flex items-center justify-between">
          {/* Logo */}
          <div>
            <img src="/logo.svg" alt="Logo" className="h-5" />
          </div>

          {/* 右側圖示 */}
          <div className="flex items-center gap-4">
            <button className="text-white hover:opacity-80 transition-opacity">
              <Search size={24} />
            </button>
            <button className="text-white hover:opacity-80 transition-opacity">
              <User size={24} />
            </button>
            {/* 漢堡按鈕 - 手機版 */}
            <button
              className="text-white hover:opacity-80 transition-opacity lg:hidden"
              onClick={() => setMenuOpen(!menuOpen)}
            >
              {menuOpen ? <X size={24} /> : <Menu size={24} />}
            </button>
          </div>
        </div>
      </div>

      {/* 導航選單 */}
      <nav className={`bg-white ${menuOpen ? 'block' : 'hidden'} lg:block`}>
        <div className="max-w-7xl mx-auto px-6">
          <ul className="flex flex-col lg:flex-row items-start lg:items-center justify-end gap-4 lg:gap-8 py-4">
            {navItems.map((item, index) => (
              <li key={index}>
                <a
                  href="#"
                  className="text-gray-700 hover:text-[#C4A574] transition-colors text-sm"
                  onClick={() => setMenuOpen(false)}
                >
                  {item}
                </a>
              </li>
            ))}
          </ul>
        </div>
      </nav>
    </header>
  );
}
