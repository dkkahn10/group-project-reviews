import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';

$(function() {
  ReactDOM.render(
    <App data={data} />
    document.getElementById('react-update')
  );
});
