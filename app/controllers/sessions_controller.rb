class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user
      session[:user_id] = @user.id
      redirect_to events_path
    else
      flash.now[:error] = 'Invalid username, please try again'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    current_user = nil
    redirect_to login_path
  end
end
