class MemorySerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :id, :description, :people, :dates, :photos, :spot_id
end
