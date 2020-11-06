class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only [:create]

  def profile
    user = User.find(params[:id])
    render json: user, except: [:created_at, :updated_at]
  end

  def create
    user = User.create(user_params)
    if user.valid?
      token = encode_token(user_id: user.id)
      render json: {user: user, jwt: token} 
    else
      render json: { error: 'failed to create user' }
    end
    
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy!
  
  end

  def edit
    user = User.find_by(id: params[:id])
    user.update(user_params)

  
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end