class PostingsController < ApplicationController
  before_filter :authorize
  
  def index
  	@posting = Posting.new
  	@postings = Posting.all.order(created_at: :desc)
  end

  def create
  	@posting = Posting.new(posting_params)
  	if @posting.save
  		redirect_to :back
  	else
  		@postings = Posting.all.order(created_at: :desc)
  		render '/postings/index'
  	end
  end

  def destroy
  	@posting = Posting.find(params[:id])
  	@posting.destroy
  	redirect_to :back
  end

  private
  def posting_params
  	params.require(:posting).permit(:title, :description, :user_id)
  end
end
