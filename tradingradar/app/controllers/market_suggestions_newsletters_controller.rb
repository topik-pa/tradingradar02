class MarketSuggestionsNewslettersController < ApplicationController
  before_action :set_market_suggestions_newsletter, only: [:show, :edit, :update, :destroy]

  # GET /market_suggestions_newsletters
  # GET /market_suggestions_newsletters.json
  def index
    @market_suggestions_newsletters = MarketSuggestionsNewsletter.all
  end

  # GET /market_suggestions_newsletters/1
  # GET /market_suggestions_newsletters/1.json
  def show
  end

  # GET /market_suggestions_newsletters/new
  def new
    @market_suggestions_newsletter = MarketSuggestionsNewsletter.new
  end

  # GET /market_suggestions_newsletters/1/edit
  def edit
  end

  # POST /market_suggestions_newsletters
  # POST /market_suggestions_newsletters.json
  def create
    @market_suggestions_newsletter = MarketSuggestionsNewsletter.new(market_suggestions_newsletter_params)
    @market_suggestions_newsletter.code = Digest::SHA1.hexdigest([Time.now, rand].join)

    respond_to do |format|
      if @market_suggestions_newsletter.save
        format.html { redirect_to @market_suggestions_newsletter, notice: t("activerecord.confirm.models.market_suggestion_newsletter.created") }
        format.json { render :show, status: :created, location: @market_suggestions_newsletter }
        format.js { flash.now[:notice] = t("activerecord.confirm.models.market_suggestion_newsletter.created") }
      else
        format.html { render :new }
        #format.json { render json: @market_suggestions_newsletter.errors, status: :unprocessable_entity }
        format.js { flash.now[:alert] = t("activerecord.errors.generic") }
      end
    end
  end

  # PATCH/PUT /market_suggestions_newsletters/1
  # PATCH/PUT /market_suggestions_newsletters/1.json
  def update
    respond_to do |format|
      if @market_suggestions_newsletter.update(market_suggestions_newsletter_params)
        format.html { redirect_to @market_suggestions_newsletter, notice: "Market suggestions newsletter was successfully updated." }
        format.json { render :show, status: :ok, location: @market_suggestions_newsletter }
      else
        format.html { render :edit }
        format.json { render json: @market_suggestions_newsletter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /market_suggestions_newsletters/1
  # DELETE /market_suggestions_newsletters/1.json
  def destroy
    @market_suggestions_newsletter.destroy
    respond_to do |format|
      format.html { redirect_to market_suggestions_newsletters_url, notice: "Market suggestions newsletter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_market_suggestions_newsletter
    @market_suggestions_newsletter = MarketSuggestionsNewsletter.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def market_suggestions_newsletter_params
    params.require(:market_suggestions_newsletter).permit(:email, :active, :privacy, :referrer, :sended, :total_sended, :code)
  end
end
