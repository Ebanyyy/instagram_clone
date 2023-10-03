class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(image: params[:post][:image])

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
		@post. update(image: params[:post][:image],
			caption: params[:post][:caption])

		if @post.save
			redirect_to post_path(@post)
		else
			render :edit
		end
	end

	private
		def set_post
			@post = Post.find(params[:id])
		end
end