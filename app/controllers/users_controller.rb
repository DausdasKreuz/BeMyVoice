class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @disableds = Disabled.where(professional_id: current_user)
    render 'users/profile'
  end

  def edit_guide
    @guide
  end
end
