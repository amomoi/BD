class BdusuariosController < ApplicationController
  before_action :set_bdusuario, only: %i[ show edit update destroy ]
  before_action :set_bdcliente

  # GET /bdusuarios or /bdusuarios.json
  def index
    if @bdcliente == Bdcliente.all
      @bdusuarios = Bdusuario.all
    else
      @bdusuarios = Bdusuario.where(bdcliente_id: @bdcliente.id)
    end
  end

  # GET /bdusuarios/1 or /bdusuarios/1.json
  def show
  end

  # GET /bdusuarios/new
  def new
    @bdusuario = Bdusuario.new
  end

  # GET /bdusuarios/1/edit
  def edit
  end

  # POST /bdusuarios or /bdusuarios.json
  def create
    @bdusuario = Bdusuario.new(bdusuario_params)

    respond_to do |format|
      if @bdusuario.save
        format.html { redirect_to bdusuario_url(@bdusuario), notice: "Bdusuario was successfully created." }
        format.json { render :show, status: :created, location: @bdusuario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bdusuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bdusuarios/1 or /bdusuarios/1.json
  def update
    respond_to do |format|
      if @bdusuario.update(bdusuario_params)
        format.html { redirect_to bdusuario_url(@bdusuario), notice: "Bdusuario was successfully updated." }
        format.json { render :show, status: :ok, location: @bdusuario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bdusuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bdusuarios/1 or /bdusuarios/1.json
  def destroy
    @bdusuario.destroy

    respond_to do |format|
      format.html { redirect_to bdusuarios_url, notice: "Bdusuario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bdusuario
      @bdusuario = Bdusuario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bdusuario_params
      params.require(:bdusuario).permit(:nome, :email, :CPF, :celular, :senha, :SMS, :ativo_inativo, :bdcliente_id)
    end

    def set_bdcliente
      @bdcliente = Bdcliente.where(id: params[:bdcliente_id]).first
      if @bdcliente.nil?
        @bdcliente = Bdcliente.all
      end
    end
end
