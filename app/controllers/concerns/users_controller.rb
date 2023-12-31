class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	# def follow
	# 	@user = User.find(params[:id])
	# 	current_user.following_users.create(followee_id: @user.id)
	# 	redirect_to root_path
	# end

	def follow
	  @user = User.find(params[:id])
	  current_user.followees << @user
	  redirect_back(fallback_location: user_path(@user))
	end

	def unfollow
	  @user = User.find(params[:id])
	  current_user.followed_users.find_by(followee_id: @user.id).destroy
	  redirect_back(fallback_location: user_path(@user))
	end
end