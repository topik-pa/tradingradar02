json.extract! stock, :id, :isin, :reuters, :name, :sector, :last_price, :variation, :market_phase, :corporate_url, :address, :phone, :market, :currency, :profile, :keywords, :dividend, :dividend_date, :dividend_yeld, :performance1, :performance6, :performance12, :code, :created_at, :updated_at
json.url stock_url(stock, format: :json)
