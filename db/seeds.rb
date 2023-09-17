# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

Location.delete_all
Venue.delete_all

# User.delete_all

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

# 3.times do
#   Venue.create(
#     name: Faker::Company.name,
#     description: Faker::Lorem.paragraph,
#     space_size: Faker::Number.between(from: 100, to: 1000),
#     opening_time: Faker::Time.between_dates(from: Date.today, to: Date.today + 7, period: :morning),
#     closing_time: Faker::Time.between_dates(from: Date.today, to: Date.today + 7, period: :evening),
#     availability: true, # You can set this to true or false as needed
#     address: Faker::Address.full_address,
#     latitude: Faker::Address.latitude,
#     longitude: Faker::Address.longitude,
#     price: Faker::Number.between(from: 100, to: 1000),
#     food_beverages_offered: [true, false].sample,
#     other_services_offered: [true, false].sample,
#     location_id: Location.pluck(:id).sample,
#     users_id: User.pluck(:id).sample
#   )
# end


# Location.delete_all
# Location.create(name: "Moka")
# Location.create(name: "Bagatelle")

# Venue.destroy_all
# Venue.create(name: "Les Kokottes")
