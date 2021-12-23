class HomeController < ApplicationController
  def index

    #Last analysis
    @lastAnalysis = Analysis.last
    if @lastAnalysis
      @lastAnalysisTime = @lastAnalysis.created_at.strftime("%Y-%m-%dT%H:%M")
      @lastAnalysisTimeSimple = @lastAnalysis.created_at.strftime("%d/%m - %H:%M")
    end

    @mainBannerImage = $bannersSHP["bigger"].sample
    @secondBannerImage = $bannersSHP["second"][0]
    @thirdBannerImage = $bannersSHP["third"][0]
  end
end
