import * as types from './types';
import sessionApi from '../api/sessionApi';

export function loginSuccess() {
  return {type: types.LOG_IN_SUCCESS}
}

export function logInUser(credentials) {
  return function(dispatch) {
    return sessionApi.login(credentials).then(response => {
      console.log(response)
      localStorage.setItem('token', response.token);
      localStorage.setItem('username', response.username)
      localStorage.setItem('user_id', response.user_id)
      dispatch(loginSuccess());
    }).catch(error => {
      throw(error);
    });
  };
}