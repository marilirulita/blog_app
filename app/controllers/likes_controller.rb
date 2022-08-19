class LikesController < ApplicationController
  def create
    @current_user = current_user
    @like = @current_user.likes.new(likes_params)

    if @like.save
      flash[:success] = "Like saved successfully"
      redirect_to user_post_path(@like.author_id, @like.post_id)
    else
      flash.now[:error] = "Error: Post could not be saved"
      render "new"
    end
  end

  private

  def likes_params
    params.require(:like).permit(:post_id, :author_id)
  end
end
