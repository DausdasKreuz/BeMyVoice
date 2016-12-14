class BoardsController < ApplicationController
  before_action :find_disabled, :find_agenda

  def index
    @boards = @agenda.boards
  end

  private
  def find_agenda
    @agenda = Agenda.find_by(id: params[:agenda_id])
  end
end
