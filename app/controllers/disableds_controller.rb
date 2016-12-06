class DisabledsController < ApplicationController
  before_action :disabled_params, only: [:create]

  def new
    @disabled = Disabled.new
  end

  def create
    @disabled = Disabled.new(disabled_params)
    @disabled.professional_id = current_user.id
    if @disabled.save
      flash[:notice] = "Entry created!"
      redirect_to "/"
    else
      flash[:alert] = "Something went wrong..."
      render "new"
    end
  end

  def de

  private

  def disabled_params
    @user = current_user
    params[:disabled].permit(:name)
  end
end
