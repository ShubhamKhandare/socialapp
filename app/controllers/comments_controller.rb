class CommentsController < ApplicationController
	before_action :logged_in?
	before_action :authenticate_user!
	before_action :find_commentable, only: [:create]
	before_action :correct_user , only: [ :destroy]
	
	def create
		@comment = @commentable.comments.new comment_params
		if @comment.save
			redirect_back fallback_location: root_path, notice: "Comment Posted successfully"
		else
			redirect_back fallback_location: root_path, notice: "Something went wrong"
		end
	end

	def destroy
		@comment .destroy
		flash[:success] = "Comment deleted"
		redirect_back(fallback_location: root_url)
	end

private
	def comment_params
		params[:comment][:user_id] = current_user.id
		params.require(:comment).permit(:body, :user_id)
	end
	def find_commentable
		@commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
		@commentable = Micropost.find_by_id(params[:micropost_id]) if params[:micropost_id]
	end

	def correct_user
		@comment = current_user.comments.find_by_id(params[:id])
		redirect_back fallback_location: root_url if @comment.nil?
	end
end
