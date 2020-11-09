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

  def show
    candle = Candle.find(params[:id])
    # reviews = Reviews.(candle_id: params[:candle_id])
    # reviews = candle.reviews
    render json: candle.to_json(:include => {
      :reviews => {:only => [:review, :rating], :include => {:user => {:only => [:username]}
  
    }}})


  end

  private

  def candle_params
    params.require(:candle).permit(:name, :description, :scent, :price, :image)
  end

end
