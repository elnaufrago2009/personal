json.array!(@admins) do |admin|
  json.extract! admin, :id, :nombre, :user_normal_id, :user_admin_id
  json.url admin_url(admin, format: :json)
end
