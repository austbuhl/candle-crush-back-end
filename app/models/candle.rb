class Candle < ApplicationRecord
  has_many :reviews
  has_many :purchases
  has_many :users, through: :reviews
    
  has_many :users, through: :purchases
  
  def purchase_candle
    self.quantity -= 1
  end

  def return_candle
    self.quantity += 1
  end
end
