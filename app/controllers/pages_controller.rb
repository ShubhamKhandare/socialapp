class PagesController < ApplicationController
	# before_action :force_json ,only: :search
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

	# def autocomplete
	# 	@users 		= User.ransack(name_cont: params[:q]).result(distinct: true).limit(5)
	# 	@microposts = Micropost.ransack(content_cont: params[:q]).result(distinct: true).limit(5)
	# end

	def search
		@users 		= User.ransack(name_cont: params[:q]).result(distinct: true)
		@microposts = Micropost.ransack(content_cont: params[:q]).result(distinct: true)

		respond_to do |format|
			format.html {
				redirect_to root_path
				flash[:error] = "No results for provided search"
			}
			format.json {
				@users = @users.limit(5)
				@microposts = @microposts.limit(5)
			}
		end
	end

	# def test
	#   value = params[:val]
	#   binding.pry
	#   render  json:{
	#       html: "<h1>error</h1>"
	#   }, status: 404
	# end

	# def force_json
	# 	request.format = :json
	# end
end