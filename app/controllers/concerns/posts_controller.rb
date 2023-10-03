class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)

		if @post.save
			redirect_to post_path(@post)
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		# @post.update(image: params[:post][:image],
		# 	caption: params[:post][:caption])
		@post.update(post_params.merge(image: params[:post][:image]))

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

	private
		def set_post
			@post = Post.find(params[:id])
		end

	def post_params
		params.require(:post).permit(:image, :caption, photos: [])
	end
end