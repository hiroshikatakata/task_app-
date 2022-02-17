class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_q

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction, :icon])
  end

  def after_sign_in_path_for(resource)
    sign_path(id: current_sign.id)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [user_attributes: [:name] ])
  end

  def set_q
    @q = Room.ransack(params[:q])
  end


end
