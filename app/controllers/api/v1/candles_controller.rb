class Api::V1::CandlesController < ApplicationController

  def index
    candles = Candle.all
    render json: candles, except: [:created_at, :updated_at]
  end

  

end
