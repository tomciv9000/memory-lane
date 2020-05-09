class UserSerializer
  include FastJsonapi::ObjectSerializer

  has_many :places


  def places
    object.places.map { |e| {placeID: e.id, name: e.name, description: e.description, spots:e.spots.map{ |j| {locationID: j.id, location: j.location, lat:j.lat, lng: j.lng, memories: j.memories} }} }
  end


  attributes :id, :username

end
