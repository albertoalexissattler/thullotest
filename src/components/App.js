import React from "react";
import Header from "./Header";
import StaysContainer from "./StaysContainer";
import '../css/App.css';

const App = () => {
    const [filter, setFilter] = React.useState(
        {
            location: {
                city: "",
                country: ""
            },
            guests: -1
        }
    );

    /*This function gets called when the user submitted the form*/
    const onSearchButton = (filter) => {
        setFilter(filter);
    }

    return (
        <>
            <Header callBackFromHeader={onSearchButton} />
            <StaysContainer filter={filter} />
        </>
    );
}

export default App;