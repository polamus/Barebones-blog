class SessionsController < Devise::SessionsController


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

def create

	  user = User.find_by(email: params[:session][:email].downcase)
		 if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:success] = "You have successfully logged in"
			redirect_to user_path(user)
		else
			flash.now[:danger] = "There was something wrong with your login information"
			render 'new'
		end
	end

	def destroy

		session[:user_id] = nil
		flash[:success] = "You have logged out"
		redirect_to root_path

	end



private
 def user_params
   params.require(:user).permit(:email)
 end
end