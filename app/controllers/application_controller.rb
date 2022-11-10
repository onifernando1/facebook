class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    @default_user = User.find_by(email:"onifernando1@gmail.com")


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :birthday])
  end


end
