import React, { useState } from 'react';

export const SearchLocation = ({ stays, onFilter }) => {
  const [selectedCity, setSelectedCity] = useState('');
  
  // Get unique cities
  const cities = [...new Set(stays.map(stay => stay.city))];
  
  const handleCitySelect = (city) => {
    setSelectedCity(city);
    onFilter({ city });
  };
  
  const handleClear = () => {
    setSelectedCity('');
    onFilter({});
  };
  
  return (
    <div className="search-location">
      <input 
        type="text" 
        placeholder="Select location"
        value={selectedCity}
        readOnly
      />
      <div className="cities-dropdown">
        {cities.map(city => (
          <div 
            key={city}
            onClick={() => handleCitySelect(city)}
            className="city-option"
          >
            {city}
          </div>
        ))}
      </div>
      <button onClick={handleClear}>Clear</button>
    </div>
  );
};
