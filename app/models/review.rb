class Review < ApplicationRecord
  belongs_to :restaurant

  MIN_RATING = 0
  MAX_RATING = 5

  required = %I[content rating]
  required.each { |field| validates field, presence: true }
  validates :rating, inclusion: { in: MIN_RATING..MAX_RATING }
  validates :rating, numericality: { only_integer: true }
end
