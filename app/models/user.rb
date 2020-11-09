class User < ApplicationRecord
  has_many :purchases
  has_many :reviews
  has_many :candles, through: :purchases

  has_secure_password

end
