class SessionsController < ApplicationController

 	def new

 	end



 	def create
 		@user = User.find_by_Email(params[:session][:Email]) #use find_by to find if it is log in 
 		if @user && @user.authenticate(params[:session][:password_digest])  #gem 'bcrypt', '~> 3.1.7' need this gem to use authod 

 		    session[:user_id] = @user.id
 			redirect_to  profile_index_url
 		
 		else 
 			flash[:error] = "Invalid email or Password"
 			#format.html{redirect_to :action => 'longins'}
 			redirect_to  new_session_url

 		end
 	end

 	def destroy

 		@user = curren_user;

        session[:user_id] = nil  		

        redirect_to root_path
 	end


end
