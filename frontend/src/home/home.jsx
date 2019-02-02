import React, { Component } from "react";
import Term from "../components/terminal";
import Jumbo from "../components/jumbotron";
import { Terminal } from "xterm";

class HomePage extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }
  render() {
    return (
      <div>
        <Jumbo />
        {/* <Term /> */}
      </div>
    );
  }
}

export default HomePage;
