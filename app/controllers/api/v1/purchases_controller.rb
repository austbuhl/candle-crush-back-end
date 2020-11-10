class Api::V1::PurchasesController < ApplicationController
  # skip_before_action :authorized, only: [:create]
  
  def index
    
    # current_user = User.find(params[:user])
    purchases = current_user.purchases
    render json: purchases.to_json(include: [:candle])
  end

  def create
    current_user = User.find(params[:user])
    params[:candle].each do |purchase| 
      Purchase.create(user_id: current_user[:id], candle_id: purchase[:id])
      candle = Candle.find(purchase[:id])
      candle.purchase_candle
      candle.save
    end
  end

  def destroy
    purchase = Purchase.find(params[:id])
    candle = Candle.find(purchase.candle_id)
    candle.return_candle
    candle.save
    purchase.destroy
    render json: purchase
  end

end