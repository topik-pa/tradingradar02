class Analysis < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true
  validates :description, presence: true
  validates :stock, presence: true
  validates :reuters, presence: true
  validates :isin, presence: true
  validates :author, presence: true
  validates :market, presence: true

  def should_generate_new_friendly_id?
    title_changed?
  end
end
