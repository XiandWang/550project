class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :following, :followers]
  def show
  	@user = User.find(params[:id])
    @likes = Like.where("user_id = ?", @user.id)
  end

  def index
  	@users = User.all.paginate(page: params[:page], :per_page => 10)
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
end
