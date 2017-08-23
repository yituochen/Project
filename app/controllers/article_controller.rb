class ArticleController < ApplicationController

	def index
		@articles = Article.all
	end

	def new 
		@article = Article.new
	end

	
	def create 
		@user = curren_user

		@article = @user.article.new(article_params)	
		if @article.save	
		   #when article save
		   redirect_to article_index_path
		else
			#when article isnt save 

		   redirect_to new_article_path
		end

	end

	def show
		@article = Article.find(params[:id])
		
		@author = User.find(@article.user_id)

		#@CommentAuthor = User.find(@article.comment.user_id)
	end

	def destroy
	end
	
	private 

		def article_params
			
			params.require(:article).permit(:Title,:Constant, :document)
		end


end


