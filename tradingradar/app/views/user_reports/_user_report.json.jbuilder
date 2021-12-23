json.extract! user_report, :id, :isin, :stock, :support, :resistance, :trendshort, :trendmedium, :trendlong, :rating, :note, :buy, :sell, :sl, :created_at, :updated_at
json.url user_report_url(user_report, format: :json)
