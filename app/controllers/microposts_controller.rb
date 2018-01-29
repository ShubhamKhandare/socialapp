class MicropostsController < ApplicationController
include Devise::Controllers::Helpers
	# before_action :logged_in_user, only: [:create , :destroy]
	before_action :correct_user,   only: :destroy
	before_action :logged_in? , only: [:show, :destroy]

	def create
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
			flash[:success] = "Micropost created"
			redirect_to root_url
		else
			@feed_items = []
			render 'pages/index'
		end
	end

	def destroy
		@micropost.destroy
		flash[:success] = "Post deleted"
		redirect_back(fallback_location: root_url)
	end

	def show
		@micropost = Micropost.find(params[:id])
		likers_ids = []
		@micropost.hearts.each do |heart|
			likers_ids << heart.user_id
		end
		@likers = User.where(id: likers_ids).paginate(page: params[:page])
	end

	private
	def micropost_params
		params.require(:micropost).permit(:content, :picture)
	end

	def correct_user
		@micropost = current_user.microposts.find_by(id: params[:id])
		redirect_to root_url if @micropost.nil?
	end

	def logged_in?
		if  !user_signed_in?
		 	 redirect_to new_user_session_url
		end	
	end

end
