class PurchasesController < ApplicationController

  def index
    purchases = Purchase.all
    render json: purchases, except: [:created_at, :updated_at]
  end

  def create

    params[:candle].each do |purchase| 
      Purchase.create(user_id: 1, candle_id: purchase[:id])
    end

    
  end

end