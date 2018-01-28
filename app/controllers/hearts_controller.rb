class HeartsController < ApplicationController
	
	respond_to :js

	def heart
	  @user = current_user
	  @micropost = Micropost.find(params[:micropost_id])
	  @user.heart!(@micropost)
	end

	def unheart
	  @user = current_user
	  @heart = @user.hearts.find_by_micropost_id(params[:micropost_id])
	  @micropost = Micropost.find(params[:micropost_id])
	  @heart.destroy!
	end
end
