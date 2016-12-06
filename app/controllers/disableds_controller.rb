class DisabledsController < ApplicationController
  before_action
  def create
    @disabled = @user.disableds.create(disabled_params)
    redirect_to user.profile
  end

  private

  def disabled_params
    @user = current_user
    params[:disabled].permit(:name)
  end
end
