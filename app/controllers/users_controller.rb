class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    if User.find(current_user).role == 'professional'
      @disableds = Disabled.where(professional_id: current_user)
      # render 'users/profile'
    else
      @disabled = current_user.guided_disabled
      redirect_to disabled_agendas_path(@disabled)
    end
  end
end
