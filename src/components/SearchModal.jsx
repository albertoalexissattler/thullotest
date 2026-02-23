import React, { useState, useEffect } from 'react';
import { SearchLocation } from './SearchLocation';
import { GuestCounter } from './GuestCounter';
import './SearchModal.css';

export const SearchModal = ({ isOpen, onClose, onSearch, stays }) => {
  const [filters, setFilters] = useState({
    city: '',
    guests: 0
  });
  
  useEffect(() => {
    const handleEscape = (e) => {
      if (e.key === 'Escape') onClose();
    };
    
    if (isOpen) {
      document.addEventListener('keydown', handleEscape);
      document.body.style.overflow = 'hidden';
    }
    
    return () => {
      document.removeEventListener('keydown', handleEscape);
      document.body.style.overflow = 'unset';
    };
  }, [isOpen, onClose]);
  
  const handleSearch = () => {
    onSearch(filters);
    onClose();
  };
  
  if (!isOpen) return null;
  
  return (
    <div className="modal-backdrop" onClick={onClose}>
      <div className="modal-content" onClick={e => e.stopPropagation()}>
        <div className="modal-header">
          <h2>Edit your search</h2>
          <button onClick={onClose} className="close-btn">×</button>
        </div>
        
        <div className="modal-body">
          <section>
            <h3>Location</h3>
            <SearchLocation 
              stays={stays}
              onFilter={(city) => setFilters({...filters, ...city})}
            />
          </section>
          
          <section>
            <h3>Guests</h3>
            <GuestCounter 
              onGuestsChange={(guests) => setFilters({...filters, guests})}
            />
          </section>
        </div>
        
        <div className="modal-footer">
          <button onClick={handleSearch} className="search-btn">
            Search
          </button>
        </div>
      </div>
    </div>
  );
};
