# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
User.destroy_all
Candle.destroy_all
Purchase.destroy_all


user1 = User.create(username: 'test', password: 'test')

candles = [
  'https://www.sadanduseless.com/wp-content/uploads/2019/12/funny-candles1.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT4V44a_z6kQnPZmaVUptqZPjv8eib95bWrSA&usqp=CAU',
  'https://cdn.shopify.com/s/files/1/0068/9494/4323/products/SLOW_BURN_1200x1200.png?v=1580837103',
  'https://static1.squarespace.com/static/5af6caa8f407b40c9909268d/5bd0b7178165f5ca7e30730c/5c198b7603ce641f3e09b90a/1580357544559/Ohio+Front.jpg?format=1500w',
  'https://media1.popsugar-assets.com/files/thumbor/7Ai5S5edVG3w8MbksKiN5ErCC5Y/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2019/11/12/845/n/46706959/tmp_aR0GRQ_c31c794328a91e32_Screen_Shot_2019-11-12_at_2.16.53_PM.png'
]

20.times do 
  Candle.create(name: Faker::Hipster.word, price: rand(100.00), image: candles.sample ,description: Faker::Hipster.paragraph, scent: Faker::Hipster.word)
end

5.times do 
  Purchase.create(user_id: user1.id, candle_id: Candle.all.sample.id)
end

5.times do 
  Review.create(review: Faker::Hipster.word, rating: rand(5.0), user_id: User.all.sample.id, candle_id: Candle.all.sample.id)

end