class Dax30Report < ApplicationRecord
  
  validates :isin, presence: true, uniqueness: true
  
end
