class RegistrationsController < Devise::RegistrationsController


  protected

  def after_sign_up_path_for(resource)
    welcome_path # Or :prefix_to_your_route
  end

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

  #def posts
   # @user = User.find(params[:id])
   # @posts = @user.posts
  #end

end