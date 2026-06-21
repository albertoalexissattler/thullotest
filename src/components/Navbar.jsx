import React, { useState } from 'react';
import './Navbar.css';

export const Navbar = ({ onSearchClick }) => {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  
  return (
    <nav className="navbar">
      <div className="navbar-container">
        <div className="navbar-brand">
          <img src="/logo.svg" alt="Windbnb" className="logo" />
          <span className="brand-name">windbnb</span>
        </div>
        
        <div className="navbar-search" onClick={onSearchClick}>
          <span className="search-placeholder">Start your search</span>
        </div>
        
        <button 
          className="mobile-menu-toggle"
          onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
        >
          ☰
        </button>
      </div>
    </nav>
  );
};
