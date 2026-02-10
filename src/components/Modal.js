import React from "react";
import Text from "./Text";
import IconText from "./IconText";
import Button from "./Button";
import QunatityForm from "./QuantityForm";
import '../css/Modal.css';

const Modal = (props) => {

    /*The locations that available*/
    const locations = [
        {
            city: "Turku",
            country: "Finland"
        },
        {
            city: "Helsinki",
            country: "Finland"
        },
        {
            city: "Vaasa",
            country: "Finland"
        },
        {
            city: "Oulu",
            country: "Finland"
        }
    ];

    const [locationsState, setLocationShow] = React.useState(false);
    const [guestsQuantityContainer, showGuestsQunatity] = React.useState(false);
    let hidden = true;
    const [filter, setFilter] = React.useState({
        location: {
            city: "",
            country: ""
        },
        guests: -1
    });

    const [guestsNumber, setGuestsNumber] = React.useState(0);

    const LocationText = React.useRef(null);

    const onQuantityChanged = (quantity) => {
        setGuestsNumber(guestsNumber + quantity.direction);
    }

    /*This function open the locations list*/
    const onLocationColumnClick = () => {
        setLocationShow(!locationsState);
    }

    /*This function opens the quantity change section*/
    const onGuestsColumnClick = () => {
        showGuestsQunatity(!guestsQuantityContainer);
    }

    /*This function gets triggered when the user choose location*/
    const onLocationButtonClick = (location) => {
        let locationName = location.target.innerText;
        let splittedLocation = locationName.split(',');
        let city = splittedLocation[0];
        let country = splittedLocation[1].slice(1, splittedLocation[1].length);

        LocationText.current.innerText = locationName;
        setFilter({
            ...filter,
            location: {
                city: city,
                country: country
            }
        });
    }

    const onFormSubmitted = () => {
        hidden = true;
        setFilter({
            ...filter,
            guests: guestsNumber
        });

        props.onSubmit(filter);
    }

    /*This function returns a Button component that contains the location data*/
    const getLocation = (location) => {
        return <Button onClick={onLocationButtonClick} classes="only-text" component={<IconText iconName="" text={`${location.city}, ${location.country}`} />} />
    }

    /*All the location elements*/
    const allLocations = locations.map((location) => {
        return getLocation(location);
    });
    
    return (
        <div className={`modal ${props.hidden}`}>
            <div className="modal-options">
                <div className="column">
                    <div className="text-container" onClick={onLocationColumnClick}>
                        <Text classes="small bold uppercase column-topic" text="location" />
                        <Text refer={LocationText} classes="gray column-description" text="Add a location" />
                    </div>
                    
                    <div className="list"  style={{display: locationsState ? "flex" : "none"}}>
                        {allLocations}
                    </div>
                </div>
                <div className="column">
                    <div className="text-container" onClick={onGuestsColumnClick}>
                        <Text classes="small bold uppercase column-topic" text="guest" />
                        <Text classes="gray column-description" text="Add a guests" />
                    </div>
                    

                    <div className="list" style={{display: guestsQuantityContainer ? "block" : "none"}}>
                        <QunatityForm
                            topic="Adults"
                            description="Age 13 or above"
                            onQuantityChanged={onQuantityChanged}
                        />

                        <QunatityForm
                            topic="Children"
                            description="Ages 2-12"
                            onQuantityChanged={onQuantityChanged}
                        />
                    </div>
                    
                </div>
                <Button onClick={onFormSubmitted} classes="btn-red search-btn" component={<IconText iconName="fas fa-search" textColor="white" text="Search" />}  />
            </div>
        </div>
    );
}

export default Modal;