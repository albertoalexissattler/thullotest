import React from "react";
import Button from "./Button";
import Text from "./Text";
import Icon from "./Icon";
import '../css/Quantity.css';

const Quantity = (props) => {

    const [quantity, setQuantity] = React.useState(0);
    const [direction, setDirection] = React.useState(0);

    /*This function increases the quantity*/
    const increaseQuantity = (event) => {
        event.preventDefault();
        setQuantity(quantity + 1);
        setDirection(1);
    }

    /*This function decreases the quantity*/
    const decreaseQuantity = (event) => {
        event.preventDefault();
        if(quantity - 1 >= 0){
            setQuantity(quantity - 1);
            setDirection(-1);
        }
    }

    React.useEffect(() => {
        props.callback({quantity: quantity, direction: direction});
    }, [quantity]);

    return (
        <div className="qunatity">
            <Button onClick={decreaseQuantity} classes="small border-black small-br decrease-btn" component={<Icon iconName="fa-solid fa-minus" style={{fontSize: 12}} />} />
            <Text classes="qunatity-number" text={quantity} />
            <Button onClick={increaseQuantity} classes="small border-black small-br increase-btn" component={<Icon iconName="fa-solid fa-plus" style={{fontSize: 12}} />} />
        </div>
    );
}

export default Quantity;