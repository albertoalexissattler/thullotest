import React from 'react';
import { StayCard } from './StayCard';
import './StaysGrid.css';

export const StaysGrid = ({ stays }) => {
  return (
    <div className="stays-grid">
      {stays.map(stay => (
        <StayCard key={stay.id} stay={stay} />
      ))}
    </div>
  );
};
