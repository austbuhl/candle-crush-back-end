class UsersController < ApplicationController

  def index
    users = User.all
    render json: users, except: [:created_at, :updated_at]
  end

end