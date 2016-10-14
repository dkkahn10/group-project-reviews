import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App.js';

$(function() {
  if (document.getElementById('react-update') !== null) {
    ReactDOM.render(
      <App/>,
      document.getElementById('react-update')
    );
  }
});
