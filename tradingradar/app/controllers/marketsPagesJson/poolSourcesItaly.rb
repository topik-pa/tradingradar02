def getExternalPagesFromSourcesRow(source)
  pages = [
    {
      id: 0,
      url: "https://www.borsaitaliana.it/borsa/indici/indici-in-continua/dettaglio.html?indexCode=FTSEMIB&lang=it",
      country: "italy",
      response: "xml",
      values: [
        {
          name: "value",
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
      ],
    },
  ]
  return pages
end
