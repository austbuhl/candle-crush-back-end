class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :review, :rating, :user
  belongs_to :user
end
