class FiasReportsController < ApplicationController
  before_action :set_fias_report, only: [:show, :edit, :update, :destroy]

  # GET /fias_reports
  # GET /fias_reports.json
  def index
    @fias_reports = FiasReport.all
  end

  # GET /fias_reports/1
  # GET /fias_reports/1.json
  def show
  end

  # GET /fias_reports/new
  def new
    @fias_report = FiasReport.new
  end

  # GET /fias_reports/1/edit
  def edit
  end

  # POST /fias_reports
  # POST /fias_reports.json
  def create
    @fias_report = FiasReport.new(fias_report_params)

    respond_to do |format|
      if @fias_report.save
        format.html { redirect_to @fias_report, notice: "Fias report was successfully created." }
        format.json { render :show, status: :created, location: @fias_report }
      else
        format.html { render :new }
        format.json { render json: @fias_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fias_reports/1
  # PATCH/PUT /fias_reports/1.json
  def update
    respond_to do |format|
      if @fias_report.update(fias_report_params)
        format.html { redirect_to @fias_report, notice: "Fias report was successfully updated." }
        format.json { render :show, status: :ok, location: @fias_report }
      else
        format.html { render :edit }
        format.json { render json: @fias_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fias_reports/1
  # DELETE /fias_reports/1.json
  def destroy
    @fias_report.destroy
    respond_to do |format|
      format.html { redirect_to fias_reports_url, notice: "Fias report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_fias_report
    @fias_report = FiasReport.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def fias_report_params
    params.require(:fias_report).permit(:isin, :stock, :borsaitaliana_support, :borsaitaliana_resistance, :borsaitaliana_fta, :borsaitaliana_rsi, :borsaitaliana_volatility, :sole24ore_shorttrend, :sole24ore_mediumtrend, :sole24ore_rating, :sole24ore_relativestrenght, :milanofinanza_risk, :milanofinanza_rating, :milanofinanza_trendshort, :milanofinanza_trendmedium, :milanofinanza_trendlong, :teleborsa_support, :teleborsa_resistance)
  end
end
