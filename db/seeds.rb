# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# require 'faker'


# Location.delete_all
# Venue.delete_all

# User.delete_all

# Venuetype.delete_all
# types = ["Convention centers", "Conference centers", "Hotels", "Resorts", "Restaurants", "Lounges", "Community centers"]
# types.each do |type|
#   Venuetype.create(name: type)
# end

Order.delete_all
Cart.delete_all
Booking.delete_all
Venue.delete_all
Location.delete_all
Message.delete_all
Chatroom.delete_all
User.delete_all
Venuetype.delete_all
types = ["Convention centers", "Conference centers", "Hotels", "Resorts", "Restaurants", "Lounges", "Community centers"]
types.each do |type|
  Venuetype.create(name: type)
end

# 3.times do
#   User.create(
#     email: Faker::Internet.email,
#     encrypted_password: Devise.friendly_token[0, 20], # Generate a random password
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     admin: false, # Change to true for admin users if needed
#     company_name: Faker::Company.name,
#     company_address: Faker::Address.full_address,
#     latitude: Faker::Address.latitude,
#     longitude: Faker::Address.longitude
#   )
# end

# 3.times do
#   Location.create(
#     name: Faker::Address.unique.community,
#     outline: Faker::Lorem.paragraph,
#     description: Faker::Lorem.paragraph,
#     address: Faker::Address.full_address,
#     latitude: Faker::Address.latitude,
#     longitude: Faker::Address.longitude
#   )
# end
