import React from "react";
import Text from "./Text";
import Quantity from "./Qunatity";

const QunatityForm = (props) => {

    const callbackFunc = (qunatity) => {
        props.onQuantityChanged(qunatity);
    }

    return (
        <div className={`quantity-form ${props.hidden}`}>
            <Text classes="bold form-topic" text={props.topic} />
            <Text classes="gray form-description" text={props.description} />

            <Quantity callback={callbackFunc} />

        </div>
    );
}

export default QunatityForm;