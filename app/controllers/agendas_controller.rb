class AgendasController < ApplicationController
  before_action :find_disabled, :find_guide, :find_agenda, only: [:show]

  def show
    @boards = @agenda.boards
  end


  private
  def find_agenda
    @agenda = Agenda.find_by(id: params[:id])
  end
end
