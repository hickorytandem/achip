class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:edit, :update, :show]
  def mentor
  end

  def mentee
  end

  def show
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    @user.update(user_params)
    authorize @user
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :name, :bio, :speciality)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
