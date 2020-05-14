//import React from 'react';
//import ReactDOM from 'react-dom';
//import './index.css';
//import App from './App';
//import * as serviceWorker from './serviceWorker';
//import { Provider } from 'react-redux';
//import Store from './Store';
//import routes from './routes';
//import {Router, browserHistory} from 'react-router'
//import {BrowserRouter, Route} from 'react-router-dom'
//
//
//
//ReactDOM.render(
//  <Provider store={Store}>
//    <React.StrictMode>
//    <BrowserRouter>
//      <App />
//    </BrowserRouter>
//    </React.StrictMode>
//  </Provider>,
//  document.getElementById('root')
//);

import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';

ReactDOM.render(<App />, document.getElementById('root'));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
