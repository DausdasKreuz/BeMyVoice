class AgendasController < ApplicationController
  before_action :find_disabled,

  def index
    @agendas = @disabled.agendas
  end
end
