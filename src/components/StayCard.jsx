import React from 'react';
import './StayCard.css';

export const StayCard = ({ stay }) => {
  return (
    <article className="stay-card">
      <div className="stay-image">
        <img src={stay.photo} alt={stay.title} loading="lazy" />
      </div>
      
      <div className="stay-content">
        <div className="stay-header">
          {stay.superHost && (
            <span className="badge super-host">SUPER HOST</span>
          )}
          <span className="stay-type">{stay.type}</span>
          <div className="rating">
            <span className="star">⭐</span>
            <span>{stay.rating}</span>
          </div>
        </div>
        
        <h3 className="stay-title">{stay.title}</h3>
        
        <div className="stay-footer">
          <span className="beds">{stay.beds} beds</span>
        </div>
      </div>
    </article>
  );
};
