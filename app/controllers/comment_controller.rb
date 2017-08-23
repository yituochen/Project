class CommentController < ApplicationController
    

	# def index
	# 	@comments = Comment.all
	# end

	# def show

	# end

	 def new
	 	@comment = Comment.new
	 end

	def create 

		@article = Article.find(params[:article_id])
		

		@comment = @article.comment.new(comment_params)  #get data from client and store in db
		
		@comment.user_id = curren_user.id  #set user id and store in db 

		if@comment.save

			redirect_to @article
		else

			redirect_to article_index_url
		end   

	end


	def edit
	end

	def show 

		@comment = Comment.find(params[:id])

		@CommentAuthor = User.find(@comment.user_id)

	end

	# dont know should let user edit or uplate their post 
	# def update

	# 	if @comment.update(comment_params)

	# 		redirect_to @article
	# 	else 
	# 		redirect_to article_index_url
	# 	end

	# end



	private 

	def comment_params
		params.require(:comment).permit(:text, :document)
	end

end
