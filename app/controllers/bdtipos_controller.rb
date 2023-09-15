class BdtiposController < ApplicationController
  before_action :set_bdtipo, only: %i[ show edit update destroy ]

  # GET /bdtipos or /bdtipos.json
  def index
    @bdtipos = Bdtipo.all
  end

  # GET /bdtipos/1 or /bdtipos/1.json
  def show
  end

  # GET /bdtipos/new
  def new
    @bdtipo = Bdtipo.new
  end

  # GET /bdtipos/1/edit
  def edit
  end

  # POST /bdtipos or /bdtipos.json
  def create
    @bdtipo = Bdtipo.new(bdtipo_params)

    respond_to do |format|
      if @bdtipo.save
        format.html { redirect_to bdtipo_url(@bdtipo), notice: "Bdtipo was successfully created." }
        format.json { render :show, status: :created, location: @bdtipo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bdtipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bdtipos/1 or /bdtipos/1.json
  def update
    respond_to do |format|
      if @bdtipo.update(bdtipo_params)
        format.html { redirect_to bdtipo_url(@bdtipo), notice: "Bdtipo was successfully updated." }
        format.json { render :show, status: :ok, location: @bdtipo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bdtipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bdtipos/1 or /bdtipos/1.json
  def destroy
    @bdtipo.destroy

    respond_to do |format|
      format.html { redirect_to bdtipos_url, notice: "Bdtipo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bdtipo
      @bdtipo = Bdtipo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bdtipo_params
      params.require(:bdtipo).permit(:tipo_sensor)
    end
end
