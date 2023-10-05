class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy, :like]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.create(post_params)

		if @post.save
			redirect_to post_path(@post)
		else
			render :new
		end
	end

	def show
		@ccomment = current_user.comments.new
	end

	def edit
	end

	def update
		# @post.update(image: params[:post][:image],
		# 	caption: params[:post][:caption])
		@post.update(post_params)

		if @post.save
			redirect_to post_path(@post)
		else
			render :edit
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path(@post)
	end

	def like
		current_user.likes.create(likeable: @post)
		redirect_back(fallback_location: root_path)
	end

	private
		def set_post
			@post = Post.find(params[:id])
		end

	def post_params
		params.require(:post).permit(:caption, photos: [])
	end
end