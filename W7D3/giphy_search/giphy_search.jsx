import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import { fetchSearchGiphys } from './actions/giphy_actions';
import configureStore from './store/store';
import { receiveSearchGiphys } from './actions/giphy_actions';

document.addEventListener('DOMContentLoaded', () => {
	const store = configureStore();
  window.store = store;
  // window.receiveSearchGiphys = receiveSearchGiphys;
  // window.fetchSearchGiphys = fetchSearchGiphys;
	const root = document.getElementById('root');
	ReactDOM.render(<Root store={store} />, root);
});
