class ScentSerializer < ActiveModel::Serializer
  attributes :scent
  belongs_to :candle

end
