class UsersController < ApplicationController

	def show
	  @user = User.all	
	  @user = User.find_by(params[:id])
	  @posts = @user.posts
    end


 private

 def user_params
   params.require(:user).permit(:email)
 end
end
