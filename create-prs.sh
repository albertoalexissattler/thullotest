#!/bin/bash

set -e

echo "🔀 Creating Pull Requests for Thullotest"
echo "========================================"
echo ""

REPO="albertoalexissattler/thullotest"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# ============================================
# PR #1: Location search (MERGED - Issue #4)
# ============================================
echo -e "${BLUE}Creating PR #1: Location search (MERGED)${NC}"

git checkout main
git pull origin main
git checkout -b feature/location-search

# Create some actual code
mkdir -p src/components

cat > src/components/SearchLocation.jsx << 'EOFC'
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
EOFC

git add .
git commit -m "feat: implement location search dropdown

- Add SearchLocation component
- Filter stays by city
- Clear search functionality

Closes #4"

git push origin feature/location-search

# Create and merge PR
gh pr create \
  --title "✅ Location search dropdown" \
  --body "## 📋 Related Issue
Closes #4

## 🎯 Changes Made
- ✅ SearchLocation component with dropdown
- ✅ Filter stays by selected city
- ✅ Clear search functionality
- ✅ Extract unique cities from stays.json

## 🧪 Testing
- Manual testing with sample data
- Verified filtering logic

## 📊 Story Points: 5
## 🏷️ Epic: Search & Filters" \
  --label "feature,frontend" \
  --assignee "@me"

# Merge it
gh pr merge --squash --delete-branch

echo -e "${GREEN}✅ PR #1 merged${NC}\n"

git checkout main
git pull

# ============================================
# PR #2: Guest counter (MERGED - Issue #5)
# ============================================
echo -e "${BLUE}Creating PR #2: Guest counter (MERGED)${NC}"

git checkout -b feature/guest-counter

cat > src/components/GuestCounter.jsx << 'EOFC'
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
EOFC

git add .
git commit -m "feat: add guest counter component

- Adults and children counters
- Increment/decrement buttons
- Total guest calculation
- Filter callback

Closes #5"

git push origin feature/guest-counter

gh pr create \
  --title "✅ Guest counter component" \
  --body "## 📋 Related Issue
Closes #5

## 🎯 Changes Made
- ✅ GuestCounter component
- ✅ Separate adults/children counters
- ✅ +/- buttons for each
- ✅ Total guest display
- ✅ Callback for filtering

## 📊 Story Points: 3
## 🏷️ Epic: Search & Filters" \
  --label "feature,frontend" \
  --assignee "@me"

gh pr merge --squash --delete-branch

echo -e "${GREEN}✅ PR #2 merged${NC}\n"

git checkout main
git pull

# ============================================
# PR #3: Property grid (MERGED - Issue #6)
# ============================================
echo -e "${BLUE}Creating PR #3: Property grid (MERGED)${NC}"

git checkout -b feature/property-grid

cat > src/components/StaysGrid.jsx << 'EOFC'
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
EOFC

cat > src/components/StaysGrid.css << 'EOFC'
.stays-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 2rem;
  padding: 2rem;
}

@media (max-width: 768px) {
  .stays-grid {
    grid-template-columns: 1fr;
    gap: 1rem;
    padding: 1rem;
  }
}
EOFC

git add .
git commit -m "feat: implement responsive property grid

- CSS Grid layout with auto-fit
- Responsive: 1-3 columns based on screen
- Mobile-first approach
- Proper spacing and gaps

Closes #6"

git push origin feature/property-grid

gh pr create \
  --title "✅ Property grid layout" \
  --body "## 📋 Related Issue
Closes #6

## 🎯 Changes Made
- ✅ StaysGrid component with CSS Grid
- ✅ Responsive layout (auto-fit)
- ✅ Breakpoint at 768px for mobile
- ✅ Proper spacing with gap
- ✅ Single column on mobile

## 📊 Story Points: 5
## 🏷️ Epic: Property Listings" \
  --label "feature,frontend" \
  --assignee "@me"

gh pr merge --squash --delete-branch

echo -e "${GREEN}✅ PR #3 merged${NC}\n"

git checkout main
git pull

# ============================================
# PR #4: Property card (MERGED - Issue #7)
# ============================================
echo -e "${BLUE}Creating PR #4: Property card (MERGED)${NC}"

git checkout -b feature/property-card

cat > src/components/StayCard.jsx << 'EOFC'
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
EOFC

cat > src/components/StayCard.css << 'EOFC'
.stay-card {
  border-radius: 12px;
  overflow: hidden;
  transition: transform 0.2s, box-shadow 0.2s;
  cursor: pointer;
}

.stay-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 16px rgba(0,0,0,0.1);
}

.stay-image {
  width: 100%;
  height: 200px;
  overflow: hidden;
}

.stay-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.stay-header {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  margin-bottom: 0.5rem;
}

.badge.super-host {
  background: #FF385C;
  color: white;
  padding: 0.25rem 0.5rem;
  border-radius: 4px;
  font-size: 0.75rem;
  font-weight: bold;
}

.rating {
  display: flex;
  align-items: center;
  gap: 0.25rem;
  margin-left: auto;
}
EOFC

git add .
git commit -m "feat: create StayCard component

- Property image display
- Super Host badge (conditional)
- Property type and rating
- Hover effects
- Responsive styling

Closes #7"

git push origin feature/property-card

gh pr create \
  --title "✅ Property card component" \
  --body "## 📋 Related Issue
Closes #7

## 🎯 Changes Made
- ✅ StayCard reusable component
- ✅ Image with lazy loading
- ✅ Super Host badge (conditional rendering)
- ✅ Star rating display
- ✅ Property type and beds count
- ✅ Hover effects and transitions

## 📊 Story Points: 3
## 🏷️ Epic: Property Listings" \
  --label "feature,frontend" \
  --assignee "@me"

gh pr merge --squash --delete-branch

echo -e "${GREEN}✅ PR #4 merged${NC}\n"

git checkout main
git pull

# ============================================
# PR #5: Search modal (OPEN - Issue #8)
# ============================================
echo -e "${BLUE}Creating PR #5: Search modal (OPEN)${NC}"

git checkout -b feature/search-modal

cat > src/components/SearchModal.jsx << 'EOFC'
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
EOFC

cat > src/components/SearchModal.css << 'EOFC'
.modal-backdrop {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.5);
  backdrop-filter: blur(4px);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
}

.modal-content {
  background: white;
  border-radius: 16px;
  padding: 2rem;
  max-width: 600px;
  width: 90%;
  max-height: 80vh;
  overflow-y: auto;
}

.modal-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 1.5rem;
}

.close-btn {
  background: none;
  border: none;
  font-size: 2rem;
  cursor: pointer;
  color: #666;
}

/* WIP - needs focus trap implementation */
/* TODO - add animation on open/close */
/* TODO - test with screen readers */
EOFC

git add .
git commit -m "wip: implement search modal

- Modal component with backdrop
- Integrates SearchLocation and GuestCounter
- ESC key to close
- Click outside to close
- Search button applies filters

Still TODO:
- Focus trap for accessibility
- Open/close animations
- Touch gestures for mobile"

git push origin feature/search-modal

gh pr create \
  --title "🚧 Search filter modal (WIP)" \
  --body "## 📋 Related Issue
Addresses #8

## 🎯 Changes Made
- ✅ SearchModal component structure
- ✅ Modal backdrop with blur effect
- ✅ Integrates SearchLocation component
- ✅ Integrates GuestCounter component
- ✅ ESC key closes modal
- ✅ Click outside closes modal
- ✅ Search button functionality

## 🚧 Still TODO
- [ ] Focus trap for accessibility
- [ ] Smooth open/close animations
- [ ] Mobile bottom sheet variant
- [ ] Unit tests

## 🔍 Review Notes
Looking for feedback on:
- Overall component structure
- State management approach
- Accessibility concerns

## 📊 Story Points: 5
## 🏷️ Epic: Search & Filters" \
  --label "feature,frontend" \
  --assignee "@me"

echo -e "${YELLOW}👀 PR #5 created (OPEN)${NC}\n"

git checkout main

# ============================================
# PR #6: Responsive navbar (OPEN - Issue #9)
# ============================================
echo -e "${BLUE}Creating PR #6: Responsive navbar (OPEN)${NC}"

git checkout -b feature/responsive-navbar

cat > src/components/Navbar.jsx << 'EOFC'
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
EOFC

cat > src/components/Navbar.css << 'EOFC'
.navbar {
  position: sticky;
  top: 0;
  background: white;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  z-index: 100;
  padding: 1rem 0;
}

.navbar-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.navbar-brand {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.logo {
  height: 32px;
  width: auto;
}

.navbar-search {
  flex: 1;
  max-width: 400px;
  margin: 0 2rem;
  padding: 0.75rem 1rem;
  border: 1px solid #ddd;
  border-radius: 24px;
  cursor: pointer;
  transition: box-shadow 0.2s;
}

.navbar-search:hover {
  box-shadow: 0 2px 8px rgba(0,0,0,0.15);
}

.mobile-menu-toggle {
  display: none;
  background: none;
  border: none;
  font-size: 1.5rem;
  cursor: pointer;
}

@media (max-width: 768px) {
  .navbar-search {
    display: none; /* WIP - needs mobile implementation */
  }
  
  .mobile-menu-toggle {
    display: block;
  }
}

/* TODO: Implement mobile menu dropdown */
/* TODO: Add sticky behavior on scroll */
EOFC

git add .
git commit -m "wip: add responsive navbar

- Navbar component with logo
- Search bar integration
- Mobile menu toggle button
- Sticky positioning
- Hover effects

Still WIP:
- Mobile menu dropdown implementation
- Mobile search variant
- Sticky scroll behavior"

git push origin feature/responsive-navbar

gh pr create \
  --title "🚧 Responsive navbar (WIP)" \
  --body "## 📋 Related Issue
Addresses #9

## 🎯 Changes Made
- ✅ Navbar component structure
- ✅ Windbnb logo and branding
- ✅ Search bar placeholder
- ✅ Mobile menu toggle button
- ✅ Sticky positioning
- ✅ Responsive breakpoint at 768px

## 🚧 Still TODO
- [ ] Mobile menu dropdown implementation
- [ ] Mobile search variant
- [ ] Sticky behavior customization

## 📊 Story Points: 3
## 🏷️ Epic: UI/UX Polish" \
  --label "feature,frontend,ui/ux" \
  --assignee "@me"

echo -e "${YELLOW}👀 PR #6 created (OPEN)${NC}\n"

git checkout main

# ============================================
# PR #7: Image lazy loading (DRAFT - Issue #10)
# ============================================
echo -e "${BLUE}Creating PR #7: Image lazy loading (DRAFT)${NC}"

git checkout -b feature/lazy-loading

cat > src/hooks/useLazyLoad.js << 'EOFC'
import { useEffect, useRef, useState } from 'react';

export const useLazyLoad = () => {
  const [isIntersecting, setIsIntersecting] = useState(false);
  const ref = useRef(null);
  
  useEffect(() => {
    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          setIsIntersecting(true);
          observer.disconnect();
        }
      },
      { threshold: 0.1 }
    );
    
    if (ref.current) {
      observer.observe(ref.current);
    }
    
    return () => observer.disconnect();
  }, []);
  
  return [ref, isIntersecting];
};

// TODO: Add tests
// TODO: Add srcset support for responsive images
// TODO: Implement placeholder skeleton
EOFC

git add .
git commit -m "wip: add lazy loading hook (incomplete)

- Basic Intersection Observer hook
- Disconnect after first intersection
- Configurable threshold

TODO:
- Add placeholder/skeleton component
- WebP format with fallback
- Responsive image srcset
- Unit tests"

git push origin feature/lazy-loading

gh pr create \
  --title "🚧 Image lazy loading (DRAFT - Early WIP)" \
  --body "## 📋 Related Issue
Related to #10

## 🎯 Early Progress
- ✅ Basic `useLazyLoad` hook with Intersection Observer
- ✅ Disconnect after first load

## ⚠️ Status
**DRAFT** - Very early work in progress

## 📝 Still TODO
- [ ] Skeleton/placeholder component
- [ ] WebP format with fallback
- [ ] Responsive srcset
- [ ] Integration with StayCard
- [ ] Unit tests
- [ ] Performance benchmarks

## 📊 Story Points: 2
## 🏷️ Epic: Property Listings

---
*Not ready for review - just pushing early progress*" \
  --label "feature,performance" \
  --assignee "@me" \
  --draft

echo -e "${YELLOW}🚧 PR #7 created (DRAFT)${NC}\n"

git checkout main

# ============================================
# Summary
# ============================================
echo ""
echo -e "${GREEN}=========================================${NC}"
echo -e "${GREEN}✨ All PRs created successfully!${NC}"
echo -e "${GREEN}=========================================${NC}"
echo ""

echo "Summary:"
echo "  ✅ PR #1: Location search (MERGED)"
echo "  ✅ PR #2: Guest counter (MERGED)"
echo "  ✅ PR #3: Property grid (MERGED)"
echo "  ✅ PR #4: Property card (MERGED)"
echo "  👀 PR #5: Search modal (OPEN - In Review)"
echo "  👀 PR #6: Responsive navbar (OPEN - In Review)"
echo "  🚧 PR #7: Lazy loading (DRAFT - WIP)"
echo ""
echo "View PRs: https://github.com/$REPO/pulls"
echo ""
