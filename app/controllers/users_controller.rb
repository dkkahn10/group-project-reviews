# frozen_string_literal: true
class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:notice] = "Location was succesfully edited."
      redirect_to user_path(@user)
    else
      flash[:notice] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  def delete
    sign_out_and_redirect(current_user)
  end


  private

  def user_params
    params.require(:user).permit(:username, :profile_picture)
  end

end
