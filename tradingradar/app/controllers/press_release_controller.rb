class PressReleaseController < ApplicationController
  def source0 #TEST
    #Borsa Italiana
    isin = params[:isin] ? params[:isin] : nil
    urls = SourceItaly.find_by isin: isin
    url1 = urls.url_0 #https://www.borsaitaliana.it/borsa/azioni/scheda/IT0001233417.html?lang=it
    url2 = urls.url_3 #https://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0001233417&lang=it

    begin
      doc = Nokogiri::HTML(open(url1), nil, "UTF-8")
      doc.encoding = "UTF-8"
      doc.xpath("//@style").remove
      doc.search("script", "img", "a").each do |tag|
        tag.remove
      end
      frag1 = doc.at_xpath('/descendant::article[@class="l-grid__cell"][3]//span[contains(@class, "t-text")][1]').to_s
      frag2 = doc.at_xpath('/descendant::article[@class="l-grid__cell"][2]//div[contains(@class, "-sm-half")][1]').to_s
      frag3 = doc.at_xpath('/descendant::article[@class="l-grid__cell"][2]//div[contains(@class, "-sm-half")][2]').to_s
      frag4 = doc.at_xpath('/descendant::article[@class="l-grid__cell"][4]//div[contains(@class, "l-box")][3]').to_s

      if url2
        doc2 = Nokogiri::HTML(open(url2), nil, "UTF-8")
        doc2.encoding = "UTF-8"
        doc2.search("script", "img", "a").each do |tag|
          tag.remove
        end
        @frag5 = doc2.at_xpath('//article[contains(@class,"l-grid")][2]/div[contains(@class,"-pfull")]').to_s
      else
        @frag5 = nil
      end
    rescue OpenURI::HTTPError => e
      puts "Error retrieving url data: " + e.message
    end

    render html: ('<div id="source-container">' +
                  '<div class="frag">' + frag1 + "</div>" +
                  '<div class="frag">' + frag2 + "</div>" +
                  '<div class="frag">' + frag3 + "</div>" +
                  '<div class="frag">' + frag4 + "</div>" +
                  '<div class="frag">' + frag5 + "</div>" +
                  "</div>").html_safe
  end

  def source1
    #Borsa Italiana
    isin = params[:isin] ? params[:isin] : nil
    urls = SourceItaly.find_by isin: isin
    url = urls.url_0 #https://www.borsaitaliana.it/borsa/azioni/scheda/IT0001233417.html?lang=it
    frag1, frag2, frag3 = ""

    begin
      doc = Nokogiri::HTML(open(url), nil, "UTF-8")
      doc.encoding = "UTF-8"
      doc.xpath("//@style").remove
      doc.search("script").each do |tag|
        tag.remove
      end
      frag1 = doc.at_xpath('/descendant::article[contains(@class,"l-grid")][11]').to_s
      frag2 = doc.at_xpath('/descendant::article[contains(@class,"l-grid")][12]').to_s
      frag3 = doc.at_xpath('/descendant::img[contains(@src,"rank-")]/@src').to_s
    rescue OpenURI::HTTPError => e
      puts "Error retrieving url data: " + e.message
    end

    render html: ('<div id="source-container">' +
                  '<div class="frag">' + frag2 + "</div>" +
                  '<div class="frag">' + frag1.truncate(1400, omission: "   ...(continue on site)") + "</div>" +
                  '<div class="frag">
                    <div>
                      <h3>Rating</h3>
                      <div class="center">
                        <img width="64" height="64" src="' + $imagePath + "icons/" + frag3.sub("/media/img/technicalanalysis/", "") + '" />
                      </div>
                    </div>
                  </div>' +
                  "</div>").html_safe
  end

  #def source2
  #Borsa Italiana
  #isin = params[:isin] ? params[:isin] : nil
  #urls = SourceItaly.find_by isin: isin
  #url = "https://www.borsaitaliana.it/borsa/azioni/elenco-completo-notizie.html?isin=" + isin + "&lang=it" #https://www.borsaitaliana.it/borsa/azioni/elenco-completo-notizie.html?isin=IT0001178299&lang=it

  #begin
  #  doc = Nokogiri::HTML(open(url), nil, "UTF-8")
  #  doc.encoding = "UTF-8"
  #  doc.search("script", "img").each do |tag|
  #    tag.remove
  #  end
  #  @frag1 = doc.at_xpath('/descendant::article[contains(@class, "l-grid__cell")][5]').to_s
  #  @frag2 = doc.at_xpath('/descendant::article[contains(@class, "l-grid__cell")][6]').to_s
  #rescue OpenURI::HTTPError => e
  #  puts "Error retrieving url data: " + e.message
  #end

  #render html: ('<div id="source-container">' +
  #              '<div class="frag">' + @frag1 + "</div>" +
  #              '<div class="frag">' + @frag2 + "</div>" +
  #              "</div>").html_safe
  #end

  def source2
    #Il Sole 24 Ore
    isin = params[:isin] ? params[:isin] : nil
    urls = SourceItaly.find_by isin: isin
    url = urls.url_3 #https://vwd-proxy.ilsole24ore.com/FinanzaMercati/WidgetSelector/box-commento?widgetConfiguration=BoxCommentoBilancioSintetico&topicName=ATL.MI
    frag1 = ""
    begin
      doc = Nokogiri::HTML(open(url), nil, "UTF-8")
      doc.encoding = "UTF-8"
      doc.xpath("//@style").remove
      doc.search("script", "a").each do |tag|
        tag.remove
      end

      #doc.css('img[src*="/xp/FinanzaMercatiUser/img"]').each do |img|
      #  currValue = img.attributes["src"].value
      #  newValue = currValue.gsub("/xp/FinanzaMercatiUser/img", $imagePath + "icons")
      #  img.attributes["src"].value = newValue
      #end

      frag1 = doc.at_xpath('/descendant::div[contains(@class, "box-commento")]').to_s
    rescue OpenURI::HTTPError => e
      puts "Error retrieving url data: " + e.message
    end

    if frag1.present?
      render html: ('<div id="source-container">' +
                    '<div class="frag">' + frag1.truncate(900, omission: "   ...(continue on site)") + "</div>" +
                    "</div>").html_safe
    end
  end

  def source3
    #Milano Finanza
    isin = params[:isin] ? params[:isin] : nil
    urls = SourceItaly.find_by isin: isin
    url = urls.url_7 #https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=00c0&codicestrumento=w2ae&DBCOD=A2A
    frag1 = ""

    begin
      doc = Nokogiri::HTML(open(url), nil, "UTF-8")
      doc.encoding = "UTF-8"
      doc.xpath("//@style").remove
      doc.search("script").each do |tag|
        tag.remove
      end
      @frag1 = doc.css(".content .news").to_s
    rescue OpenURI::HTTPError => e
      puts "Error retrieving url data: " + e.message
    end

    render html: ('<div id="source-container">' +
                  '<div class="frag">' + frag1 + "</div>" +
                  "</div>").html_safe
  end

  def source4
    #Teleborsa
    isin = params[:isin] ? params[:isin] : nil
    urls = SourceItaly.find_by isin: isin
    url = urls.url_6 #https://www.teleborsa.it/azioni/a2a-a2a-it0001233417-SVQwMDAxMjMzNDE3/analisi?tab=2
    frag1 = ""

    begin
      doc = Nokogiri::HTML(open(url), nil, "UTF-8")
      doc.encoding = "UTF-8"
      doc.xpath("//@style").remove
      doc.search("script", "a", "img").each do |tag|
        tag.remove
      end
      frag1 = doc.at_xpath('/descendant::div[@class="comment"]//div[contains(@id, "AnalisiDiStatus")]').to_s
    rescue OpenURI::HTTPError => e
      puts "Error retrieving url data: " + e.message
    end

    render html: ('<div id="source-container">' +
                  '<div class="frag">' + frag1 + "</div>" +
                  "</div>").html_safe
  end

  def source5
    #TradingSat
    isin = params[:isin] ? params[:isin] : nil
    urls = SourceFrance.find_by isin: isin
    url = urls.url_1 #https://www.tradingsat.com/loreal-FR0000120321/
    frag1, frag2 = ""

    begin
      doc = Nokogiri::HTML(open(url), nil, "UTF-8")
      doc.encoding = "UTF-8"
      doc.search("script", "img").each do |tag|
        tag.remove
      end
      frag1 = doc.at_xpath('//div[contains(@class,"wrapper-qv-news")]').to_s
      frag2 = doc.at_xpath('//div[contains(@class,"wrapper-qv-advice")]').to_s
    rescue OpenURI::HTTPError => e
      puts "Error retrieving url data: " + e.message
    end

    render html: ('<div id="source-container">' +
                  '<div class="frag">' + frag1 + "</div>" +
                  '<div class="frag">' + frag2 + "</div>" +
                  "</div>").html_safe
  end

  def source6
    #BourseFortuneo

    render html: ('<div id="source-container">' +
                  "</div>").html_safe
  end

  def source7
    #Le Figaro
    isin = params[:isin] ? params[:isin] : nil
    urls = SourceFrance.find_by isin: isin
    url = urls.url_4 #http://bourse.lefigaro.fr/indices-actions/cours-l-oreal-or-fr0000120321-par
    frag1, frag2 = ""

    begin
      doc = Nokogiri::HTML(open(url), nil, "UTF-8")
      doc.encoding = "UTF-8"
      doc.search("script", "img").each do |tag|
        tag.remove
      end
      frag1 = doc.at_xpath('//div[contains(@class,"prevision-analystes")]').to_s
      frag2 = doc.at_xpath('//div[contains(@class,"actus-conseils last")]').to_s
    rescue OpenURI::HTTPError => e
      puts "Error retrieving url data: " + e.message
    end

    render html: ('<div id="source-container">' +
                  '<div class="frag">' + frag1 + "</div>" +
                  '<div class="frag">' + frag2 + "</div>" +
                  "</div>").html_safe
  end
end
