import React from "react";
import FilterOptions from "./FilterOptions";
import Modal from "./Modal";

const FiltersSection = (props) => {

    const [modalHidden, setModalState] = React.useState(true);
    const modalClass = modalHidden ? "hidden" : "";

    const onFilterOptionClicked = (event) => {
        setModalState(!modalHidden);
    }

    const onFormSubmit = (filter) => {
        onFilterOptionClicked();
        props.onFormSubmit(filter);
    }

    return (
        <div className="filters-section">
            <FilterOptions onButtonClick={onFilterOptionClicked} />
            <Modal onSubmit={onFormSubmit} hidden={modalClass} />
        </div>
    );
}

export default FiltersSection;