class RegistrationsController < Devise::RegistrationsController

   # before_action :sign_up_params, :account_upddate_params, if: :devise_controller?

  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def account_update_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password, :bio)
  end


end
