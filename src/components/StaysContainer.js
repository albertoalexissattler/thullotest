import React from "react";
import Text from "./Text";
import Stay from './Stay';
import '../css/StaysContainer.css';

const stays = require("../stays.json");

const generateStay = (stay, id) => {
    return (
        <Stay id={id} stay={stay} />
    );
}

const getStaysByFilter = (filter) => {
    const location = filter.location;
    const city = location.city;
    const country = location.country;
    const guestsNumber = filter.guests;
    let noLocation = false;
    let newStays = [];

    if(country === "")
        noLocation = true;

    stays.forEach(stay => {
        if(!noLocation){
            if(city === stay.city && country === stay.country){
                if(guestsNumber < stay.maxGuests)
                    newStays.push(stay);
            }
            
        }
        else{
            if(guestsNumber < stay.maxGuests)
                newStays.push(stay);
        }
    });

    return newStays;

}

const StaysContainer = (props) => {
    const filter = props.filter;
    const [allStays, setStays] = React.useState(stays);
    let staysComponents = allStays.map((stay, id) => {
        return generateStay(stay, id);
    });

    const location = filter.location;
    
    React.useEffect(() => {
        setStays(getStaysByFilter(filter));
    }, [filter])

    return (
        <div className="stays-container">
            <div className="stays-container-top">
                <Text classes="large bold" text={location.country === "" ? "All stays" : `${location.city}, ${location.country}`} />
                <Text classes="" text={`${allStays.length > 12 ? "12" : allStays.length}+ stays`} />
            </div>
    
            <div className="stays-container-body">
                {staysComponents}
            </div>
        </div>
    );
}

export default StaysContainer;