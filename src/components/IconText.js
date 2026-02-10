import React from "react";
import Icon from "./Icon";
import Text from "./Text";
import '../css/IconText.css';

const IconText = (props) => {
    return (
        <div className="icon-text">
            <Icon iconName={props.iconName} style={{color: props.textColor || "black"}} />
            <Text classes={props.textColor} text={props.text} />
        </div>
    );
}

export default IconText;