class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  CATEGORIES = %w[chinese italian japanese french belgian]
  REQUIRED = %I[name address category]

  REQUIRED.each { |field| validates field, presence: true }
  validates :category, inclusion: { in: CATEGORIES }
end
