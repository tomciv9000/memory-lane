class MemorySerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :description, :people, :dates, :photos, :spot_id, :user_id 
end
