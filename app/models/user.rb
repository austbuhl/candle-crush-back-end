class User < ApplicationRecord
  has_many :purchases
  has_many :candles, through: :purchases

end
