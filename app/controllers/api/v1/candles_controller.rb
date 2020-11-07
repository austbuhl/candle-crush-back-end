class Api::V1::CandlesController < ApplicationController
  skip_before_action :authorized

  def index
    candles = Candle.all
    render json: candles, except: [:created_at, :updated_at]
  end

  def create
    candle = Candle.create(candle_params)
    render json: candle, except: [:created_at, :updated_at]
  end

  private

  def candle_params
    params.require(:candle).permit(:name, :description, :scent, :price, :image)
  end

end
