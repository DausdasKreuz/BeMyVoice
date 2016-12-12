class DisabledsController < ApplicationController
  before_action :disabled_params, only: [:create]
  before_action :find_disabled, :find_guide, only: [:destroy, :edit, :show]

  def show
    items_by_row = 4
    @agendas = @disabled.agendas
    if @agendas.length % items_by_row == 0
      rows_number = @agendas.length / items_by_row
    else
      rows_number = @agendas.length / items_by_row + 1
    end

    @ordered_agendas = []
    for i in 0..rows_number
      row_agendas = []
      for p in 0..items_by_row - 1
        row_agendas.push(@agendas[p + items_by_row * i])
      end
      # binding.pry
      @ordered_agendas.push(row_agendas)
    end
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
end
