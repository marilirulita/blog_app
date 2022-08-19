class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc)
  end

  def new
    @current_user = current_user
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: post} }
    end
  end

  def create
  end
end
