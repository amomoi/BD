json.extract! bdusuario, :id, :nome, :email, :CPF, :celular, :senha, :SMS, :ativo_inativo, :bdcliente_id, :created_at, :updated_at
json.url bdusuario_url(bdusuario, format: :json)
