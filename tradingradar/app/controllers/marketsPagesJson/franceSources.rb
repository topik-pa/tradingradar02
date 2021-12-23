
def getExternalPagesFromSourcesRow(source)
  pages = [

    {
      id: 0,
      url: source.url_0,
      response: "xml",
      values: [
        {
          name: "reuters",
          xpath: '/descendant::div[@class="col-left"]//div[@class="container-bloc"][4]//div[@class="sub-col"][2]//div[@class="item-row"][3]//div[@class="item-data"]/text()',
          table: 0,
        },
        {
          name: "last_price",
          xpath: '/descendant::div[@class="quote-header-price"]/span[1]/text()',
          table: 0,
          removeSpecialChars: true,
        },
        {
          name: "variation",
          xpath: '/descendant::div[@class="quote-header-price"]/span[2]/text()',
          table: 0,
          removeSpecialChars: true,
        },
        {
          name: "corporate_url",
          xpath: '/descendant::div[@class="col-left"]//div[@class="container-bloc"][4]//div[@class="sub-col"][1]//div[@class="item-row"][4]//div[@class="item-data"]/a/text()',
          table: 0,
        },
        {
          name: "address",
          xpath: '/descendant::div[@class="col-left"]//div[@class="container-bloc"][4]//div[@class="sub-col"][1]//div[@class="item-row"][1]//div[@class="item-data"]/text()',
          table: 0,
        },
        {
          name: "phone",
          xpath: '/descendant::div[@class="col-left"]//div[@class="container-bloc"][4]//div[@class="sub-col"][1]//div[@class="item-row"][2]//div[@class="item-data"]/text()',
          table: 0,
        },
        {
          name: "profile",
          xpath: '/descendant::div[@class="col-left"]//div[@class="container-bloc"][2]//p/text()',
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
          name: "tradingsat_trendshort",
          xpath: '/descendant::div[@class="col-left"]//div[@class="container-bloc"][5]//div[@class="content-item"]//div[1]/span[2]/text()',
          table: 1,
        },
        {
          name: "tradingsat_trendmedium",
          xpath: '/descendant::div[@class="col-left"]//div[@class="container-bloc"][5]//div[@class="content-item"]//div[2]/span[2]/text()',
          table: 1,
        },
        {
          name: "tradingsat_trendlong",
          xpath: '/descendant::div[@class="col-left"]//div[@class="container-bloc"][5]//div[@class="content-item"]//div[3]/span[2]/text()',
          table: 1,
        },
      ],
    },

    {
      id: 2,
      url: source.url_2,
      response: "json",
      values: [
        {
          name: "boursefortuneo_support",
          xpath: "supportMT",
          table: 1,
          commaBasedNum: true,
        },
        {
          name: "boursefortuneo_resistance",
          xpath: "resistanceMT",
          table: 1,
          commaBasedNum: true,
        },
        {
          name: "boursefortuneo_trendshort",
          xpath: "opinionCT",
          table: 1,
        },
        {
          name: "boursefortuneo_trendmedium",
          xpath: "opinionMT",
          table: 1,
        },

      ],
    },

    {
      id: 3,
      url: source.url_3,
      response: "json",
      values: [
        {
          name: "performance1",
          xpath: [0, "variation"],
          table: 0,
          commaBasedNum: true,
          removeSpecialChars: true,
          specialOps1: true,
        },
        {
          name: "performance6",
          xpath: [2, "variation"],
          table: 0,
          commaBasedNum: true,
          removeSpecialChars: true,
          specialOps1: true,
        },
        {
          name: "performance12",
          xpath: [3, "variation"],
          table: 0,
          commaBasedNum: true,
          removeSpecialChars: true,
          specialOps1: true,
        },

      ],
    },

    {
      id: 4,
      url: source.url_4,
      response: "xml",
      values: [
        {
          name: "name",
          xpath: '/descendant::div[@class="col2_3col"]//dl[1]//dd[1]/b/text()',
          table: 0,
        },
        {
          name: "stock",
          xpath: '/descendant::div[@class="col2_3col"]//dl[1]//dd[1]/b/text()',
          table: 1,
        },
        {
          name: "sector",
          xpath: '/descendant::div[@class="col2_3col"]//dl[1]//dd[2]/text()',
          table: 0,
        },

        {
          name: "dividend_date",
          xpath: '/descendant::table[@class="sticky-enabled"][1]//thead//th[3]/text()',
          table: 0,
        },

        {
          name: "dividend",
          xpath: '/descendant::table[@class="sticky-enabled"][1]//tr[2]/td[3]/text()',
          commaBasedNum: true,
          table: 0,
        },

        {
          name: "lefigaro_consensus",
          xpath: '/descendant::div[@class="col1_3col"]//div[@class="pane-content"]//p[1]',
          commaBasedNum: true,
          table: 1,
        },

      ],
    },

    {
      id: 5,
      url: nil,
      values: [
        {
          name: "market",
          value: "FR",
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
      id: 6,
      url: source.url_6,
      response: "json",
      values: [
        {
          name: "boursefortuneo_rating",
          xpath: ["consensus", "avisMoyen", "title"],
          table: 1,
        },
      ],
    },

  ]

  return pages
end
