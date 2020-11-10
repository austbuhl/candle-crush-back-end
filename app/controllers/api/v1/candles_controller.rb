class Api::V1::CandlesController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]

  def index
    candles = Candle.all
    render json: candles.to_json(:include => 
      {:scents => {:only => [:scent]}}
    ), 
    except: [:created_at, :updated_at]
  end

  def create
    candle = Candle.create(candle_params)
    render json: candle, except: [:created_at, :updated_at]
    scent = Scent.create(candle_id: candle[:id], scent: params[:candle][:scent])
    byebug
  end

  def show
    candle = Candle.find(params[:id])
    # reviews = Reviews.(candle_id: params[:candle_id])
    # reviews = candle.reviews

    # reviews = {:reviews => {:only => [:review, :rating], :include => {:user => {:only => [:username]}}}}
    # scents = {:scents => {:only => [:scent]}}

    # render json: candle.to_json(:include => {:reviews => reviews, :scents => scents})

    render json: candle.as_json(:include => {
      :reviews => {:only => [:review, :rating], :include => {:user => {:only => [:username]}}},
      :scents => {:only => [:scent]}
    })

  end

  private

  def candle_params
    params.require(:candle).permit(:name, :description, :price, :image, :quantity, :starting_inv)
  end

end
