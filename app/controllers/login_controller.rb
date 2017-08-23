class LoginController < ApplicationController


	def index
	 	@users = User.all
	end

    def new
     	@user = User.new
	end

	# this method upload user information to database
	def create
		@user = User.new(user_params)

		if@user.save							 
			session[:user_id] = @user.id
			render :show      #if the user data save, it through to show page
		else
			render :new	  #if not, it go to index page 
		end
	end


	def show

		@user = User.find(params[:id])

	end

	def update

	end


	private 

	def user_params
		params.require(:user).permit(:Email , :Name , :password )
	end




end
