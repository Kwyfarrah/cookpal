# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Creat a new user...'
user = User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: 'homecook@lewagon.com',
  address: Faker::Address.full_address,
  phone: Faker::PhoneNumber.cell_phone,
  password: '123456')
puts 'Finished'

puts 'Creating 5 other fake user.'
4.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    address: Faker::Address.full_address,
    phone: Faker::PhoneNumber.cell_phone,
    password: Faker::Internet.password(min_length: 8)
  )
end
puts 'Finished'

puts 'Creating 5 homecooks record.'
5.times do |i|
  homecook = Homecook.create(
    price_per_person: [2000,3000,4000,5000,10000,20000].sample
    user_id: User.find(i+1).id
    introduction:['I am is a Personal Chef with several areas of expertise.',
      'Enjoy cooking so much hope to help you!','Hi!I have been a homecook for 5 years already.',
      'Hi!I am a former 5 star hotels chef.','I am good at cooking for a party!'].sample
  )
end
puts 'Finished!'
