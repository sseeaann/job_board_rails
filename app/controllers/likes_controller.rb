class LikesController < ApplicationController
	def create
		@like = Like.new(like_params)
		if @like.save
			redirect_to :back
		else
			redirect_to '/'
		end
	end

	private
	def like_params
		params.require(:like).permit(:user_id, :posting_id)
	end
end
