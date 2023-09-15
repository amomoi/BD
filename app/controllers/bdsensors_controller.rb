class BdsensorsController < ApplicationController
  before_action :set_bdsensor, only: %i[ show edit update destroy ]
  before_action :set_bdcliente


  skip_before_action :verify_authenticity_token
  # skip_before_action :authenticate_user!

  # GET /bdsensors or /bdsensors.json
  def index
    releaseCrossDomain
    if @bdcliente == Bdcliente.all
      @bdsensors = Bdsensor.all
    else
      @bdsensors = Bdsensor.where(bdcliente_id: @bdcliente.id)
    end
  end

  # GET /bdsensors/1 or /bdsensors/1.json
  def show
  end

  # GET /bdsensors/new
  def new
    @bdsensor = Bdsensor.new
  end

  # GET /bdsensors/1/edit
  def edit
  end

  # POST /bdsensors or /bdsensors.json
  def create
    releaseCrossDomain
    @bdsensor = Bdsensor.new(bdsensor_params)

    respond_to do |format|
      if @bdsensor.save
        format.html { redirect_to bdsensor_url(@bdsensor), notice: "Bdsensor was successfully created." }
        format.json { render :show, status: :created, location: @bdsensor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bdsensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bdsensors/1 or /bdsensors/1.json
  def update
    respond_to do |format|
      if @bdsensor.update(bdsensor_params)
        format.html { redirect_to bdsensor_url(@bdsensor), notice: "Bdsensor was successfully updated." }
        format.json { render :show, status: :ok, location: @bdsensor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bdsensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bdsensors/1 or /bdsensors/1.json
  def destroy
    @bdsensor.destroy

    respond_to do |format|
      format.html { redirect_to bdsensors_url, notice: "Bdsensor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_bdcliente
      @bdcliente = Bdcliente.where(id: params[:bdcliente_id]).first
      if @bdcliente.nil?
        @bdcliente = Bdcliente.all
      end
    end


    def set_bdsensor
      @bdsensor = Bdsensor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bdsensor_params
      params.require(:bdsensor).permit(:nome_sensor, :time_read, :LI, :LS, :arg1, :arg2, :arg3, :arg4, :arg5, :flag_notificacao, :flag_rearme, :flag_mantec, :ativo_inativo, :bdtipo_id, :bdcliente_id)
    end

    def releaseCrossDomain

      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET,PUT'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = '*'
    end
  

  
end
