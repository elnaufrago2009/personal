json.array!(@deparments) do |deparment|
  json.extract! deparment, :id, :name
  json.url deparment_url(deparment, format: :json)
end
