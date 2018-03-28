import React, { Component } from 'react';
import GiphysIndex from './giphys_index';

class GiphysSearch extends Component {
  constructor(props) {
    super(props),
    this.state = { searchTerm: "" }
  }

  render() {
    return (
      <div>
        <input
          value={this.state.searchTerm}
          onChange={(event) => this.setState({searchTerm: event.target.value})}/>
        <button className="submit" onClick={this.props.fetchSearchGiphys}>Search</button>

        {this.props.giphys.map((giphy, idx) => <img key={idx} src={giphy.bitly_gif_url}/>)}
      </div>
    );
  }
};

export default GiphysSearch;
