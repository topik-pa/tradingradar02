json.extract! dax30_report, :id, :isin, :stock, :finanzen_rating, :finanzen_ratingmoodys, :finanzen_sentiment, :created_at, :updated_at
json.url dax30_report_url(dax30_report, format: :json)
