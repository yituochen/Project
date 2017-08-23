class ProfileController < ApplicationController

   
	def index

		@user = curren_user

		@articles = Article.where(user_id: @user.id) #find all atilce that user post 


		@comment = Comment.where(user_id: @user.id) 
	
		@AritlceComment = []
		
		
		
		@comment.each do |f|  # use loop to copy all artilce id to @user_aricle_id 

				@AritlceComment << f.article_id #put data to array each time

		end
		
		@commentarticles = Article.find(@AritlceComment)

	end


end
