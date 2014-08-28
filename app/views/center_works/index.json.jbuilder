json.array!(@center_works) do |center_work|
  json.extract! center_work, :id, :name, :deparment_id
  json.url center_work_url(center_work, format: :json)
end
