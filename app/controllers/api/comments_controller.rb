class Api::CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.order(created_at: :desc)
    render json: @comments
  end

  def create
    @current_user = current_user
    @comment = @current_user.comments.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def comment_params
    params.require(:comment).permit(:text, :post_id, :author_id)
  end
end
