#0 https://www.borsaitaliana.it/borsa/azioni/scheda/IT0001233417.html?lang=it
#1 https://www.borsaitaliana.it/companyprofile/htm/it/9.htm
#2 http://finanza-mercati.ilsole24ore.com/quotazioni.php?QUOTE=!A2A.MI
#3 https://www.borsaitaliana.it/borsa/azioni/analisi-tecnica.html?isin=IT0001233417&lang=it
#4 http://finanza-mercati.ilsole24ore.com/fcxp?page=Dettaglio_FTA_Sommario&cmd=framexplane&chId=70&FILTER_VALUE=IT0001233417&Lettera=A&QUOTE=%21A2A.MI&refresh_ce=
#5 https://www.milanofinanza.it/mercati/analisi-tecnica?mercato=italiano&stockcodert=00c0&codicestrumento=w2ae&DBCOD=A2A
#6 https://www.teleborsa.it/azioni/a2a-a2a-it0001233417-SVQwMDAxMjMzNDE3/analisi

def getExternalPagesFromSourcesRow(source)
  pages = [
    {
      id: 0,
      url: source.url_0,
      response: "xml",
      values: [
        {
          name: "reuters",
          xpath: '/descendant::table[contains(@class, "m-table")][2]//tr[5]//span[@class="t-text -right"]/text()',
          table: 0,
        },
        {
          name: "name",
          xpath: "/descendant::h1/a/text()",
          table: 0,
        },
        {
          name: "stock",
          xpath: "/descendant::h1/a/text()",
          table: 1,
        },
        {
          name: "sector",
          xpath: '/descendant::table[contains(@class, "m-table")][2]//tr[6]//span[@class="t-text -right"]/text()',
          table: 0,
        },
        {
          name: "last_price",
          xpath: '/descendant::div[@class="l-box"][6]/span[1]/strong/text()',
          commaBasedNum: true,
          table: 0,
        },
        {
          name: "variation",
          xpath: '/descendant::div[@class="l-box"][6]/span[2]/strong/text()',
          commaBasedNum: true,
          table: 0,
        },
        {
          name: "market_phase",
          xpath: '/descendant::article[@class="l-grid__cell"]/div/div/div[3]/span[1]/strong/text()',
          table: 0,
        },
        {
          name: "performance1",
          xpath: '/descendant::table[contains(@class, "m-table")][2]//tr[1]//td[2]//span/text()',
          commaBasedNum: true,
          table: 0,
        },
        {
          name: "performance6",
          xpath: '/descendant::table[contains(@class, "m-table")][2]//tr[2]//td[2]//span/text()',
          commaBasedNum: true,
          table: 0,
        },
        {
          name: "performance12",
          xpath: '/descendant::table[contains(@class, "m-table")][2]//tr[3]//td[2]//span/text()',
          commaBasedNum: true,
          table: 0,
        },
      ],
    },

    {
      id: 1,
      url: source.url_1,
      response: "xml",
      values: [
        {
          name: "corporate_url",
          xpath: '/descendant::div[contains(@class, "cp__boxdescription__info ")]/div[3]/a/text()',
          table: 0,
        },
        {
          name: "address",
          xpath: '/descendant::div[contains(@class, "cp__boxdescription__info ")]/div[1]/span/text()',
          table: 0,
        },
        {
          name: "phone",
          xpath: '/descendant::div[contains(@class, "cp__boxdescription__info ")]/div[2]/a/text()',
          table: 0,
        },
        {
          name: "profile",
          xpath: '/descendant::article[contains(@class, "cp__boxdescription")]/div[2]/p/text()',
          table: 0,
        },
      ],
    },

    {
      id: 2,
      url: source.url_2,
      response: "xml",
      values: [
        {
          name: "borsaitaliana_support",
          xpath: '/descendant::article[contains(@class, "l-grid__cell")]//table//span[contains(@class, "-dato_techanalSup")]/strong/text()',
          table: 1,
          commaBasedNum: true,
        },
        {
          name: "borsaitaliana_resistance",
          xpath: '/descendant::article[contains(@class, "l-grid__cell")]//table//span[contains(@class, "-dato_techanalRes")]/strong/text()',
          table: 1,
          commaBasedNum: true,
        },
        {
          name: "borsaitaliana_rsi",
          xpath: '/descendant::article[contains(@class, "l-grid__cell")]//table//tr[5]/td[2]//strong/text()',
          table: 1,
          commaBasedNum: true,
        },
        {
          name: "borsaitaliana_volatility",
          xpath: '/descendant::article[contains(@class, "l-grid__cell")]//table//tr[6]/td[2]//strong/text()',
          table: 1,
          commaBasedNum: true,
        },
        {
          name: "borsaitaliana_fta",
          xpath: 'substring-before(substring-after(/descendant::img[contains(@src, "rank-fta")]/@src,"-fta"),".gif")',
          table: 1,
        },

      ],
    },

    {
      id: 4,
      url: source.url_4,
      response: "xml",
      values: [
        {
          name: "sole24ore_shorttrend",
          xpath: '/descendant::div[@class="boxDettagliocontainer"]//tr[1]/td[2]/text()',
          table: 1,
        },
        {
          name: "sole24ore_mediumtrend",
          xpath: '/descendant::div[@class="boxDettagliocontainer"]//tr[2]/td[2]/text()',
          table: 1,
        },
        {
          name: "sole24ore_rating",
          xpath: 'substring(substring-after(string(//script), "]=") ,0, 2)',
          table: 1,
        },
        {
          name: "sole24ore_relativestrenght",
          xpath: '/descendant::div[@class="boxDettagliocontainer right"]//tr[4]/td[2]/text()',
          table: 1,
        },

      ],
    },

    {
      id: 5,
      url: source.url_5,
      response: "xml",
      values: [
        {
          name: "milanofinanza_risk",
          xpath: '/descendant::div[@class="column-top-sx"]//div[contains(@class, "indicior")]/text()',
          table: 1,
          commaBasedNum: true,
        },
        {
          name: "milanofinanza_rating",
          xpath: '/descendant::div[@class="column-top-sx"]//div[contains(@class, "indici2")]/text()',
          table: 1,
        },
        {
          name: "milanofinanza_trendshort",
          xpath: '/descendant::div[@class="content-article"]//table//td[@width="40%"]/table//tr[2]/td/text()',
          table: 1,
        },
        {
          name: "milanofinanza_trendmedium",
          xpath: '/descendant::div[@class="content-article"]//table//td[@width="40%"]/table//tr[4]/td/text()',
          table: 1,
        },
        {
          name: "milanofinanza_trendlong",
          xpath: '/descendant::div[@class="content-article"]//table//td[@width="40%"]/table//tr[6]/td/text()',
          table: 1,
        },

      ],
    },

    {
      id: 6,
      url: source.url_6,
      response: "xml",
      values: [
        {
          name: "teleborsa_support",
          xpath: '/descendant::div[@class="analysis-info"]//div[contains(@class, "left")]//ul[@class="shares-list"]/li[5]/span/text()',
          table: 1,
          commaBasedNum: true,
        },
        {
          name: "teleborsa_resistance",
          xpath: '/descendant::div[@class="analysis-info"]//div[contains(@class, "left")]//ul[@class="shares-list"]/li[1]/span/text()',
          table: 1,
          commaBasedNum: true,
        },

      ],
    },

    {
      id: 7,
      url: nil,
      values: [
        {
          name: "market",
          value: "IT",
          table: 0,
        },
        {
          name: "currency",
          value: "EUR",
          table: 0,
        },

      ],
    },

    {
      id: 8,
      url: source.url_7,
      response: "xml",
      values: [
        {
          name: "dividend",
          xpath: '/descendant::div[@class="content"]//div[contains(@class, "fleft wdett-smalltab")][3]/div[3]/span[2]/text()',
          removeSpecialChars: true,
          commaBasedNum: true,
          table: 0,
        },
        {
          name: "dividend_date",
          xpath: '/descendant::div[@class="content"]//div[contains(@class, "fleft wdett-smalltab")][3]/div[4]/span[2]/b/text()',
          table: 0,
        },
        {
          name: "dividend_yeld",
          xpath: '/descendant::div[@class="content"]//div[contains(@class, "fleft wdett-smalltab")][3]/div[5]/span[2]/text()',
          removeSpecialChars: true,
          commaBasedNum: true,
          table: 0,
        },

      ],
    },

  ]

  return pages
end
