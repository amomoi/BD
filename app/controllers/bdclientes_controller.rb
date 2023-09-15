class BdclientesController < ApplicationController
  before_action :set_bdcliente, only: %i[ show edit update destroy ]

  # GET /bdclientes or /bdclientes.json
  def index
    @bdclientes = Bdcliente.all
  end

  # GET /bdclientes/1 or /bdclientes/1.json
  def show
  end

  # GET /bdclientes/new
  def new
    @bdcliente = Bdcliente.new
  end

  # GET /bdclientes/1/edit
  def edit
  end

  # POST /bdclientes or /bdclientes.json
  def create
    @bdcliente = Bdcliente.new(bdcliente_params)

    respond_to do |format|
      if @bdcliente.save
        format.html { redirect_to bdcliente_url(@bdcliente), notice: "Bdcliente was successfully created." }
        format.json { render :show, status: :created, location: @bdcliente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bdcliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bdclientes/1 or /bdclientes/1.json
  def update
    respond_to do |format|
      if @bdcliente.update(bdcliente_params)
        format.html { redirect_to bdcliente_url(@bdcliente), notice: "Bdcliente was successfully updated." }
        format.json { render :show, status: :ok, location: @bdcliente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bdcliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bdclientes/1 or /bdclientes/1.json
  def destroy
    @bdcliente.destroy

    respond_to do |format|
      format.html { redirect_to bdclientes_url, notice: "Bdcliente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bdcliente
      @bdcliente = Bdcliente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bdcliente_params
      params.require(:bdcliente).permit(:nome_empresa, :site, :ativo_inativo)
    end
end
