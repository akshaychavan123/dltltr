class PapasController < ApplicationController
  before_action :set_papa, only: %i[ show edit update destroy ]

  # GET /papas or /papas.json
  def index
    @papas = Papa.all
  end

  # GET /papas/1 or /papas/1.json
  def show
  end

  # GET /papas/new
  def new
    @papa = Papa.new
  end

  # GET /papas/1/edit
  def edit
  end

  # POST /papas or /papas.json
  def create
    @papa = Papa.new(papa_params)

    respond_to do |format|
      if @papa.save
        format.html { redirect_to papa_url(@papa), notice: "Papa was successfully created." }
        format.json { render :show, status: :created, location: @papa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @papa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /papas/1 or /papas/1.json
  def update
    respond_to do |format|
      if @papa.update(papa_params)
        format.html { redirect_to papa_url(@papa), notice: "Papa was successfully updated." }
        format.json { render :show, status: :ok, location: @papa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @papa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /papas/1 or /papas/1.json
  def destroy
    @papa.destroy

    respond_to do |format|
      format.html { redirect_to papas_url, notice: "Papa was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_papa
      @papa = Papa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def papa_params
      params.require(:papa).permit(:name)
    end
end
