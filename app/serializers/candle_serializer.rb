class CandleSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image, :price, :quantity, :starting_inv, :scents, :reviews
  has_many :reviews
  # has_many :scents

  def scents
    object.scents.map {|scent| scent.scent}
  end

  # def reviews
  #   object.reviews.map{|review| (:review => review.review, :rating => review.rating, :user => review.user).to_h}
  # end

end
