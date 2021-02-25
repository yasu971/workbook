class CommentsController < ApplicationController
  def create
    if comment = Comment.create(comment_params)
    redirect_to question_path "#{comment.question.id}"
    else
      render :show
  end
end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, question_id: params[:question_id])
  end
end
