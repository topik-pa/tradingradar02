def getExternalPagesFromSourcesRow(source)
  pages = [
    {
      id: 0,
      url: "http://bourse.lefigaro.fr/indices-actions/cours-cac-40-index-px1-fr0003500008",
      country: "france",
      response: "xml",
      values: [
        {
          name: "value",
          xpath: '/descendant::div[@class="market-data__majeur"]//dl[1]/dd/text()',
          commaBasedNum: true,
          table: nil,
        },
        {
          name: "variation",
          xpath: '/descendant::div[@class="market-data__majeur"]//dl[2]/dd/text()',
          commaBasedNum: true,
          table: nil,
        },
      ],
    },
  ]
  return pages
end
