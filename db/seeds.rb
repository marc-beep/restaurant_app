# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 50.times do
 Resto.create([{ name: Faker::Restaurant.name, address: Faker::Address.street_address, contact: Faker::PhoneNumber.cell_phone, 
 cuisine_id: Faker::Number.between(from: 1, to: 5)}])
 end

 800.times do
 Star.create([{ resto_id: Faker::Number.between(from: 1, to: 50), user_id: Faker::Number.between(from: 1, to: 100)  }])
 end




