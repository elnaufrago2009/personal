json.array!(@registros) do |registro|
  json.extract! registro, :id, :fecha_hora, :register_turnos, :tarde, :option, :turno_id
  json.url registro_url(registro, format: :json)
end
