class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user) # this works and redirects me to the show page of created user
      # but for gear it has an error and there exists no :id when creating? 
    else
      render :new
    end
  end

  def show
    @user = User.find_by(:id => params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
