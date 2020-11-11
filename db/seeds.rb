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
Review.destroy_all
Scent.destroy_all

user1 = User.create(username: 'test', password: 'test', user_type: 'vendor')

types = ["basic", "vendor"]

25.times do 
  User.create(username: Faker::Name.unique.name, password: Faker::Alphanumeric.alpha(number: 10), user_type: types.sample)
end

candles = [
  'https://www.sadanduseless.com/wp-content/uploads/2019/12/funny-candles1.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT4V44a_z6kQnPZmaVUptqZPjv8eib95bWrSA&usqp=CAU',
  'https://cdn.shopify.com/s/files/1/0068/9494/4323/products/SLOW_BURN_1200x1200.png?v=1580837103',
  'https://static1.squarespace.com/static/5af6caa8f407b40c9909268d/5bd0b7178165f5ca7e30730c/5c198b7603ce641f3e09b90a/1580357544559/Ohio+Front.jpg?format=1500w',
  'https://media1.popsugar-assets.com/files/thumbor/7Ai5S5edVG3w8MbksKiN5ErCC5Y/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2019/11/12/845/n/46706959/tmp_aR0GRQ_c31c794328a91e32_Screen_Shot_2019-11-12_at_2.16.53_PM.png',
  'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/03/burning-candle-matchbook-1296x728-header.jpg?w=1155&h=1528',
  'https://images-na.ssl-images-amazon.com/images/I/41BHd8Slz5L._AC_.jpg',
  'https://cdn.shopify.com/s/files/1/0987/6688/products/HMS.NewYorkCity.Candle.Ecom.1_335x335.progressive.jpg?v=1594770401',
  'https://www.ikea.com/us/en/images/products/fenomen-unscented-block-candle-natural__0641115_PE700263_S5.JPG',
  'https://images-na.ssl-images-amazon.com/images/I/8109M8jy-tL._AC_SL1500_.jpg',
  'https://static.lladro.com/media/catalog/product/3/1/31a5c7bf54d2c0063fefda833c3e41f98b2e76a584edc20e9ca527c2f78113f212dd94e4020e51ed2ca162a7f24375e92df14dd21be254903ed63539be58493b.jpg',
  'https://i.etsystatic.com/21546356/r/il/70f5c5/2537382335/il_794xN.2537382335_o74x.jpg',
  'https://images.bloomingdalesassets.com/is/image/BLM/products/2/optimized/10729792_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&$filtersm$&fmt=webp',
  'https://www.creativefabrica.com/wp-content/uploads/2020/05/08/1588923947/Birthday-Candle-580x386.jpg',
  'https://cdnimg.webstaurantstore.com/images/products/large/69293/1833773.jpg',
  'https://birthdaysparklers.com/wp-content/uploads/2018/11/birthday-candle-sparklers.jpg',
  'https://static1.squarespace.com/static/5a67673aa803bbf22230768a/5a788bcaf9619a31bd829742/5a7b2ea38165f5e5569a9514/1557932656564/?format=1500w',
  'https://www.pyrojunkiefireworks.com/wp-content/uploads/2017/03/PJ200140wshadow.png',
  'https://i.pinimg.com/originals/d7/7c/24/d77c2422af9ef5117c48dfe5d6901c76.png',
  'https://cdn.shoplightspeed.com/shops/603785/files/9017393/mose-mary-me-drew-brees-saint-candle.jpg',
  'https://www.dontwasteyourmoney.com/wp-content/uploads/2020/07/best-funny-candle-1-scaled-e1594045176799-900x400.jpeg'
]

50.times do 
  Candle.create(name: Faker::Hipster.word, price: rand(100.00), quantity:100, starting_inv:100, image: candles.sample, description: Faker::Hipster.paragraph)
end

100.times do 
  purchase = Purchase.create(user_id: User.all.sample.id, candle_id: Candle.all.sample.id)
  candle = Candle.find(purchase.candle_id)
  candle.purchase_candle
  candle.save
end

500.times do 
  Review.create(review: Faker::Restaurant.review , rating: rand(5.0), user_id: User.all.sample.id, candle_id: Candle.all.sample.id)
end

200.times do 
  Scent.create(candle_id: Candle.all.sample.id, scent: Faker::Hipster.word)
end