class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @current_user = current_user
    @comments = @post.comments.order(created_at: :desc)
  end

  def new
    @current_user = current_user
    @post = Post.new
  end

  def create
    @current_user = current_user
    @post = @current_user.posts.new(post_params)

    if @post.save
      flash[:success] = 'Post saved successfully'
      redirect_to user_posts_path
    else
      flash.now[:error] = 'Error: Post could not be saved'
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @comments = @post.comments.all
    if @comments.empty?
      @post.destroy
      redirect_to user_posts_path
    else
      flash.now[:error] = 'Error: You cannot delete a post with comments'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :author_id, :comments_counter, :likes_counter)
  end
end
