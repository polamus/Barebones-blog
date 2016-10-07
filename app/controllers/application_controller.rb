class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_action :authenticate_user!, except: [:index, :home]

  helper_method :current_user, :signed_in?
 

  	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end

	def signed_in?
		!!current_user
	end

	def require_user
		if !signed_in?
		flash[:danger] = "You must be logged in to perform that action"
		redirect_to root_path
	    end
    end


end

