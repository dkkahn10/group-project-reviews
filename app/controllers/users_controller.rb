class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = current_user
  end
end
