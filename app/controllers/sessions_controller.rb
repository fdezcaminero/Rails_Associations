class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user
      session[:user_id] = @user.id
      redirect_to events_path
      flash.notice = 'Successfully Logged In'
    else
      flash.now[:error] = 'Invalid username, please try again'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
