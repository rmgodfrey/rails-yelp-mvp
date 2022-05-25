class Review < ApplicationRecord
  belongs_to :restaurant

  MIN_RATING = 0
  MAX_RATING = 5

  required = %I[content rating]
  required.each { |field| validates field, presence: true }
  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 5
  }
end
