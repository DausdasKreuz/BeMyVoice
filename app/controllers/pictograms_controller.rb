class PictogramsController < ApplicationController
  before_action :find_disabled, :find_agenda, :find_board

  def index
    @pictograms = @board.pictograms
  end

  private
  def find_agenda
    @agenda = Agenda.find_by(id: params[:agenda_id])
  end

  def find_board
    @board = Board.find_by(id: params[:board_id])
  end
end
