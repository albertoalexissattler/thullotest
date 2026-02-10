import React from "react";
import '../css/Button.css';

const Button = (props) => {

    const onButtonClick = (event) => {
        try{
            props.onClick(event);
        }
        catch(error){
            console.log("no function");
        }
        
    }

    return (
        <button onClick={onButtonClick} className={`button ${props.classes}`}>{props.component}</button>
    );
}

export default Button;