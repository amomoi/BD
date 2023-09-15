class Bdleitura < ApplicationRecord
    belongs_to :bdsensor

    before_save :check_status

    def check_status  
            #VERIFICA SE CLIENTE E SENSOR ESTA ATIVO
            p "Cliente"
            cliente = Bdsensor.where("id = ?", bdsensor_id).select(:bdcliente_id).pluck(:bdcliente_id)
            p cliente[0]

            p "Cliente_ativo_inativo"
            cliente_ativo_inativo = Bdcliente.where("id=?", cliente[0]).select(:ativo_inativo).pluck(:ativo_inativo).first.to_i
            p cliente_ativo_inativo

            p "Sensor_ativo_inativo"
            results = Bdsensor.where("id=?", bdsensor_id).select(:ativo_inativo).pluck(:ativo_inativo)
            if results.all?(&:blank?) #= 'nil'
                  sensor_ativo_inativo = ""
                  p sensor_ativo_inativo
            else 
                  sensor_ativo_inativo = Bdsensor.where("id=?", bdsensor_id).select(:ativo_inativo).pluck(:ativo_inativo).first.to_i
                  p sensor_ativo_inativo
            end

            p "Usuarios" #APENAS FOLLOW
            usuarios = Bdusuario.where("bdcliente_id = ?", cliente[0]).select(:celular).select(:SMS).pluck(:celular, :SMS)
            p usuarios

            if cliente_ativo_inativo == 1 && sensor_ativo_inativo == 1
                  sms_ativo = Bdusuario.where("Bdcliente_id = ?", cliente[0]).select(:SMS).select(:nome).select(:ativo_inativo).select(:celular)

                  sms_ativo.each do |s|
                        if s[:SMS] == "1"

                              #AQUISICAO DOS PARAMETROS PARA LOGICA

                              p "LI"
                              results = Bdsensor.where("id = ?", bdsensor_id).select(:LI).pluck(:LI)
                              if results.all?(&:blank?) #= 'nil'
                                    limite_inferior = ""
                                    p limite_inferior
                              else 
                                    limite_inferior = Bdsensor.where("id = ?", bdsensor_id).select(:LI).pluck(:LI).first.to_f
                                    p limite_inferior
                              end

                              p "LS"
                              results = Bdsensor.where("id = ?", bdsensor_id).select(:LS).pluck(:LS)
                              if results.all?(&:blank?) #= 'nil'
                                    limite_superior = ""
                                    p limite_superior               
                              else 
                                    limite_superior = Bdsensor.where("id = ?", bdsensor_id).select(:LS).pluck(:LS).first.to_f
                                    p limite_superior
                              end

                              p "Valor anterior"
                              results = Bdleitura.where("bdsensor_id = ?", bdsensor_id).select(:valor)
                              if results.all?(&:blank?) #= 'nil'
                                    p ""
                                    p "Valor"
                                    p valor
                              else 
                                    valor_anterior = valor_anterior = Bdleitura.where("bdsensor_id = ?", bdsensor_id).select(:valor).last
                                    p valor_anterior.valor
                                    p "Valor"
                                    p valor
                              end  


                              p "Flag notificacao"
                              results = Bdsensor.where("id = ?", bdsensor_id).select(:flag_notificacao).pluck(:flag_notificacao)
                              if results.all?(&:blank?) #= 'nil'
                                    p flag_notificacao = ""
                              else 
                                    flag_notificacao = Bdsensor.where("id = ?", bdsensor_id).select(:flag_notificacao).pluck(:flag_notificacao).first.to_i
                                    p flag_notificacao
                              end

                              p "Flag rearme"
                              results = Bdsensor.where("id = ?", bdsensor_id).select(:flag_rearme).pluck(:flag_rearme)
                              if results.all?(&:blank?) #= 'nil'
                                    p flag_rearme = ""                  
                              else 
                                    flag_rearme = Bdsensor.where("id = ?", bdsensor_id).select(:flag_rearme).pluck(:flag_rearme).first.to_i
                                    p flag_rearme
                              end

                              p "Flag mantec"
                              results = Bdsensor.where("id = ?", bdsensor_id).select(:flag_mantec).pluck(:flag_mantec)
                              if results.all?(&:blank?) #= 'nil'
                                    p flag_mantec = ""
                              else 
                                    flag_mantec = Bdsensor.where("id = ?", bdsensor_id).select(:flag_mantec).pluck(:flag_mantec).first.to_i
                                    p flag_mantec
                              end

                              if limite_inferior != "" || limite_superior != "" 
                                    if flag_mantec == 0 || flag_mantec == ""
                                          if !limite_inferior != "" || !limite_superior != ""
                                                if valor <= limite_inferior || valor >= limite_superior #checa se atingiu o valor limite (superior ou inferior)
                                                      p "Usuario ativo ou inativo"
                                                      p s[:ativo_inativo]
                                                      if s[:ativo_inativo] == 1
                                                            nome_da_empresa = Bdcliente.where("id = ?", cliente[0]).select(:nome_empresa).pluck(:nome_empresa)
                                                            p nome_da_empresa[0]
                                                            p bdsensor.nome_sensor
                                                            p "#{nome_da_empresa[0]} - #{s.nome}: SMS do Sensor #{bdsensor.nome_sensor} foi ativado #{Time.now.strftime("%I:%M%p - %d/%m/%Y")} pois atingiu o limite! Favor verificar!"
                                                            p "Enviou SMS por Leituras Controler"
                                                            BdleiturasController.enviarSMS(s[:celular], cliente[0], nome_da_empresa[0], s[:nome], bdsensor.nome_sensor)
                                                      else
                                                            p "Nao enviou SMS pois usuario esta inativo"
                                                      end 
                                                end
                                          end
                                    else #flag_mantec = 1
                                          flag_notificacao = 0
                                          flag_rearme = 0
                                          p "Ativou Manutenção"
                                    end
                              else
                                    p "Nao tem LI ou LS cadastrado"
                              end
                        else
                              p   "SMS desativado"
                        end
                  end
            else
                  #CANCELA SALVAMENTO POIS CLIENTE OU SENSOR ESTA INATIVO
                  errors.add(:base, "Salvamento cancelado pois cliente ou sensor esta inativo")
                  throw(:abort)
            end
            
      end
    

end
