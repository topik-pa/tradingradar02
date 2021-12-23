class Dax30ReportsController < ApplicationController
  before_action :set_dax30_report, only: [:show, :edit, :update, :destroy]

  # GET /dax30_reports
  # GET /dax30_reports.json
  def index
    @dax30_reports = Dax30Report.all
  end

  # GET /dax30_reports/1
  # GET /dax30_reports/1.json
  def show
  end

  # GET /dax30_reports/new
  def new
    @dax30_report = Dax30Report.new
  end

  # GET /dax30_reports/1/edit
  def edit
  end

  # POST /dax30_reports
  # POST /dax30_reports.json
  def create
    @dax30_report = Dax30Report.new(dax30_report_params)

    respond_to do |format|
      if @dax30_report.save
        format.html { redirect_to @dax30_report, notice: 'Dax30 report was successfully created.' }
        format.json { render :show, status: :created, location: @dax30_report }
      else
        format.html { render :new }
        format.json { render json: @dax30_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dax30_reports/1
  # PATCH/PUT /dax30_reports/1.json
  def update
    respond_to do |format|
      if @dax30_report.update(dax30_report_params)
        format.html { redirect_to @dax30_report, notice: 'Dax30 report was successfully updated.' }
        format.json { render :show, status: :ok, location: @dax30_report }
      else
        format.html { render :edit }
        format.json { render json: @dax30_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dax30_reports/1
  # DELETE /dax30_reports/1.json
  def destroy
    @dax30_report.destroy
    respond_to do |format|
      format.html { redirect_to dax30_reports_url, notice: 'Dax30 report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dax30_report
      @dax30_report = Dax30Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dax30_report_params
      params.require(:dax30_report).permit(:isin, :stock, :finanzen_rating, :finanzen_ratingmoodys, :finanzen_sentiment)
    end
end
