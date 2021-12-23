class UserReport < ApplicationRecord
  
  validates :isin, presence: true, uniqueness: true
  
  validates :support, numericality: {greater_than_or_equal_to: 0.00}, allow_nil: true
  validates :resistance, numericality: {greater_than_or_equal_to: 0.00}, allow_nil: true
  validates :buy, numericality: {greater_than_or_equal_to: 0.00}, allow_nil: true
  validates :sell, numericality: {greater_than_or_equal_to: 0.00}, allow_nil: true
  validates :sl, numericality: {greater_than_or_equal_to: 0.00}, allow_nil: true
  
end
