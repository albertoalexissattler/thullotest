import React from "react";
import Logo from './Logo';
import FiltersSection from "./FiltersSection";
import FilterOptions from "./FilterOptions";
import '../css/Header.css';


const Header = (props) => {
    const callbackFromModal = (filter) => {
        props.callBackFromHeader(filter);
    }
    return (
        <header>
            <Logo />
            <FiltersSection onFormSubmit={callbackFromModal} />
        </header>
    );
}

export default Header;