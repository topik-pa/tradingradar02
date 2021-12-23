class ApplicationController < ActionController::Base
  before_action :add_www_subdomain
  before_action :set_i18n_locale_from_params
  helper_method :addZSignClass
  helper_method :current_user

  require "rufus-scheduler"
  require "open-uri"
  #require "rubygems"
  require "nokogiri"
  require "uri"
  require "net/http"

  #Errors classes
  class ElemNotFound < StandardError
  end

  class UnexpectedElemValue < StandardError
  end

  class NotAValidUrl < StandardError
  end

  #The scheduler
  scheduler = Rufus::Scheduler.new

  #User management
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to "/login" unless current_user
  end

  #Variables
  $appName = "tradingradar.net"
  $appVersion = "2.0 alpha"

  puts "Starting application: " + $appName + ". Version: " + $appVersion

  $lastServerUpdate = Time.zone.at(0)
  @maxRetryToGetData = 2
  sleepTime = 3

  $imagePath = "https://s3.eu-west-3.amazonaws.com/tradingradar/"

  #Banners Super Home Page
  $bannersSHP = {
    "bigger" => [
      {
        filename: "adeolu-eletu-38649-unsplash.jpg",
        description: 'Photo by Adeolu Eletu on <a href="https://unsplash.com">Unsplash</a>',
        caption: I18n.t("application.appDescription"),
      },
      {
        filename: "alex-knight-181471-unsplash.jpg",
        description: 'Photo by Alex Knight on <a href="https://unsplash.com">Unsplash</a>',
        caption: I18n.t("application.mission"),
      },
      {
        filename: "anders-jilden-3871-unsplash.jpg",
        description: 'Photo by Anders Jildén on <a href="https://unsplash.com">Unsplash</a>',
        caption: I18n.t("application.mission2"),
      },
      {
        filename: "charles-forerunner-378-unsplash.jpg",
        description: 'Photo by Charles Forerunner on <a href="https://unsplash.com">Unsplash</a>',
        caption: I18n.t("application.mission3"),
      },
      {
        filename: "christine-roy-343235-unsplash.jpg",
        description: 'Photo by Christine Roy on <a href="https://unsplash.com">Unsplash</a>',
        caption: I18n.t("application.mission"),
      },
      {
        filename: "colin-watts-1169445-unsplash.jpg",
        description: 'Photo by Colin Watts on <a href="https://unsplash.com">Unsplash</a>',
        caption: I18n.t("application.mission2"),
      },
      {
        filename: "ilya-gavin-135884-unsplash.jpg",
        description: 'Photo by Ilya Gavin on <a href="https://unsplash.com">Unsplash</a>',
        caption: I18n.t("application.appDescription"),
      },
      {
        filename: "jordan-311290-unsplash.jpg",
        description: 'Photo by Jordan on <a href="https://unsplash.com">Unsplash</a>',
        caption: I18n.t("application.mission3"),
      },
      {
        filename: "rick-tap-110126-unsplash.jpg",
        description: 'Photo by Rick Tap on <a href="https://unsplash.com">Unsplash</a>',
        caption: I18n.t("application.appDescription"),
      },
      {
        filename: "roberto-junior-270326-unsplash.jpg",
        description: 'Photo by Roberto Júnior on <a href="https://unsplash.com">Unsplash</a>',
        caption: I18n.t("application.mission2"),
      },
    ],
    "second" => [
      {
        filename: "analysisImage.jpg",
        description: "Banner analysis",
      },
    ],
    "third" => [
      {
        filename: "banner-small-2.jpg",
        description: "Banner title of the day",
      },
    ],
  }

  #TODO: cod is removable?
  $tradingPools = [
    {
      "name" => "Pool FTSE MIB",
      "country" => "italy",
      "cod" => "",
      "sourceTable" => "Market",
      "destinationTable" => "Market",
      "sourcePageJSONData" => "./marketsPagesJson/poolSourcesItaly",
    },
    {
      "name" => "Pool CAC 40",
      "country" => "france",
      "cod" => "",
      "sourceTable" => "Market",
      "destinationTable" => "Market",
      "sourcePageJSONData" => "./marketsPagesJson/poolSourcesFrance",
    },
  ]

  $allAnalyses = Analysis.all.order(:created_at).reverse
  $last6BlogAnalysesPosts = $allAnalyses.last(6).reverse
  $allTradingMarkets = Market.order(:id)

  #TODO: make it better
  ligthStocksIT = Stock.select("name, isin").where("market = ?", "IT").order(name: :asc)
  ligthStocksFR = Stock.select("name, isin").where("market = ?", "FR").order(name: :asc)

  $marketsForSelect = {
    "italy" => ligthStocksIT.map { |p| [p.name, p.isin] },
    "france" => ligthStocksFR.map { |p| [p.name, p.isin] },
  }
  #TODO: make it better

  def self.getTradingMarkets()
    return [
             {
               "name" => "FTSE MIB",
               "country" => "italy",
               "cod" => "MI",
               "sourceTable" => "SourceItaly",
               "destinationTable" => "Stock",
               "destinationTable2" => "FiasReport",
               "sourcePageJSONData" => "./marketsPagesJson/italySources",
               "bestOfTheDay" => {
                 "stock" => ActiveRecord::Base.connection.exec_query("SELECT * FROM Stocks JOIN Fias_Reports ON Stocks.isin=Fias_Reports.isin ORDER BY RANDOM() LIMIT 1"),
                 "parameters" => [
                   {
                     "label" => "Borsa Italiana FTA",
                     "parameter" => "borsaitaliana_fta",
                     "against" => "4",
                   },
                   {
                     "label" => "Il Sole 24 Ore Rating",
                     "parameter" => "sole24ore_rating",
                     "against" => "5",
                   },
                   {
                     "label" => "Milano Finanza Rating",
                     "parameter" => "milanofinanza_rating",
                   },
                 ],
               },
               "best4" => [
                 {
                   "name" => "Borsa Italiana",
                   "label" => I18n.t("media.borsaItaliana"),
                   "4stocks" => ActiveRecord::Base.connection.exec_query(ActiveRecord::Base.send(:sanitize_sql_array, ["SELECT name, stocks.isin, last_price, reuters, sector, borsaitaliana_support, borsaitaliana_resistance, borsaitaliana_fta, borsaitaliana_rsi, borsaitaliana_volatility  FROM Stocks JOIN Fias_Reports ON Stocks.isin=Fias_Reports.isin ORDER BY borsaitaliana_fta DESC LIMIT 10"])),
                   "values" => [
                     {
                       "key" => I18n.t("layouts.application.name"),
                     },
                     {
                       "key" => I18n.t("layouts.application.fta"),
                       "value" => "borsaitaliana_fta",
                     },
                     {
                       "key" => I18n.t("layouts.application.lastPrice"),
                       "value" => "last_price",
                     },
                     {
                       "key" => I18n.t("layouts.application.support"),
                       "value" => "borsaitaliana_support",
                     },
                     {
                       "key" => I18n.t("layouts.application.resistance"),
                       "value" => "borsaitaliana_resistance",
                     },
                   ],
                   "parameters" => [
                     {
                       "label" => I18n.t("layouts.application.resistance"),
                       "value" => "borsaitaliana_resistance",
                       "dataname" => "resistance",
                       "againstValue" => "last_price",
                       "againstDataname" => "price",

                     },
                     {
                       "label" => I18n.t("layouts.application.fta"),
                       "value" => "borsaitaliana_fta",
                       "dataname" => "rating",
                       "againstValue" => "4",
                       "againstDataname" => "max",
                     },
                   ],

                 },
                 {
                   "name" => "Il Sole 24 Ore",
                   "label" => I18n.t("media.ilSole24ore"),
                   "4stocks" => ActiveRecord::Base.connection.exec_query(ActiveRecord::Base.send(:sanitize_sql_array, ["SELECT name, stocks.isin, last_price, reuters, sector, sole24ore_shorttrend, sole24ore_mediumtrend, sole24ore_rating, sole24ore_relativestrenght  FROM Stocks JOIN Fias_Reports ON Stocks.isin=Fias_Reports.isin ORDER BY sole24ore_rating DESC LIMIT 10"])),
                   "values" => [
                     {
                       "key" => I18n.t("layouts.application.name"),
                     },
                     {
                       "key" => I18n.t("layouts.application.rating"),
                       "value" => "sole24ore_rating",
                     },
                     {
                       "key" => I18n.t("layouts.application.shortTrend"),
                       "value" => "sole24ore_shorttrend",
                     },
                     {
                       "key" => I18n.t("layouts.application.mediumTrend"),
                       "value" => "sole24ore_mediumtrend",
                     },
                   ],
                   "parameters" => [
                     {
                       "label" => I18n.t("layouts.application.rsi"),
                       "value" => "sole24ore_relativestrenght",
                     },
                     {
                       "label" => I18n.t("layouts.application.rating"),
                       "value" => "sole24ore_rating",
                       "dataname" => "rating",
                       "againstValue" => "5",
                       "againstDataname" => "max",
                     },
                   ],
                 },
                 {
                   "name" => "Milano Finanza",
                   "label" => I18n.t("media.milanoFinanza"),
                   "4stocks" => ActiveRecord::Base.connection.exec_query(ActiveRecord::Base.send(:sanitize_sql_array, ["SELECT name, stocks.isin, last_price, reuters, sector, milanofinanza_risk, milanofinanza_rating, milanofinanza_trendshort, milanofinanza_trendmedium, milanofinanza_trendlong  FROM Stocks JOIN Fias_Reports ON Stocks.isin=Fias_Reports.isin ORDER BY milanofinanza_rating ASC LIMIT 10"])),
                   "values" => [
                     {
                       "key" => I18n.t("layouts.application.name"),
                     },
                     {
                       "key" => I18n.t("layouts.application.rating"),
                       "value" => "milanofinanza_rating",
                     },
                     {
                       "key" => I18n.t("layouts.application.shortTrend"),
                       "value" => "milanofinanza_trendshort",
                     },
                     {
                       "key" => I18n.t("layouts.application.mediumTrend"),
                       "value" => "milanofinanza_trendmedium",
                     },
                     {
                       "key" => I18n.t("layouts.application.longTrend"),
                       "value" => "milanofinanza_trendlong",
                     },
                   ],
                   "parameters" => [
                     {
                       "label" => I18n.t("layouts.application.risk"),
                       "value" => "milanofinanza_risk",
                     },
                     {
                       "label" => I18n.t("layouts.application.rating"),
                       "value" => "milanofinanza_rating",
                       "dataname" => "rating",
                       "againstValue" => "5",
                       "againstDataname" => "max",
                     },
                   ],
                 },
               ],
               "tradingViewData" => {
                 "id" => "tradingview_98563",
                 "url" => "https://it.tradingview.com/symbols/MIL-FTSEMIB/",
                 "name" => "FTSEMIB Graph",
                 "symbol" => "INDEX:FTSEMIB",
               },
               "bannersHP" => {
                 "bigger" => [
                   {
                     filename: "borsa-italiana-day-min.jpg",
                     description: I18n.t("banners.hpBanner1-it"),
                     caption: I18n.t("markets.italy"),
                   },
                   {
                     filename: "borsa-italiana-night-min.jpg",
                     description: I18n.t("banners.hpBanner2-it"),
                     caption: I18n.t("markets.italy"),
                   },
                 ],
                 "second" => [
                   {
                     filename: "analysisImage.jpg",
                     description: "Analyses ITA",
                   },
                 ],
                 "third" => [
                   {
                     filename: "banner-small-2.jpg",
                     description: "Best of the day ITA",
                   },
                 ],
               },
             },

             {
               "name" => "CAC 40",
               "country" => "france",
               "cod" => "PA",
               "sourceTable" => "SourceFrance",
               "destinationTable" => "Stock",
               "destinationTable2" => "Cac40Report",
               "sourcePageJSONData" => "./marketsPagesJson/franceSources",
               "bestOfTheDay" => {
                 "stock" => ActiveRecord::Base.connection.exec_query("SELECT * FROM Stocks JOIN Cac40_Reports ON Stocks.isin=Cac40_Reports.isin ORDER BY RANDOM() LIMIT 1"),
                 "parameters" => [
                   {
                     "label" => "Le Figaro consensus",
                     "parameter" => "lefigaro_consensus",
                   },
                   {
                     "label" => "Bourse Fortuneo rating",
                     "parameter" => "boursefortuneo_rating",
                   },
                   {
                     "label" => "ABC Bourse consensus",
                     "parameter" => "abcbourse_consensus",
                   },
                 ],
               },
               "best4" => [
                 {
                   "name" => "Bourse Fortuneo",
                   "label" => I18n.t("media.borseFortuneo"),
                   "4stocks" => ActiveRecord::Base.connection.exec_query("SELECT * FROM Stocks JOIN Cac40_Reports ON Stocks.isin=Cac40_Reports.isin ORDER BY RANDOM() LIMIT 10"),
                   "values" => [
                     {
                       "key" => I18n.t("layouts.application.name"),
                     },
                     {
                       "key" => I18n.t("layouts.application.lastPrice"),
                       "value" => "last_price",
                     },
                     {
                       "key" => I18n.t("layouts.application.support"),
                       "value" => "boursefortuneo_support",
                     },
                     {
                       "key" => I18n.t("layouts.application.resistance"),
                       "value" => "boursefortuneo_resistance",
                     },
                     {
                       "key" => I18n.t("layouts.application.target"),
                       "value" => "boursefortuneo_target",
                     },
                     {
                       "key" => I18n.t("layouts.application.rating"),
                       "value" => "boursefortuneo_rating",
                     },
                   ],
                   "parameters" => [
                     {
                       "label" => I18n.t("layouts.application.rating"),
                       "value" => "boursefortuneo_rating",
                     },
                   ],
                 },
                 {
                   "name" => "Le Figaro",
                   "label" => I18n.t("media.leFigaro"),
                   "4stocks" => ActiveRecord::Base.connection.exec_query("SELECT * FROM Stocks JOIN Cac40_Reports ON Stocks.isin=Cac40_Reports.isin ORDER BY RANDOM() LIMIT 10"),
                   "values" => [
                     {
                       "key" => I18n.t("layouts.application.name"),
                     },
                     {
                       "key" => I18n.t("layouts.application.consensus"),
                       "value" => "lefigaro_consensus",
                     },
                   ],
                   "parameters" => [
                     {
                       "label" => I18n.t("layouts.application.consensus"),
                       "value" => "lefigaro_consensus",
                     },
                   ],
                 },
                 {
                   "name" => "Trading Sat",
                   "label" => I18n.t("media.tradingSat"),
                   "4stocks" => ActiveRecord::Base.connection.exec_query("SELECT * FROM Stocks JOIN Cac40_Reports ON Stocks.isin=Cac40_Reports.isin ORDER BY RANDOM() LIMIT 10"),
                   "values" => [
                     {
                       "key" => I18n.t("layouts.application.name"),
                     },
                     {
                       "key" => I18n.t("layouts.application.shortTrend"),
                       "value" => "tradingsat_trendshort",
                     },
                     {
                       "key" => I18n.t("layouts.application.mediumTrend"),
                       "value" => "tradingsat_trendmedium",
                     },
                     {
                       "key" => I18n.t("layouts.application.longTrend"),
                       "value" => "tradingsat_trendlong",
                     },
                   ],
                   "parameters" => [
                     {
                       "label" => I18n.t("layouts.application.shortTrend"),
                       "value" => "tradingsat_trendshort",
                     },
                   ],
                 },
               ],
               "tradingViewData" => {
                 "id" => "tradingview_2929a",
                 "url" => "https://it.tradingview.com/symbols/INDEX-CAC/",
                 "name" => "CAC 40 Graph",
                 "symbol" => "INDEX:CAC",
               },
               "bannersHP" => {
                 "bigger" => [
                   {
                     filename: "paris-bourse-day-min.jpg",
                     description: I18n.t("banners.hpBanner1-fr"),
                     caption: I18n.t("markets.france"),
                   },
                   {
                     filename: "paris-bourse-might-min.jpg",
                     description: I18n.t("banners.hpBanner2-fr"),
                     caption: I18n.t("markets.france"),
                   },
                 ],
                 "second" => [
                   {
                     filename: "analysisImage.jpg",
                     description: "Analyses FRA",
                   },
                 ],
                 "third" => [
                   {
                     filename: "banner-small-3.jpg",
                     description: "Besto of the day FRA",
                   },
                 ],
               },
             },
           ]
  end

  #Get the trading markets
  $tradingMarkets = getTradingMarkets()

  #Update markets tables
  def self.updateMarketData(market)

    #The DB table where the market source urls are stored
    sourcesTable = market["sourceTable"].classify.constantize.order(:name)

    #For every source row
    sourcesTable.find_each do |sourceRow|
      retries = @maxRetryToGetData
      begin
        #Check the match between the current market country and the country on the current row (Markets update case)
        if sourceRow["country"] && sourceRow["country"] != market["country"]
          next
        else
          updateMarketFromSourceRow(sourceRow, market)
        end
      rescue ElemNotFound => e
        error = "Error element not found: " + e.message
        puts error
        ServerErrorOccurredMailer.generic(error).deliver_now
      rescue UnexpectedElemValue => e #TODO: mantain this error catch?
        error = "Error unexpected element value:" + e.message
        puts
      rescue NotAValidUrl => e
        error = "Error not valid url value:" + e.message
        puts error
        ServerErrorOccurredMailer.generic(error).deliver_now
      rescue URI::InvalidURIError => e
        error = "Error not valid uri value:" + e.message
        puts error
        ServerErrorOccurredMailer.generic(error).deliver_now
      rescue RuntimeError => e
        error = "RuntimeError:" + e.message
        puts error
        ServerErrorOccurredMailer.generic(error).deliver_now
      rescue JSON::ParserError => e
        error = "JSON Parse Error" + e.message
        puts error
        ServerErrorOccurredMailer.generic(error).deliver_now
      rescue OpenURI::HTTPError => e
        error = "HTTP error:" + e.message
        puts error
        if retries > 0
          puts "\tTrying #{retries} more times"
          retries -= 1
          sleep sleepTime
          retry
        else
          puts "\t\tCan't get any data from this URL, so moving on..."
          ServerErrorOccurredMailer.generic(error).deliver_now
        end
      end
      puts sourceRow.name + " updated"
    end
    puts "All " + market["name"] + " rows updated"
  end
  #Update markets tables

  #Update a row in the DB with the data passed
  def self.updateMarketFromSourceRow(sourceRow, market)
    #Include more data origins (the remote ones)
    require_relative market["sourcePageJSONData"]
    externalPages = getExternalPagesFromSourcesRow(sourceRow)

    #Get the table/s to update
    destinationTable1 = market["destinationTable"].classify.constantize
    destinationTable2 = market["destinationTable2"] ? market["destinationTable2"].classify.constantize : nil

    #The row to update is the same as the origin
    if market["sourceTable"] == market["destinationTable"]
      rowToUpdate = sourceRow
    else #The row/s to update is/are external
      isin = sourceRow.isin
      stockName = sourceRow.name
      rowToUpdate = destinationTable1.where(isin: isin).first #first... to get a stock and not a collection
      rowToUpdate2 = destinationTable2.where(isin: isin).first #first... to get a stock and not a collection
      #There is not such row... I create it
      if !rowToUpdate
        rowToUpdate = destinationTable1.new(:isin => isin)
      end
      if !rowToUpdate2
        rowToUpdate2 = destinationTable2.new(:isin => isin)
      end
    end

    #For each source pages (and related infos)
    externalPages.each do |page|
      if page[:url] == nil
        #Static data inside json
        puts "Updating " + stockName + " from " + "static data" + " (index: " + page[:id].to_s + ")."

        iHaveChangedMoreThanOneRow = false
        page[:values].each do |frag|
          if (frag[:table] == 0 || frag[:table] == nil)
            destinationRow = rowToUpdate
          else
            destinationRow = rowToUpdate2
            iHaveChangedMoreThanOneRow = true
          end
          update(destinationRow, frag, nil, stockName)
        end

        if (iHaveChangedMoreThanOneRow)
          rowToUpdate2.save!
          rowToUpdate2.reload
          rowToUpdate.save!
          rowToUpdate.reload
        else
          rowToUpdate.save!
          rowToUpdate.reload
        end
      elsif page[:url] =~ URI::regexp
        puts "Updating " + sourceRow.name + " from " + page[:url] + " (index: " + page[:id].to_s + ")."

        # Retrive remote data
        uri = URI.parse(page[:url])
        http = Net::HTTP.new(uri.host, uri.port)
        if page[:url].include? "https://"
          http.use_ssl = true
        end
        resp = http.get(uri.request_uri)

        #JSON response
        if (page[:response] == "json")
          json = JSON.parse(resp.body)
          iHaveChangedMoreThanOneRow = false
          page[:values].each do |frag|
            if frag[:xpath].kind_of?(Array)
              jsonValue = nil
              clonedJson = json
              frag[:xpath].each { |x|
                jsonValue = clonedJson[x]
                clonedJson = clonedJson[x]
              }
            else
              jsonValue = json[frag[:xpath]]
            end
            jsonValue = jsonValue.to_s
            if (frag[:table] == 0 || frag[:table] == nil)
              destinationRow = rowToUpdate
            else
              destinationRow = rowToUpdate2
              iHaveChangedMoreThanOneRow = true
            end
            update(destinationRow, frag, jsonValue, sourceRow.name)
            if (iHaveChangedMoreThanOneRow)
              rowToUpdate2.save!
              rowToUpdate2.reload
              rowToUpdate.save!
              rowToUpdate.reload
            else
              rowToUpdate.save!
              rowToUpdate.reload
            end
          end
          #XML response
        else
          xml = Nokogiri::HTML(resp.body)
          iHaveChangedMoreThanOneRow = false
          page[:values].each do |frag|
            xmlValue = xml.at_xpath(frag[:xpath]).to_s #.strip #TODO: check .to_s.strip
            value = Nokogiri::HTML(xmlValue).text
            if (frag[:table] == 0 || frag[:table] == nil)
              destinationRow = rowToUpdate
            else
              destinationRow = rowToUpdate2
              iHaveChangedMoreThanOneRow = true
            end
            update(destinationRow, frag, value, sourceRow.name)
            if (iHaveChangedMoreThanOneRow)
              rowToUpdate2.save!
              rowToUpdate2.reload
              rowToUpdate.save!
              rowToUpdate.reload
            else
              rowToUpdate.save!
              rowToUpdate.reload
            end
          end
        end
      else
        #raise ElemNotFound, "Not valid url in: " + sourceRow.name + " from " + page[:url] + " (index: " + page[:id].to_s + ")."
        puts "WARNING: not valid url in: " + sourceRow.name + " from " + page[:url] + " (index: " + page[:id].to_s + ")."
      end
    end
  end
  #Update a row in the DB with the data passed

  #Update the current field
  def self.update(row, item, val, name)
    #The value can be found in the item itself (static case)
    if val
      valueToWrite = clean(item, val)
    else
      valueToWrite = item[:value]
    end

    #write on the DB table
    row[item[:name]] = valueToWrite
    if valueToWrite != nil
      puts "*" + item[:name] + "*" + " updated as *" + valueToWrite.to_s + "* in " + item[:table].to_s + " table for " + name
    else
      row.save!
      row.reload
      raise ElemNotFound, "*" + item[:name] + "*" + " is null on " + name
    end
  end
  #Update the current field

  #Clean data to be saved
  def self.clean(item, val)
    valueToClean = val

    if !valueToClean.empty?
      if item[:commaBasedNum]
        valueToClean = valueToClean.tr(",", ".")
      end
      if item[:removeSpecialChars]
        valueToClean = valueToClean.delete("^\u{0000}-\u{007F}").gsub(/[!@%€&"]/, "")
      end
      if item[:specialOps1]
        valueToClean = (valueToClean.to_f * 100).round(2)
        valueToClean = valueToClean.to_s
      end
      valueToClean = valueToClean.strip
    else
      valueToClean = nil
    end

    return valueToClean
  end
  #Clean data to be saved

  #Send Follow stock newsletter
  def self.sendFollowStockNewsletter
    newsletters = FollowStockNewsletter.all
    newsletters.find_each do |nl|
      if nl.active
        stock = Stock.find_by isin: nl.isin
        destinationMail = nl.email
        nl.increment!(:sended)
        nl.increment!(:total_sended)
        sended = nl.sended
        market = stock.market
        case market
        when "IT"
          report = FiasReport.find_by isin: nl.isin
          urls = SourceItaly.find_by isin: nl.isin
          NewsletterMailer.stock(stock, report, destinationMail, urls, sended).deliver_now
        when "FR"
          report = Cac40Report.find_by isin: nl.isin
          urls = SourceFrance.find_by isin: nl.isin
          NewsletterFranceMailer.stock(stock, report, destinationMail, urls, sended).deliver_now
        else
          puts "Market not found"
        end
        if (sended % 5) == 0
          nl.active = false
        end
        nl.save!
      end
    end
  end
  #Send Follow stock newsletter

  #Follow the market
  def self.sendFollowTheMarketNewsletter
    rows = MarketSuggestionsNewsletter.all
    rows.find_each do |row|
      if row.active
        mail = row.email
        row.increment!(:sended)
        row.increment!(:total_sended)
        sended = row.sended
        NewsletterMailer.market(mail, sended).deliver_now
        if (sended % 5) == 0
          row.active = false
        end
        row.save!
      end
    end
  end
  #Follow the market

  #Find stock of the day
  def self.findStockOfTheDay
  end
  #Find stock of the day

  #SCHEDULES
  #PRODUCTION
  if Rails.env.production?
    scheduler.cron "00 06 * * 1-5", :blocking => true do
    end

    scheduler.cron "00 07 * * 1-5", :blocking => true do
    end

    scheduler.cron "00 08 * * 1-5", :blocking => true do
    end

    scheduler.cron "00 09 * * 1-5", :blocking => true do
    end

    scheduler.cron "20 09 * * 1-5", :blocking => true do
    end

    scheduler.cron "00 10 * * 1-5", :blocking => true do
    end

    scheduler.cron "00 11 * * 1-5", :blocking => true do
    end

    scheduler.cron "00 12 * * 1-5", :blocking => true do
    end

    scheduler.cron "00 13 * * 1-5", :blocking => true do
    end

    scheduler.cron "00 14 * * 1-5", :blocking => true do
    end

    scheduler.cron "00 15 * * 1-5", :blocking => true do
    end

    scheduler.cron "30 15 * * 1-5", :blocking => true do
    end

    scheduler.cron "00 16 * * 1-5", :blocking => true do
    end

    scheduler.cron "00 17 * * 1-5", :blocking => true do
    end

    scheduler.cron "00 18 * * 1-5", :blocking => true do
    end

    scheduler.cron "30 18 * * 1-5", :blocking => true do
    end

    scheduler.cron "00 19 * * 1-5", :blocking => true do
    end

    scheduler.cron "00 08 * * 6-7", :blocking => true do
    end

    scheduler.every "20m" do
    end

    scheduler.in "3s" do
    end
    #DEVELOPMENT
  else
    #scheduler.every '30h', :first => :now do
    scheduler.in "3s" do
      sendFollowStockNewsletter
      #sendFollowTheMarketNewsletter

      $tradingPools.each do |market|
        #updateMarketData(market)
      end

      $tradingMarkets.each do |market|
        #updateMarketData(market)
      end

      #Italy
      #updateMarketData($tradingMarkets[0])

      #France
      #updateMarketData($tradingMarkets[1])

      #ServerErrorOccurredMailer.generic("Error text... ").deliver_now

      #scheduler.every '30s' do
      #updateDBTables('italy')
      #updateDBTables('france')
      #updateMarketsTable
      #ServerErrorOccurredMailer.generic.deliver_now
      #findStockOfTheDay

    end

    scheduler.every "30s" do
      #$tradingMarkets = getTradingMarkets
      #sendFollowStockNewsletter
    end
  end

  #OTHER METHODS
  protected

  #Locale
  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale] || "en"
      else
        flash.now[:notice] = "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end

  def default_url_options
    {locale: I18n.locale}
  end

  private

  #Add 'www.' on url
  def add_www_subdomain
    unless /^www/.match(request.host) or /herokuapp/.match(request.host)
      redirect_to("#{request.protocol}www.#{request.host_with_port}", status: 301)
    end
  end

  #Restart server
  def self.restartServer
    puts "Server restarting in 3 min..."
    restart = Rufus::Scheduler.new
    restart.in "3m" do
      at_exit { puts "Goodbye from " + appName }
      current_pid = Process.pid
      signal = "SIGTERM"
      Process.kill(signal, current_pid)
    end
  end

  #Add a class depending of the variation sign
  def addZSignClass(value)
    if value.to_s.include?("-")
      "negative"
    else
      "positive"
    end
  end
end
