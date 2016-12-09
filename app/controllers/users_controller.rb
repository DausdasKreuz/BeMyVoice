class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
    @disableds = Disabled.where(professional_id: @user.id)
    render 'users/profile'
  end

  def edit_guide
    binding.pry
    @guide
  end
end
