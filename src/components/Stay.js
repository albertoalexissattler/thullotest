import React from "react";
import Text from "./Text";
import Icon from "./Icon";
import '../css/Stay.css';

const Stay = (props) => {
    const stayInfo = props.stay;
    return (
        <div className="stay" key={props.id}>
            <img className="stay-img" src={stayInfo.photo} alt="stay-img" />
            <div className="stay-info">
                <div className="topic">
                    <Text classes={`uppercase small super-host ${stayInfo.superHost ? "" : "hidden"}`} text="super host" />
                    <Text classes={`gray stay-type`} text={stayInfo.type} />
                    <div className="rating-container">
                        <Icon iconName="fa-solid fa-star" style={{color: "#EB5757"}} />
                        <Text classes="rating" text={stayInfo.rating} />
                    </div>
                    
                </div>

                <Text classes="stay-title" text={stayInfo.title} />
            </div>
        </div>
    );
}

export default Stay;