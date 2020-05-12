class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def authorize_user!
        if current_user.nil?
            flash.now[:error] = 'Please log in to continue!'
            redirect_to(events_path)
        end
    end

    helper_method :current_user, :signed_in?, :login
    helper_method :authorize_user!
end
