import React, { Component } from "react";
import { Terminal } from "xterm";
import * as attach from "xterm/lib/addons/attach/attach";
import * as fit from "xterm/lib/addons/fit/fit";

Terminal.applyAddon(attach);
Terminal.applyAddon(fit);

class Term extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  async componentDidMount() {
    const term = new Terminal({});
    term.open(this.termElm, true);
    term.fit();
    term.write("$ ");

    this.term = term;
  }

  render() {
    return (
      <div>
        <div ref={ref => (this.termElm = ref)} />
      </div>
    );
  }
}

export default Term;
