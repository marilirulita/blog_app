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
end