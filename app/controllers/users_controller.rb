# frozen_string_literal: true
class UsersController < ApplicationController

  def delete
    sign_out_and_redirect(current_user)
  end

end
