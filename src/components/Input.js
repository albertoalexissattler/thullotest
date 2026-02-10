import React from "react";
import '../css/Input.css';

const Input = (props) => {

    const [inputValue, setInputValue] = React.useState("");

    const onInputChange = (event) => {
        let value = event.target.value;

        event.preventDefault();
        setInputValue(value);
        try{
            props.onInputChange(value);
        }
        catch(error){
            console.log("No onChange function passed as props...");
        }
    }

    return (
        <div className="input-container">
            <input onChange={onInputChange} ref={props.reference} value={inputValue} className="input" type="text" placeholder={props.placeholder} id="input-field" name={props.inputName} />
            <label htmlFor="input-field" className="input-label">{props.label}</label>
        </div>
    );
}

export default Input;