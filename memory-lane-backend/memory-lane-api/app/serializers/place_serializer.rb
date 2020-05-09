class PlaceSerializer
  include FastJsonapi::ObjectSerializer
  has_many :spots

  def spots
    object.spots.map { |e| {locationID: e.id, location: e.location, lat: e.lat, lng: e.lng, memories: e.memories.map{ |j| {memoryID: j.id, description: j.description, people: j.people, dates: j.dates, photos: j.photos, spotID: j.spot_id, userID: j.user_id} }} }
  end


  attributes :name, :description, :user_id 
end
