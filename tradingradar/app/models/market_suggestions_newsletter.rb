class MarketSuggestionsNewsletter < ApplicationRecord
  validates :privacy, presence: true
  validates :email, presence: true, format: {with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, message: " format not recognized"}

  validates :email, uniqueness: true
end
