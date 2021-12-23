class SourceItaliesController < ApplicationController
  before_action :set_source_italy, only: [:show, :edit, :update, :destroy]

  # GET /source_italies
  # GET /source_italies.json
  def index
    @source_italies = SourceItaly.all
  end

  # GET /source_italies/1
  # GET /source_italies/1.json
  def show
  end

  # GET /source_italies/new
  def new
    @source_italy = SourceItaly.new
  end

  # GET /source_italies/1/edit
  def edit
  end

  # POST /source_italies
  # POST /source_italies.json
  def create
    @source_italy = SourceItaly.new(source_italy_params)

    respond_to do |format|
      if @source_italy.save
        format.html { redirect_to @source_italy, notice: "Source italy was successfully created." }
        format.json { render :show, status: :created, location: @source_italy }
      else
        format.html { render :new }
        format.json { render json: @source_italy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /source_italies/1
  # PATCH/PUT /source_italies/1.json
  def update
    respond_to do |format|
      if @source_italy.update(source_italy_params)
        format.html { redirect_to @source_italy, notice: "Source italy was successfully updated." }
        format.json { render :show, status: :ok, location: @source_italy }
      else
        format.html { render :edit }
        format.json { render json: @source_italy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /source_italies/1
  # DELETE /source_italies/1.json
  def destroy
    @source_italy.destroy
    respond_to do |format|
      format.html { redirect_to source_italies_url, notice: "Source italy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_source_italy
    @source_italy = SourceItaly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def source_italy_params
    params.require(:source_italy).permit(:isin, :name, :url_0, :url_1, :url_2, :url_3, :url_4, :url_5, :url_6, :url_7, :url_8, :url_9, :url_10, :url_11)
  end
end
