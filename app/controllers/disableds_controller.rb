class DisabledsController < ApplicationController
  before_action :disabled_params, only: [:create]
  before_action :find_disabled, :find_guide, only: [:destroy, :edit, :show]

  def show
    @agendas = @disabled.agendas
  end

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

  def edit
    @guide = User.where(id: @disabled.guide_id)
  end

  def update
    if @disabled.update(disabled_params)
      flash[:notice] = "Entry updated!"
      redirect_to "root"
    else
      flash[:alert] = "Something went wrong..."
      render "edit"
    end
  end

  def destroy
    if disabled.destroy
      redirect_to "/"
    else
    end
  end

  private

  def disabled_params
    params.require(:disabled).permit(:name)
  end

  def find_disabled
    @user = current_user
    @disabled = Disabled.find(params[:id])
  end

  def find_guide
    if @disabled.guide_id
      @guide = User.where(id: @disabled.guide_id)
    end
  end
end
