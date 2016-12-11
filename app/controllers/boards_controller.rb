class BoardsController < ApplicationController
  before_action :find_disabled, :find_guide, :find_agenda, :find_board, only: [:show]

  def show
    @pictograms = @board.pictograms
  end

  private
  def find_agenda
    @agenda = Agenda.find_by(id: params[:agenda_id])
  end

  def find_board
    @board = Board.find_by(id: params[:id])
  end

end
