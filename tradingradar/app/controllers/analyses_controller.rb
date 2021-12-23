class AnalysesController < ApplicationController
  before_action :find_post
  before_action :set_analysis, only: [:show, :edit, :update, :destroy]

  # GET /analyses
  # GET /analyses.json
  def index
    if params[:author]
      @analyses = Analysis.find_by author: params[:author]
      @moreRecentAnalyses = @analyses.last(6).reverse
    else
      @analyses = $allAnalyses
      @moreRecentAnalyses = $last6BlogAnalysesPosts
    end
  end

  # GET /analyses/1
  # GET /analyses/1.json
  def show
    currentPostId = @analysis.id
    @nextPost = Analysis.where("id > ?", currentPostId).first
    @prevPost = Analysis.where("id < ?", currentPostId).last
  end

  # GET /analyses/new
  def new
    @analysis = Analysis.new
  end

  # GET /analyses/1/edit
  def edit
  end

  # POST /analyses
  # POST /analyses.json
  def create
    @analysis = Analysis.new(analysis_params)

    respond_to do |format|
      if @analysis.save
        format.html { redirect_to @analysis, notice: "Analysis was successfully created." }
        format.json { render :show, status: :created, location: @analysis }
      else
        format.html { render :new }
        format.json { render json: @analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /analyses/1
  # PATCH/PUT /analyses/1.json
  def update
    respond_to do |format|
      if @analysis.update(analysis_params)
        format.html { redirect_to @analysis, notice: "Analysis was successfully updated." }
        format.json { render :show, status: :ok, location: @analysis }
      else
        format.html { render :edit }
        format.json { render json: @analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analyses/1
  # DELETE /analyses/1.json
  def destroy
    @analysis.destroy
    respond_to do |format|
      format.html { redirect_to analyses_url, notice: "Analysis was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_analysis
    @analysis = Analysis.friendly.find(params[:id])
  end

  def find_post
    #@analysis = Post.find(params[:id])
    @analysis = Analysis.find_by slug: params[:id]
    #byebug
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def analysis_params
    params.require(:analysis).permit(:title, :description, :body, :stock, :reuters, :isin, :author, :slug, :market)
  end
end
