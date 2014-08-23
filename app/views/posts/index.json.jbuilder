json.array!(@posts) do |post|
  json.extract! post, :id, :nombre, :apellidos
  json.url post_url(post, format: :json)
end
