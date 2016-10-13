import React, { Component } from 'react';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      locations: []
    };
  }

  componentDidMount() {
    $.ajax({
      url: '/locations.json',
      method: "GET"
    })

    .done(data => {
      this.setState ({
        locations: data.locations
      })
    })
  }

  render() {
    let locations = "";

    if (this.state.locations.length !== 0) {
      locations = this.state.locations.map(location => {
        let locations_url = `/locations/${location.id}`
        return(
          <li key={location.id}>
            <a href={locations_url}>{location.name_of_location}</a>
          </li>
        )
      })
    }

    return(
      <ul> {locations} </ul>
    );
  }
}

export default App;
