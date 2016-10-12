# frozen_string_literal: true
class UsersController < ApplicationController

  def index
    @users = User.all
  end

  # def destroy
  #   @user = User.find(params[:id])
  #
  #   if authorized_user
  #     @user.user_valid_destroy
  #     redirect_to root_path
  #   end
  # end
  #
  # def delete
  #   sign_out_and_redirect(current_user)
  # end

  private

  def authorized_user?
    current_user.try(:admin?) || current_user == @user
  end
  #
  # def user_valid_destroy
  #   @user.reviews.each(&:destroy)
  #   @user.locations.each do |location|
  #     location.reviews.destroy_all
  #   end
  #   @user.locations.each(&:destroy)
  #   @user.destroy
  #   flash[:success] = "User Account successfully closed"
  #   redirect_to locations_path
  # end
end
