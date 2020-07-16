# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# puts 'Creat a new user...'
# main_user = User.create(
#   name: Faker::Name.name,
#   email: 'homecook@lewagon.com',
#   address: Faker::Address.full_address,
#   phone: Faker::PhoneNumber.cell_phone,
#   password: '123456')
# puts 'Finished'

# puts 'Creating 4 other fake user.'
# 4.times do
#     User.create(
#     name: Faker::Name.name,
#     email: Faker::Internet.email,
#     address: Faker::Address.full_address,
#     phone: Faker::PhoneNumber.cell_phone,
#     password: Faker::Internet.password(min_length: 8)
#   )
# end
# puts 'Finished'

# puts 'Creating 5 homecooks record.'
# require "open-uri"
# i = 0
# 5.times do |i|
#   homecook = Homecook.create(
#     price_per_person: [2000,3000,4000,5000,10000,20000].sample,
#     user_id: User.find(i+1).id,
#     introduction:['I am is a Personal Chef with several areas of expertise.',
#       'Enjoy cooking so much hope to help you!','Hi!I have been a homecook for 5 years already.',
#       'Hi!I am a former 5 star hotels chef.','I am good at cooking for a party!'].sample,
#     tag_list: ["Chinese", "Japanese", "Italian", "French","Brazilian"].sample
#   )
#   file = URI.open('https://images.unsplash.com/photo-1557499305-87bd9049ec2d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80')
#   homecook.photo.attach(io: file, filename: 'image.png', content_type: 'image/png')
# end
# puts 'Finished!'

puts 'Creating 5 reservations record for homecook:11.'
4.times do
  Reservation.create(
    datetime: Faker::Date.in_date_period(year: 2020, month: 8),
    address: Faker::Address.full_address,
    capacity: [10,4,8,6,9].sample,
    description: ['With baby','One vegetarian','We all like Meat','allergic to nuts'].sample,
    status: ['accept','reject','pending'].sample,
    user_id: [11,12,13,14,15].sample,
    homecook_id: 11
    )
end

  Reservation.create(
    datetime: Faker::Date.in_date_period(year: 2020, month: 8),
    address: Faker::Address.full_address,
    capacity: [10,4,8,6,9].sample,
    description: ['With baby','One vegetarian','We all like Meat','allergic to nuts'].sample,
    status:'pending',
    user_id: [11,12,13,14,15].sample,
    homecook_id: 11
    )
puts 'Finished!'
