class Api::V1::PurchasesController < ApplicationController
  skip_before_action :authorized
  

  def index
    purchases = Purchase.all
    render json: purchases, except: [:created_at, :updated_at]
  end

  def create
    current_user = User.find(params[:user])

    params[:candle].each do |purchase| 
      Purchase.create(user_id: current_user[:id], candle_id: purchase[:id])
      byebug
    end

    
  end

end