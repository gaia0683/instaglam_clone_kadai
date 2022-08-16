class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :set_user,only: [:edit, :update,:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(user.id)
    else
      render :edit
    end
  end

  def show
  end

  private


  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_picture, :user_picture_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
