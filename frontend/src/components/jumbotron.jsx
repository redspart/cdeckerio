import React, { Component } from "react";
import Jumbotron from "react-bootstrap/Jumbotron";
const jumboStyle = {
  backgroundPosition: "0% 25%",
  backgroundSize: "cover",
  backgroundRepeat: "no-repeat",
  backgroundImage: "url(jumboimage.png)",
  position: "absolute",
  minHeight: "100vh",
  filter: "blur(1px)",
  top: "0",
  left: "0",
  right: "0",
  bottom: "0",
  zIndex: "-1"
};

const innerText = {
  //   color: "black",
  //   fontSize: "calc(10px + 2vmin)",
  //   position: "fixed",
  //   top: "50%",
  //   width: "50%",
  //   transform: "translate(50%, 50%)",
  //   background: "white",
  //   width: "200px",
  //   height: "200px",
  //   borderRadius: "50%"
};

class Jumbo extends Component {
  render() {
    return (
      <div>
        <div class="jumbotron d-flex align-items-center">
          <div class="bg" style={jumboStyle} />
          <div class="container">
            <h1>Hello</h1>
          </div>
        </div>
      </div>
    );
  }
}

export default Jumbo;
