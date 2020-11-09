class Api::V1::ReviewsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    review = Review.create(review_params)
    render json: review, except: [:created_at, :updated_at]
  end

  private
  
  def review_params
    params.require(:review).permit(:user_id, :candle_id, :rating, :review)
  end

end