class FollowStockNewslettersController < ApplicationController
  before_action :set_follow_stock_newsletter, only: [:show, :edit, :update, :destroy]

  # GET /follow_stock_newsletters
  # GET /follow_stock_newsletters.json
  def index
    @follow_stock_newsletters = FollowStockNewsletter.all
  end

  # GET /follow_stock_newsletters/1
  # GET /follow_stock_newsletters/1.json
  def show
  end

  # GET /follow_stock_newsletters/new
  def new
    @follow_stock_newsletter = FollowStockNewsletter.new
  end

  # GET /follow_stock_newsletters/1/edit
  def edit
  end

  # POST /follow_stock_newsletters
  # POST /follow_stock_newsletters.json
  def create
    @follow_stock_newsletter = FollowStockNewsletter.new(follow_stock_newsletter_params)
    @follow_stock_newsletter.code = Digest::SHA1.hexdigest([Time.now, rand].join)

    respond_to do |format|
      if @follow_stock_newsletter.save
        format.html { redirect_to @follow_stock_newsletter, notice: t("activerecord.confirm.models.follow_stock_newsletter.created") }
        format.js { flash.now[:notice] = t("activerecord.confirm.models.follow_stock_newsletter.created") }
        format.json { render :show, status: :created, location: @follow_stock_newsletter }
      else
        format.html { render :new }
        format.js { flash.now[:alert] = t("activerecord.errors.generic") }
      end
    end
  end

  # PATCH/PUT /follow_stock_newsletters/1
  # PATCH/PUT /follow_stock_newsletters/1.json
  def update
    respond_to do |format|
      if @follow_stock_newsletter.update(follow_stock_newsletter_params)
        format.html { redirect_to @follow_stock_newsletter, notice: "Follow stock newsletter was successfully updated." }
        format.json { render :show, status: :ok, location: @follow_stock_newsletter }
      else
        format.html { render :edit }
        format.json { render json: @follow_stock_newsletter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /follow_stock_newsletters/1
  # DELETE /follow_stock_newsletters/1.json
  def destroy
    @follow_stock_newsletter.destroy
    respond_to do |format|
      format.html { redirect_to follow_stock_newsletters_url, notice: "Follow stock newsletter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_follow_stock_newsletter
    @follow_stock_newsletter = FollowStockNewsletter.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def follow_stock_newsletter_params
    params.require(:follow_stock_newsletter).permit(:stock, :isin, :email, :active, :privacy, :referrer, :sended, :total_sended, :code)
  end
end
