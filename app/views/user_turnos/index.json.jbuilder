json.array!(@user_turnos) do |user_turno|
  json.extract! user_turno, :id, :user_id, :turno_id
  json.url user_turno_url(user_turno, format: :json)
end
