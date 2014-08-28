json.array!(@turnos) do |turno|
  json.extract! turno, :id, :title, :hora, :tolerance, :type, :orange
  json.url turno_url(turno, format: :json)
end
