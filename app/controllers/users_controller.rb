class UsersController < ApplicationController

  def index
  end

  def show
  end

  def delete
    user = User.find(params[:id])
    sign_out user
  end

end
