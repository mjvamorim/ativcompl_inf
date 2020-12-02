json.array!(@atividades) do |atividade|
  json.extract! atividade, :id, :descricao, :modalidade_id, :aluno_id, :horas_req, :horas_jul, :anexo, :julgador_id
  json.url atividade_url(atividade, format: :json)
end
