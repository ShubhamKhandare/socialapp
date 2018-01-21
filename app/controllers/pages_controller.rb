class PagesController < ApplicationController
	def index
	  	if user_signed_in?
	  		@micropost = current_user.microposts.build
	  		@feed_items = current_user.feed.paginate(page: params[:page])
	  	end
	end

	def help
	end

	def about
	end

	def contact
	  	
	end
end