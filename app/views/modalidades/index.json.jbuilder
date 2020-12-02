json.array!(@modalidades) do |modalidade|
  json.extract! modalidade, :id, :titulo, :limite
  json.url modalidade_url(modalidade, format: :json)
end
