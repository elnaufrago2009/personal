json.array!(@assign_roles) do |assign_role|
  json.extract! assign_role, :id, :nombre
  json.url assign_role_url(assign_role, format: :json)
end
