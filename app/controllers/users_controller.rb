# frozen_string_literal: true
class UsersController < ApplicationController

  def index
  end

  def show
  end

  def delete
    sign_out_and_redirect(current_user)
  end

end
