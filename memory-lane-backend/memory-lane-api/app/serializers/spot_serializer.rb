class SpotSerializer
  include FastJsonapi::ObjectSerializer
  has_many :memories

  def memories
    object.memories.map { |j| {memoryID: j.id, description: j.description, dates: j.dates, photos: j.photos, userID: j.user_id, spotID: j.spot_id }}
  end
 
  attributes :location, :lat, :lng, :place_id
end
