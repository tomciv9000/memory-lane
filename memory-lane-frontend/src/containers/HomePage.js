import React from 'react';
import { connect } from 'react-redux';
import PlaceContainer from './PlaceContainer'
import PlaceForm from './PlaceForm'
// PropTypes can be used to typecheck a component or prop
//import PropTypes from 'prop-types';
import GoogleMaps from '../components/GoogleMaps'
//import { List, Header, Grid, Image } from 'semantic-ui-react'
import AllSpotsMap from '../components/AllPlacesMap'
import { Link } from 'react-router-dom';

class HomePage extends React.Component {

    componentDidMount(){
        this.props.fetchPlaces()
    }

    componentWillReceiveProps(nextProps) {
        if(nextProps.newPlace) {
            this.props.places.places.push(nextProps.newPlace)
        }
    }

    callPlaceContainer = () => {
        if (this.props.places){
          return (<PlaceContainer place = {this.props} />)
        }else {
          return (<h1>No Places Logged Yet</h1>)
        }
    }
    
    passToMap = () => {
      if(this.props.places){
        return(<AllSpotsMap place={this.props.places.places}/>)
      }else{
        return (<h1>No places Yet</h1>)
      }
    }

    render () {
        return(
            <div >
              <center><p className="largetext">Travelog</p></center>
              <br></br>
                
                        {this.callTripContainer()}
                    
                      <TripForm />
             
      
              <div>
                {this.passToMap()}
              </div>
      
      
            </div>
        )
    }
         
}


//Homepage.propTypes = {
//    fetchPlaces: PropTypes.func.isRequired,
//    places: PropTypes.array.isRequired,
//    newPlace: PropTypes.object
//}
  
const mapStateToProps = state => ({
    places: state.places.places,
    newPlace: state.places.place,
})
  
export default connect(mapStateToProps, { fetchplaces })(HomePage)