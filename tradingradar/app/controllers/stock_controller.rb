class StockController < ApplicationController
  def index
    @isin = params[:isin] ? params[:isin] : nil

    #TODO: if not ISIN???

    if @isin
      @stock = Stock.find_by isin: @isin

      if @stock
        @reuters = @stock.reuters
        marketCode = @stock.market

        case marketCode
        when "IT"
          @market = "italy"
          @urls = SourceItaly.find_by isin: @isin
          @reports = FiasReport.find_by isin: @isin

          @stockMediaData = {
            "urlCompanyProfile" => @urls.url_0,
            "urlCompanyInfos" => @urls.url_1,
            "sourceCompanyInfos" => "Borsa Italiana",
            "breadcrumbLink" => "markets.italy",
            "media" => [
              {
                "id" => "source1",
                "class" => "borsaitaliana",
                "iso" => "it",
                "name" => "Borsa Italiana",
                "logo" => "logo/media/borsaItalianaLogo.png",
                "url" => @urls.url_0,
                "rootUrl" => "https://www.borsaitaliana.it",
                "data" => [
                  {
                    "label" => t("layouts.application.support"),
                    "value" => @reports.borsaitaliana_support,
                  },
                  {
                    "label" => t("layouts.application.resistance"),
                    "value" => @reports.borsaitaliana_resistance,
                  },
                  {
                    "label" => t("layouts.application.fta"),
                    "value" => @reports.borsaitaliana_fta,
                  },
                  {
                    "label" => t("layouts.application.rsi"),
                    "value" => @reports.borsaitaliana_rsi,
                  },
                  {
                    "label" => t("layouts.application.volatility"),
                    "value" => @reports.borsaitaliana_volatility,
                  },
                ],
              },
              {
                "id" => "source2",
                "name" => "Il Sole 24 Ore",
                "class" => "ilsole24ore",
                "iso" => "it",
                "logo" => "logo/media/ilSole24OreLogo.png",
                "url" => "https://www.ilsole24ore.com",
                "rootUrl" => "https://www.ilsole24ore.com",
                "data" => [

                  {
                    "label" => t("layouts.application.rating"),
                    "value" => @reports.sole24ore_rating,
                  },
                  {
                    "label" => t("layouts.application.relativeStrenght"),
                    "value" => @reports.sole24ore_relativestrenght,
                  },
                  {
                    "label" => t("layouts.application.shortTrend"),
                    "value" => @reports.sole24ore_shorttrend,
                  },
                  {
                    "label" => t("layouts.application.mediumTrend"),
                    "value" => @reports.sole24ore_mediumtrend,
                  },

                ],
              },
              {
                "id" => "source3",
                "class" => "milanofinanza",
                "iso" => "it",
                "name" => "Milano Finanza",
                "logo" => "logo/media/milanofinanza.png",
                "url" => @urls.url_5,
                "rootUrl" => "https://www.milanofinanza.it",
                "data" => [
                  {
                    "label" => t("layouts.application.risk"),
                    "value" => @reports.milanofinanza_risk,
                  },
                  {
                    "label" => t("layouts.application.rating"),
                    "value" => @reports.milanofinanza_rating,
                  },
                  {
                    "label" => t("layouts.application.shortTrend"),
                    "value" => @reports.milanofinanza_trendshort,
                  },
                  {
                    "label" => t("layouts.application.mediumTrend"),
                    "value" => @reports.milanofinanza_trendmedium,
                  },
                  {
                    "label" => t("layouts.application.longTrend"),
                    "value" => @reports.milanofinanza_trendlong,
                  },
                ],
              },
              {
                "id" => "source4",
                "name" => "Teleborsa",
                "class" => "teleborsa",
                "iso" => "it",
                "logo" => "logo/media/teleBorsa.png",
                "url" => @urls.url_6,
                "rootUrl" => "https://www.teleborsa.it",
                "data" => [
                  {
                    "label" => t("layouts.application.support"),
                    "value" => @reports.teleborsa_support,
                  },
                  {
                    "label" => t("layouts.application.resistance"),
                    "value" => @reports.teleborsa_resistance,
                  },
                ],
              },
            ],
          }
        when "FR"
          @market = "france"
          @urls = SourceFrance.find_by isin: @isin
          @reports = Cac40Report.find_by isin: @isin

          @stockMediaData = {
            "urlCompanyProfile" => @urls.url_0,
            "urlCompanyInfos" => @urls.url_1,
            "sourceCompanyInfos" => "TradingSat",
            "breadcrumbLink" => "markets.france",
            "media" => [
              {
                "id" => "source5",
                "class" => "tradingsat",
                "iso" => "fr",
                "name" => "TradingSat",
                "logo" => "logo/media/tradingSat.png",
                "url" => @urls.url_1,
                "rootUrl" => "https://www.tradingsat.com",
                "data" => [
                  {
                    "label" => t("layouts.application.shortTrend"),
                    "value" => @reports.tradingsat_trendshort,
                  },
                  {
                    "label" => t("layouts.application.mediumTrend"),
                    "value" => @reports.tradingsat_trendmedium,
                  },
                  {
                    "label" => t("layouts.application.longTrend"),
                    "value" => @reports.tradingsat_trendlong,
                  },
                ],
              },

              {
                "id" => "source6",
                "class" => "boursefortuneo",
                "iso" => "fr",
                "name" => "Bourse Fortuneo",
                "logo" => "logo/media/bourseFortuneo.png",
                "url" => "https://bourse.fortuneo.fr",
                "rootUrl" => "https://bourse.fortuneo.fr",
                "data" => [
                  {
                    "label" => t("layouts.application.support"),
                    "value" => @reports.boursefortuneo_support,
                  },
                  {
                    "label" => t("layouts.application.resistance"),
                    "value" => @reports.boursefortuneo_resistance,
                  },
                  {
                    "label" => t("layouts.application.target"),
                    "value" => @reports.boursefortuneo_target,
                  },
                  {
                    "label" => t("layouts.application.rating"),
                    "value" => @reports.boursefortuneo_rating,
                  },
                  {
                    "label" => t("layouts.application.shortTrend"),
                    "value" => @reports.boursefortuneo_trendshort,
                  },
                  {
                    "label" => t("layouts.application.mediumTrend"),
                    "value" => @reports.boursefortuneo_trendmedium,
                  },
                ],
              },

              {
                "id" => "source7",
                "class" => "lefigaro",
                "iso" => "fr",
                "name" => "Le Figaro",
                "logo" => "logo/media/leFigaro.png",
                "url" => @urls.url_4,
                "rootUrl" => "http://bourse.lefigaro.fr",
                "data" => [
                  {
                    "label" => t("layouts.application.consensus"),
                    "value" => @reports.lefigaro_consensus,
                  },
                ],
              },

            ],
          }
        else
          #nothing
        end
      end
    end
  end
end
