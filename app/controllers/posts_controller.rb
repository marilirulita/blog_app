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
    post = Post.new(params.require(:post).permit(:title, :text, :author_id))
    respond_to do |format|
      format.html do
        if post.save
          flash[:success] = "New post created!"
          redirect_to posts_url
        else
          flash.now[:error] = "Error: Post could not be saved!"
          render :new, locals: {post: post}
        end
      end
    end
  end
end
