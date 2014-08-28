json.array!(@areas) do |area|
  json.extract! area, :id, :name, :center_work_id
  json.url area_url(area, format: :json)
end
