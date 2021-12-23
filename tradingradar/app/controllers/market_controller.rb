class MarketController < ApplicationController
  def italy
    @tradingMarket = nil
    marketCode = "IT" #TODO: bug --> the italian market value is "IT" and not "italy"
    $tradingMarkets.each do |market|
      if market["country"] == "italy"
        @tradingMarket = market
      end
    end

    @mainBannerImage = @tradingMarket["bannersHP"]["bigger"].sample
    @secondBannerImage = @tradingMarket["bannersHP"]["second"].first
    @thirdBannerImage = @tradingMarket["bannersHP"]["third"].first

    allAnalyses = Analysis.where(market: @tradingMarket["country"])
    @lastAnalysis = allAnalyses.last
    if @lastAnalysis
      @lastAnalysisTime = @lastAnalysis.created_at.strftime("%Y-%m-%dT%H:%M")
      @lastAnalysisTimeSimple = @lastAnalysis.created_at.strftime("%d/%m - %H:%M")
    end

    #bestIT = ActiveRecord::Base.connection.exec_query("SELECT * FROM Stocks JOIN Fias_Reports ON Stocks.isin=Fias_Reports.isin ORDER BY RANDOM() LIMIT 3")
    #$stocksOfTheDay = {
    #  "italy" => bestIT,
    #}

    #@description = t("markets.italy")

    allStocks = Stock.where(market: marketCode)

    @stockListByLetter = nil
    if params[:ajax] && params[:query]
      @stockListByLetter = allStocks.select("name, isin, sector, variation, performance1, performance6, performance12").where("name ILIKE :prefix", prefix: "#{params[:query]}%").order(:name)
      #render json: @stockListByLetter

      if !@stockListByLetter.empty?
        render inline: ('
          <table class="table table-hover table-sm">
            <thead>
              <tr>
                <th scope="col"><%= t("layouts.application.name") %></th>
                <th scope="col"><%= t("layouts.application.variation") %></th>
                <th scope="col"><%= t("layouts.application.perf1") %></th>
                <th scope="col"><%= t("layouts.application.perf6") %></th>
                <th scope="col"><%= t("layouts.application.perf12") %></th>
              </tr>
            </thead>
            <tbody>
              <% @stockListByLetter.each do |stock| %>
                <tr class="<%= cycle("odd", "even") %>">
                  <td title="<%= stock.name %>"><%= link_to stock.name, {:controller => "stock", :action => "index", :id => stock.name.parameterize, :isin => stock.isin} %>  </td>
                  <td title="<%= stock.variation %>"><%= stock.variation %></td>
                  <td class="<%= addZSignClass(stock.performance1) %>" title="<%= stock.performance1 %>"><%= stock.performance1 %></td>
                  <td class="<%= addZSignClass(stock.performance6) %>" title="<%= stock.performance6 %>"><%= stock.performance6 %></td>
                  <td class="<%= addZSignClass(stock.performance12) %>" title="<%= stock.performance12 %>"><%= stock.performance12 %></td>
                </tr>
              <% end %>
            </tbody>
          </table>
        ')
      else
        render inline: ('
          <table class="table table-hover table-sm js-table">
            <thead><tr><th><%= t("layouts.application.noDataYet") %></th></tr></thead>
          </table> 
        ')
      end
    elsif params[:query]
      @stockListByLetter = allStocks.select("name, isin, sector, variation, performance1, performance6, performance12").where("name ILIKE :prefix", prefix: "#{params[:query]}%").order(:name)
      #render json: @stockListByLetter
    else
      @stockListByLetter = allStocks.select("name, isin, sector, variation, performance1, performance6, performance12").where("name ILIKE :prefix", prefix: "#{"A"}%").order(:name)
      #render json: @stockListFiltered
      #render html: ('<div id="source-container">' +
      #            '<div class="frag">' + @frag1 + "</div>" +
      #            "</div>").html_safe

    end

    allStocksLight = Stock.select("name, isin").where("market = ?", @tradingMarket["country"]).order(name: :asc)
    $marketsForSelect = {
      @tradingMarket["country"] => allStocksLight.map { |p| [p.name, p.isin] },
    }
  end

  def france
    @tradingMarket = nil
    marketCode = "FR"
    $tradingMarkets.each do |market|
      if market["country"] == "france"
        @tradingMarket = market
      end
    end

    @mainBannerImage = @tradingMarket["bannersHP"]["bigger"].sample
    @secondBannerImage = @tradingMarket["bannersHP"]["second"].first
    @thirdBannerImage = @tradingMarket["bannersHP"]["third"].first

    allAnalyses = Analysis.where(market: @tradingMarket["country"])
    @lastAnalysis = allAnalyses.last
    if @lastAnalysis
      @lastAnalysisTime = @lastAnalysis.created_at.strftime("%Y-%m-%dT%H:%M")
      @lastAnalysisTimeSimple = @lastAnalysis.created_at.strftime("%d/%m - %H:%M")
    end

    allStocks = Stock.where(market: marketCode)

    @stockListByLetter = nil
    if params[:ajax] && params[:query]
      @stockListByLetter = allStocks.select("name, isin, sector, variation, performance1, performance6, performance12").where("name ILIKE :prefix", prefix: "#{params[:query]}%").order(:name)
      if !@stockListByLetter.empty?
        render inline: ('
          <table class="table table-hover table-sm">
            <thead>
              <tr>
                <th scope="col"><%= t("layouts.application.name") %></th>
                <th scope="col"><%= t("layouts.application.variation") %></th>
                <th scope="col"><%= t("layouts.application.perf1") %></th>
                <th scope="col"><%= t("layouts.application.perf6") %></th>
                <th scope="col"><%= t("layouts.application.perf12") %></th>
              </tr>
            </thead>
            <tbody>
              <% @stockListByLetter.each do |stock| %>
                <tr class="<%= cycle("odd", "even") %>">
                  <td title="<%= stock.name %>"><%= link_to stock.name, {:controller => "stock", :action => "index", :id => stock.name.parameterize, :isin => stock.isin} %>  </td>
                  <td title="<%= stock.variation %>"><%= stock.variation %></td>
                  <td title="<%= stock.performance1 %>"><%= stock.performance1 %></td>
                  <td title="<%= stock.performance6 %>"><%= stock.performance6 %></td>
                  <td title="<%= stock.performance12 %>"><%= stock.performance12 %></td>
                </tr>
              <% end %>
            </tbody>
          </table>
        ')
      else
        render inline: ('
          <table class="table table-hover table-sm js-table">
            <thead><tr><th><%= t("layouts.application.noDataYet") %></th></tr></thead>
          </table> 
        ')
      end
    elsif params[:query]
      @stockListByLetter = allStocks.select("name, isin, sector, variation, performance1, performance6, performance12").where("name ILIKE :prefix", prefix: "#{params[:query]}%").order(:name)
    else
      @stockListByLetter = allStocks.select("name, isin, sector, variation, performance1, performance6, performance12").where("name ILIKE :prefix", prefix: "#{"A"}%").order(:name)
    end

    allStocksLight = Stock.select("name, isin").where("market = ?", @tradingMarket["country"]).order(name: :asc)
    $marketsForSelect = {
      @tradingMarket["country"] => allStocksLight.map { |p| [p.name, p.isin] },
    }
  end
end
