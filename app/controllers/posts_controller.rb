class PostsController < ApplicationController
  def index
    puts params
   # @author = User.find(comment.author_id).name
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user.id).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end
end
