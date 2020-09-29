class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(:username => params[:user][:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def fb_create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
 
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    if current_user
      session.delete :user_id
      redirect_to root_url
    end
  end

  private
  def auth
    request.env['omniauth.auth']
  end
end
