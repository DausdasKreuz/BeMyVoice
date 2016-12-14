class AgendasController < ApplicationController
  before_action :find_disabled, :find_guide

  def index
    @agendas = @disabled.agendas
  end
end
