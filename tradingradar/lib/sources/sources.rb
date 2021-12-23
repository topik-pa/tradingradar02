puts 'REQUIRED!!!'    

urls = [
      {
        id: 0,
        url: source.url_0,
        valid: !source.url_0.blank?,
        cod: '.MI',
        country: 'it',
        values: [
          {
            name: 'reuters',
            xpath: '/descendant::table[contains(@class, "m-table")][2]//tr[5]//span[@class="t-text -right"]/text()'    
          },
          {
            name: 'name',
            xpath: '/descendant::h1/a/text()'         
          },
          {
            name: 'sector',
            xpath: '/descendant::table[contains(@class, "m-table")][2]//tr[6]//span[@class="t-text -right"]/text()'        
          },
          {
            name: 'last_price',
            xpath: '/descendant::div[@class="l-box"][5]/span[1]/strong/text()',
            numeric: true    
          },
          {
            name: 'variation',
            xpath: '/descendant::div[@class="l-box"][5]/span[2]/strong/text()',
            numeric: true      
          },
          {
            name: 'market_phase',
            xpath: '/descendant::article[@class="l-grid__cell"]/div/div/div[3]/span[1]/strong/text()'       
          },
          {
            name: 'performance1',
            xpath: '/descendant::table[contains(@class, "m-table")][2]//tr[1]//td[2]//span/text()',
            numeric: true      
          },
          {
            name: 'performance6',
            xpath: '/descendant::table[contains(@class, "m-table")][2]//tr[2]//td[2]//span/text()',
            numeric: true       
          },
          {
            name: 'performance12',
            xpath: '/descendant::table[contains(@class, "m-table")][2]//tr[3]//td[2]//span/text()',
            numeric: true      
          }
        ]
      }
      
      
=begin    
      {
        url: source.url_2,
        cod: '.MI',
        values: [
          {
            name: 'corporate_url',
            xpath: ''    
          },
          {
            name: 'address',
            xpath: ''         
          },
          {
            name: 'phone',
            xpath: ''          
          },
          {
            name: 'profile',
            xpath: ''         
          }
        ] 
      },
      
      {
        url: source.url_2,
        cod: '.MI',
        values: [
          {
            name: 'corporate_url',
            xpath: ''    
          },
          {
            name: 'address',
            xpath: ''         
          },
          {
            name: 'phone',
            xpath: ''          
          },
          {
            name: 'profile',
            xpath: ''         
          }
        ] 
      }
=end      
    ]
