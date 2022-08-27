class Api::CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.order(created_at: :desc)
    render json: @comments
  end

  def create
    input_values = params.require(:comment).permit(:text)

    @comment = Comment.new(text: input_values[:text], author_id: current_user.id, post_id: params[:post_id])

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

end
