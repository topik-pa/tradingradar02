class Stock < ApplicationRecord 
    
  validates :isin, presence: true, uniqueness: true
  validates :reuters, uniqueness: true
  validates :last_price, numericality: {greater_than_or_equal_to: 0.00}, allow_nil: true
  
end
