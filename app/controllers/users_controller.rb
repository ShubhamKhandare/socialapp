class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page])
    # all
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url 
  end
end
