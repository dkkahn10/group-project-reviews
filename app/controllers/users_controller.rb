# frozen_string_literal: true
class UsersController < ApplicationController
  def delete
    sign_out_and_redirect(current_user)
  end

  def index
    @users = User.all
  end

  private

  def authorized_user?
    current_user.try(:admin?) || current_user == @user
  end
end
