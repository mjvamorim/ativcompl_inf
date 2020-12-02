json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :nome, :email, :matricula, :curso, :tipo, :confirmed_at, :updated_at,
  json.url usuario_url(usuario, format: :json)
end
