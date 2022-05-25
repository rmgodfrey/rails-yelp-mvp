# frozen_string_literal: true

puts 'Cleaning database...'
Restaurant.destroy_all

NUMBER_OF_RESTAURANTS = 5
MAX_REVIEWS_PER_RESTAURANT = 10

def create_random_restaurant
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: Restaurant::CATEGORIES.sample
  )
  rand(MAX_REVIEWS_PER_RESTAURANT + 1).times do
    create_random_review(restaurant)
  end
end

def create_random_review(restaurant)
  Review.create(
    content: Faker::Lorem.paragraph,
    rating: rand(Review::MAX_RATING + 1),
    restaurant: restaurant
  )
end

puts 'Creating restaurants...'
NUMBER_OF_RESTAURANTS.times { create_random_restaurant }
