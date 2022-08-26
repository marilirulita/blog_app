class CommentsController < ApplicationController
  def create
    @current_user = current_user
    @comment = @current_user.comments.new(comment_params)

    if @comment.save
      flash[:success] = 'Comment saved successfully'
      redirect_to user_post_path(@comment.author_id, @comment.post_id)
    else
      flash.now[:error] = 'Error: Comment could not be saved'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @comment = @user.comments.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(@user.id, @comment.post_id), status: 303
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id, :author_id)
  end
end
