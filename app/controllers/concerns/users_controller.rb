class UserController < ApplicationController
	def show
		@user = User.find(params[:id])
		current_user.following_users.create)followee_id: @user.id)
		redirect_to root_path
	end
end