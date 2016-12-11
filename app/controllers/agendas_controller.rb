class AgendasController < ApplicationController
  before_action :find_agenda, :find_guide, :find_disabled, only: [:show]

  def show
    @boards = @agenda.boards
    binding.pry
  end


  private
  def find_agenda
    @agenda = Agenda.find_by(id: params[:id])
  end

  def find_disabled
    @disabled = Disabled.find_by(id: params[:disabled_id])
  end

  def find_guide
    if User.find_by(id: @agenda.disabled.guide_id)
      @guide = User.find_by(id: @agenda.disabled.guide_id)
    end
  end

end
