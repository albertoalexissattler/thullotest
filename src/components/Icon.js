import React from "react";


const Icon = (props) => {
    return <i className={props.iconName} style={props.style || {}}></i>;
}

export default Icon;