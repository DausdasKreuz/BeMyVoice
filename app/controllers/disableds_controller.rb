class DisabledsController < ApplicationController
  before_action :disabled_params

  def new
    @disabled = Disabled.new
  end

  def create
    @disabled = Disabled.new(disabled_params)
    if @disabled.save
      flash[:notice] = "Entry created!"
      redirect_to current_user.profile
    else
      flash[:alert] = "Something went wrong..."
      render "new"
    end
  end

  private

  def disabled_params
    @user = current_user
    params[:disabled].permit(:name)
  end
end
