class Api::PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc)
    render json: { posts: }, status: :ok
  end
end 