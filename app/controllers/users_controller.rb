class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :configure_permitted_parameters, if: :devise_controller?

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Your details where successfully updated' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # def account_update_params
  #     params.require(:user).permit(:username, :password, :password_confirmation, :current_password, :bio, :avatar)
  # end

  def user_params
    params.require(:user).permit(:avatar, :username, :email, :password, :password_confirmation, :current_password, :bio)
  end

end
