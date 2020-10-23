class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # @user = User.new(user_params)

    
    @user = User.find_by(:username => params[:user][:username]) # finds pre-existing user
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    elsif @user.valid?
      render :new # Handles the error case when the password is incorrect or empty
    else
     # Handles the case where the password is incorrect for user authentication.
      render :new
    end
  end

  def fb_create
    @user = User.find_or_create_by_facebook(auth)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    if current_user
      session.clear # .delete :user_id
      redirect_to root_url
    end
  end

  private
  def auth
    request.env['omniauth.auth']
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
