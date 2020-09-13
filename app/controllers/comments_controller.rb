class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/items/#{comment.item.id}"
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    if comment.destroy
      redirect_to item_path(comment.item_id)
    else
      render root_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
