import React from "react";
import Button from "./Button";
import Text from './Text';
import Icon from "./Icon";

const FilterOptions = (props) => {

    const onButtonClick = (event) => {
        props.onButtonClick();
    }

    return (
        <div className="filter-options">
            <Button onClick={onButtonClick} classes="border-radius-left filter-option location-f" component={<Text classes="gray" text="Add location" />} />
            <Button onClick={onButtonClick}  classes="border-radius-none filter-option guests-f" component={<Text classes="gray" text="Add guests" />} />
            <Button onClick={onButtonClick}  classes="border-radius-right filter-option search" component={<Icon iconName="fas fa-search" style={{color: "#EB5757", fontSize: 16}} />} />
        </div>
    );
}

export default FilterOptions;