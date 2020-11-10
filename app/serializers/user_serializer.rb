class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :user_type
  has_many :reviews
  # has_many :candles, through: :purchases
  # has_many :purchases
end
