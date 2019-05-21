class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?


 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :bio, :avatar])


    # params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
