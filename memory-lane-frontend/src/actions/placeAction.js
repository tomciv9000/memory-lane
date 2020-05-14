import { FETCH_PLACES, NEW_PLACE, GET_PLACE, NEW_SPOT, GET_SPOT, NEW_MEMORY, DELETE_PLACE, DELETE_SPOT, DELETE_MEMORY} from './types'

export const fetchTrips = (dispatch) =>{
  return function(dispatch) {

    fetch('http://localhost:3000/api/v1/users/1')
    .then(res => res.json())
    .then(trips => {

      return dispatch({
        type: FETCH_PLACES,
        payload: trips
    })})
  }
}

export const createTrip = (tripData) => (dispatch) => {

  fetch('http://localhost:3000/api/v1/trips',{
    method:'POST',
    headers: {
      'content-type': 'application/json'
    },
    body: JSON.stringify(tripData)
  })
  .then(res => res.json())
  .then(tripData => dispatch({
    type: NEW_PLACE,
    payload: tripData
  }))
}

export const getTrip = (id) => (dispatch) =>{

  fetch( `http://localhost:3000/api/v1/trips/${id}`)
  .then(res => res.json())
  .then(trip => {
    console.log(trip)
    return dispatch({
      type: GET_PLACE,
      payload: trip
  })})
}

export const createSPOT = (tripData) => (dispatch) => {


  fetch(`http://localhost:3000/api/v1/SPOTs`,{
    method:'POST',
    headers: {
      'content-type': 'application/json'
    },
    body: JSON.stringify(tripData)
  })
  .then(res => res.json())
  .then(tripData => dispatch({
    type: NEW_SPOT,
    payload: tripData
  }))

}

export const getSPOT = (id) => (dispatch) =>{
  console.log('get one SPOT action')
  fetch( `http://localhost:3000/api/v1/SPOTs/${id}`)
  .then(res => res.json())
  .then(SPOT => {
    console.log(SPOT)
    return dispatch({
      type: GET_SPOT,
      payload: SPOT
  })})
}

export const createEntry = (tripData) => (dispatch) => {

  console.log(tripData)
  fetch(`http://localhost:3000/api/v1/entries`,{
    method:'POST',
    headers: {
      'content-type': 'application/json'
    },
    body: JSON.stringify(tripData)
  })
  .then(res => res.json())
  .then(tripData => dispatch({
    type: NEW_MEMORY,
    payload: tripData
  }))
}

export const deleteTrip = (id, callback) => (dispatch) =>{

  fetch( `http://localhost:3000/api/v1/trips/${id}`,{
    method: 'DELETE',
  })
  .then(res => res.json())
  .then(trip => {

    return dispatch({
      type: DELETE_PLACE,
      payload: id
  })})
  .then(()=>callback())
}

export const deleteSPOT = (id, callback) => (dispatch) =>{

  fetch( `http://localhost:3000/api/v1/SPOTs/${id}`,{
    method: 'DELETE',
  })
  .then(res => res.json())
  .then(trip => {

    return dispatch({
      type: DELETE_SPOT,
      payload: id
  })})
  .then(()=>callback())
}

export const deleteEntry = (id) => (dispatch) =>{
  console.log(id)
  fetch( `http://localhost:3000/api/v1/entries/${id}`,{
    method: 'DELETE',
  })
  .then(res => res.json())
  .then(trip => {

    return dispatch({
      type: DELETE_MEMORY,
      payload: id
  })})

}