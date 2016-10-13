# frozen_string_literal: true
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  private

  def authorized_user?
    current_user.try(:admin?) || current_user == @user
  end
end
