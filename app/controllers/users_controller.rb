class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user) 
    else
      render :new
    end
  end

  # only shows gears created by USER
  def show
    @user = User.find_by(:id => params[:id])
    # binding.pry
    @gears = Gear.where(user_id: current_user.id) # find all Gear who has user_id = @user.id
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
