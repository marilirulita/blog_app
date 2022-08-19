class CommentsController < ApplicationController
  def new
    @current_user = current_user
    @comment = Comment.new
    @post_id = params[:post_id]
  end

  def create
    @current_user = current_user
    @comment = @current_user.comments.new(comment_params)

    if @comment.save
      flash[:success] = "Comment saved successfully"
      redirect_to user_post_path(@comment.author_id, @comment.post_id)
    else
      flash.now[:error] = "Error: Comment could not be saved"
      render "new"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id, :author_id)
  end
end
