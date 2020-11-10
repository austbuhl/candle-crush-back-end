class Api::V1::CandlesController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]

  def index
    candles = Candle.all
    render json: candles
    # render jsonapi: candles, serializer: CandleSerializer
  end

  def create
    candle = Candle.create(candle_params)
    scent = Scent.create(candle_id: candle[:id], scent: params[:candle][:scent])
    render json: candle
  end

  def show
    candle = Candle.find(params[:id])
    render json: candle
  end

  private

  def candle_params
    params.require(:candle).permit(:name, :description, :price, :image, :quantity, :starting_inv)
  end

end
