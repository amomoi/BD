json.extract! bdsensor, :id, :nome_sensor, :time_read, :LI, :LS, :arg1, :arg2, :arg3, :arg4, :arg5, :flag_notificacao, :flag_rearme, :flag_mantec, :ativo_inativo, :bdtipo_id, :bdcliente_id, :created_at, :updated_at
json.url bdsensor_url(bdsensor, format: :json)
