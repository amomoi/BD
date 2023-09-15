class BdleiturasController < ApplicationController
  before_action :set_bdleitura, only: %i[ show edit update destroy ]
  before_action :set_bdsensor

  skip_before_action :verify_authenticity_token
  # skip_before_action :authenticate_user!


  require 'net/http'
  Time.zone = 'Brasilia'

  # GET /bdleituras or /bdleituras.json
  def index
    releaseCrossDomain

    if @bdsensor == Bdsensor.all
      @bdleituras = Bdleitura.all
    else
      @bdleituras = Bdleitura.where(bdsensor_id: @bdsensor.id)
    end

  end

  # GET /bdleituras/1 or /bdleituras/1.json
  def show
  end

  # GET /bdleituras/new
  def new
    @bdleitura = Bdleitura.new
  end

  # GET /bdleituras/1/edit
  def edit
  end

  # POST /bdleituras or /bdleituras.json
  def create
    releaseCrossDomain
    @bdleitura = Bdleitura.new(bdleitura_params)

    respond_to do |format|
      if @bdleitura.save
        format.html { redirect_to bdleitura_url(@bdleitura), notice: "Bdleitura was successfully created." }
        format.json { render :show, status: :created, location: @bdleitura }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bdleitura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bdleituras/1 or /bdleituras/1.json
  def update
    respond_to do |format|
      if @bdleitura.update(bdleitura_params)
        format.html { redirect_to bdleitura_url(@bdleitura), notice: "Bdleitura was successfully updated." }
        format.json { render :show, status: :ok, location: @bdleitura }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bdleitura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bdleituras/1 or /bdleituras/1.json
  def destroy
    @bdleitura.destroy

    respond_to do |format|
      format.html { redirect_to bdleituras_url, notice: "Bdleitura was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  require 'json'
  require 'uri'
  require 'net/http'

  def self.enviarSMS(numero_celular, numero_cliente, empresa, usuario, sensor)
        p "Enviou SMS para"
        p numero_celular
        p numero_cliente
        Time.zone = 'Brasilia'
    
        data = {
                    "smss": [
                        {
                            "numero": numero_celular,
                            "idCustom": numero_cliente,
                            "mensagem": "#{empresa} - #{usuario}: Sensor #{sensor} foi ativado #{Time.zone.now.strftime("%I:%M%p - %d/%m/%Y")}  pois atingiu o limite! Favor verificar!"
                        },
                        
                        #// {
                        #// "numero": "11995672927",
                        #//     "idCustom": "2",
                        #// "mensagem": "Envio teste via RoR"
                        #// },
                    ],
                    "envioImediato": true,
                    "centroCusto": "6141f787b62e99838c27e9dd",
                }

                
        url = URI("http://v2.bestuse.com.br/api/v1/envioApi?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpbiI6ImFtcG0iLCJfaWQiOiI2MTQxZjc4N2I2MmU5OTgzOGMyN2U5ZGQiLCJjbGllbnRlIjoiNjE0MWY3NjBiNjJlOTk4MzhjMjdlOWNmIiwic2FsZG8iOjEwMjQsImJ5Q0MiOnRydWUsImlhdCI6MTY5MzQzMDkzN30.J5pX0eFh3LSkivzKyeorde9-jJC_0SOqf2aaMtkV6kQ")
        http = Net::HTTP.new(url.host, url.port)

        request = Net::HTTP::Post.new(url)
        request["Content-Type"] = 'application/json'
        request["Authorization"] = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpbiI6ImFtcG0iLCJfaWQiOiI2MTQxZjc4N2I2MmU5OTgzOGMyN2U5ZGQiLCJjbGllbnRlIjoiNjE0MWY3NjBiNjJlOTk4MzhjMjdlOWNmIiwic2FsZG8iOjEwMjQsImJ5Q0MiOnRydWUsImlhdCI6MTY5MzQzMDkzN30.J5pX0eFh3LSkivzKyeorde9-jJC_0SOqf2aaMtkV6kQ'
        request.body = data.to_json
        response = http.request(request)
        #puts response.read_body
        #p response           
    end


  private
  def set_bdsensor
    @bdsensor = Bdsensor.where(id: params[:bdsensor_id]).first
    if @bdsensor.nil?
      @bdsensor = Bdsensor.all
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_bdleitura
      @bdleitura = Bdleitura.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bdleitura_params
      params.require(:bdleitura).permit(:valor, :bdsensor_id)
    end

    def releaseCrossDomain

      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET,PUT'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = '*'
    end
  
  
end
