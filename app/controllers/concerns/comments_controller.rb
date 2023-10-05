class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@ccomment = current_user.comments.create(comment_params.merge(post_id: @post.id))

		if @ccomment.save
			redirect_to post_path(@post)
		else
			redirect_to root_path
		end
	end

	def comment_params
		params.require(:comment).permit(:comment)
	end
end