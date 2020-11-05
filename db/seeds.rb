# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

user1 = User.create(username: 'test', password: 'test')

20.times do 
  Candle.create(name: Faker::Hipster.word, price: rand(100.00), image: Faker::LoremFlickr.image,description: Faker::Hipster.paragraph, scent: Faker::Hipster.word)
end

5.times do 
  Purchase.create(user_id: user1.id, candle_id: Candle.all.sample.id)
end