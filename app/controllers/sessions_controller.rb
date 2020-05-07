class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user
      session[:user_id] = @user.id
      redirect_to new_user_path
    else
      flash.now[:error] = 'That username does not exist, please try again'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    current_user = nil
    redirect_to new_user_path
  end
end
