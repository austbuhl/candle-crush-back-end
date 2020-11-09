class Candle < ApplicationRecord
  has_many :reviews
  has_many :purchases
  has_many :users, through: :reviews
    
  has_many :users, through: :purchases
end
