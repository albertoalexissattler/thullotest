import React, { useState } from 'react';

export const GuestCounter = ({ onGuestsChange }) => {
  const [adults, setAdults] = useState(0);
  const [children, setChildren] = useState(0);
  
  const increment = (type) => {
    if (type === 'adults') {
      const newAdults = adults + 1;
      setAdults(newAdults);
      onGuestsChange(newAdults + children);
    } else {
      const newChildren = children + 1;
      setChildren(newChildren);
      onGuestsChange(adults + newChildren);
    }
  };
  
  const decrement = (type) => {
    if (type === 'adults' && adults > 0) {
      const newAdults = adults - 1;
      setAdults(newAdults);
      onGuestsChange(newAdults + children);
    } else if (type === 'children' && children > 0) {
      const newChildren = children - 1;
      setChildren(newChildren);
      onGuestsChange(adults + newChildren);
    }
  };
  
  return (
    <div className="guest-counter">
      <div className="counter-row">
        <span>Adults</span>
        <div className="controls">
          <button onClick={() => decrement('adults')}>-</button>
          <span>{adults}</span>
          <button onClick={() => increment('adults')}>+</button>
        </div>
      </div>
      <div className="counter-row">
        <span>Children</span>
        <div className="controls">
          <button onClick={() => decrement('children')}>-</button>
          <span>{children}</span>
          <button onClick={() => increment('children')}>+</button>
        </div>
      </div>
      <div className="total">
        Total guests: {adults + children}
      </div>
    </div>
  );
};
