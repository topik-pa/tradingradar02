class Cac40Report < ApplicationRecord
  
  validates :isin, presence: true, uniqueness: true
  
  validates :boursefortuneo_support, numericality: {greater_than_or_equal_to: 0.00}, allow_nil: true
  validates :boursefortuneo_resistance, numericality: {greater_than_or_equal_to: 0.00}, allow_nil: true
  validates :boursefortuneo_target, numericality: {greater_than_or_equal_to: 0.00}, allow_nil: true
  validates :zonebourse_resistance, numericality: {greater_than_or_equal_to: 0.00}, allow_nil: true
  validates :zonebourse_support, numericality: {greater_than_or_equal_to: 0.00}, allow_nil: true
  
end
