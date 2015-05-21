class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to '/'
		else
			render '/users/new'
		end
	end

	def show
		@user = User.find(params[:id])
		@posting_count = @user.postings.count
		@liked_postings = Posting.where(id: Like.where(user_id: @user.id).select(:posting_id))
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :alias, :email, :password, :password_confirmation)
	end
end
