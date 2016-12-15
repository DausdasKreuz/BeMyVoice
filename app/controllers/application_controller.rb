class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

private

def find_disabled
  if params[:disabled_id]
    @disabled = Disabled.find_by(id: params[:disabled_id])
  else
    @disabled = Disabled.find_by(id: params[:id])
  end
end
