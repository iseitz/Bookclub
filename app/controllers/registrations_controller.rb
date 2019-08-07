# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  before_action :sign_up_params, :account_update_params, only: [:update], if: :devise_controller?

  def edit
    super
  end

  def update
    super
  end

  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :bio)
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password, :bio, :avatar)
  end
end
