class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to events_path
    else
      render :new
    end
  end

  def show
    @user = current_user
    @upcoming = @user.upcoming_events
    @previous = @user.previous_events
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
