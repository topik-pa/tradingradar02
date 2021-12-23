class Cac40ReportsController < ApplicationController
  before_action :set_cac40_report, only: [:show, :edit, :update, :destroy]

  # GET /cac40_reports
  # GET /cac40_reports.json
  def index
    @cac40_reports = Cac40Report.all
  end

  # GET /cac40_reports/1
  # GET /cac40_reports/1.json
  def show
  end

  # GET /cac40_reports/new
  def new
    @cac40_report = Cac40Report.new
  end

  # GET /cac40_reports/1/edit
  def edit
  end

  # POST /cac40_reports
  # POST /cac40_reports.json
  def create
    @cac40_report = Cac40Report.new(cac40_report_params)

    respond_to do |format|
      if @cac40_report.save
        format.html { redirect_to @cac40_report, notice: 'Cac40 report was successfully created.' }
        format.json { render :show, status: :created, location: @cac40_report }
      else
        format.html { render :new }
        format.json { render json: @cac40_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cac40_reports/1
  # PATCH/PUT /cac40_reports/1.json
  def update
    respond_to do |format|
      if @cac40_report.update(cac40_report_params)
        format.html { redirect_to @cac40_report, notice: 'Cac40 report was successfully updated.' }
        format.json { render :show, status: :ok, location: @cac40_report }
      else
        format.html { render :edit }
        format.json { render json: @cac40_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cac40_reports/1
  # DELETE /cac40_reports/1.json
  def destroy
    @cac40_report.destroy
    respond_to do |format|
      format.html { redirect_to cac40_reports_url, notice: 'Cac40 report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cac40_report
      @cac40_report = Cac40Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cac40_report_params
      params.require(:cac40_report).permit(:isin, :stock, :tradingsat_trendshort, :tradingsat_trendmedium, :tradingsat_trendlong, :boursefortuneo_support, :boursefortuneo_resistance, :boursefortuneo_volatility, :boursefortuneo_target, :boursefortuneo_rating, :boursefortuneo_trendshort, :boursefortuneo_trendmedium, :zonebourse_trendshort, :zonebourse_trendmedium, :zonebourse_trendlong, :zonebourse_resistance, :zonebourse_support, :abcbourse_consensus, :abcbourse_tendency, :lefigaro_consensus)
    end
end
