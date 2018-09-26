class CommentController < ApplicationController
 before_action :logged_in_user, :session_timeout, only: [ :create]
  def create
    @comment = Comment.new(comment: params[:addComment][:comment], user_id: current_user.id,
                           commentable_type:params[:addComment][:commentable_type],
                           commentable_id:params[:addComment][:commentable_id])
    if @comment.save
      redirect_to question_path(params[:addComment][:ques_id])
    end
  end

end