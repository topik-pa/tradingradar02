class SourceFrancesController < ApplicationController
  before_action :set_source_france, only: [:show, :edit, :update, :destroy]

  # GET /source_frances
  # GET /source_frances.json
  def index
    @source_frances = SourceFrance.all
  end

  # GET /source_frances/1
  # GET /source_frances/1.json
  def show
  end

  # GET /source_frances/new
  def new
    @source_france = SourceFrance.new
  end

  # GET /source_frances/1/edit
  def edit
  end

  # POST /source_frances
  # POST /source_frances.json
  def create
    @source_france = SourceFrance.new(source_france_params)

    respond_to do |format|
      if @source_france.save
        format.html { redirect_to @source_france, notice: "Source france was successfully created." }
        format.json { render :show, status: :created, location: @source_france }
      else
        format.html { render :new }
        format.json { render json: @source_france.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /source_frances/1
  # PATCH/PUT /source_frances/1.json
  def update
    respond_to do |format|
      if @source_france.update(source_france_params)
        format.html { redirect_to @source_france, notice: "Source france was successfully updated." }
        format.json { render :show, status: :ok, location: @source_france }
      else
        format.html { render :edit }
        format.json { render json: @source_france.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /source_frances/1
  # DELETE /source_frances/1.json
  def destroy
    @source_france.destroy
    respond_to do |format|
      format.html { redirect_to source_frances_url, notice: "Source france was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_source_france
    @source_france = SourceFrance.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def source_france_params
    params.require(:source_france).permit(:isin, :name, :url_0, :url_1, :url_2, :url_3, :url_4, :url_5, :url_6, :url_7, :url_8, :url_9, :url_10, :url_11)
  end
end
