import React from "react";
import '../css/Text.css';

const Text = (props) => {
    return <p ref={props.refer || null} className={`text ${props.classes}`}>{props.text}</p>
}

export default Text;