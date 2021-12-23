class FollowStockNewsletter < ApplicationRecord
  validates :stock, presence: true
  #validates :isin, presence: true
  validates :privacy, presence: true
  validates :email, presence: true, format: {with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, message: " format not recognized"}

  validates :email, uniqueness: {scope: :isin}
end
