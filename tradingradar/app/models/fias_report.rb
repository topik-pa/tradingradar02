class FiasReport < ApplicationRecord
  validates :isin, presence: true, uniqueness: true

  validates :borsaitaliana_support, numericality: {greater_than_or_equal_to: 0.00}, allow_nil: true
  validates :borsaitaliana_resistance, numericality: {greater_than_or_equal_to: 0.00}, allow_nil: true
  validates :teleborsa_support, numericality: {greater_than_or_equal_to: 0.00}, allow_nil: true
  validates :teleborsa_resistance, numericality: {greater_than_or_equal_to: 0.00}, allow_nil: true
end
