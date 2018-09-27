class AnswerController < ApplicationController

  before_action :logged_in_user, :session_timeout, only: [ :create]
  def create
    @answer = Answer.new(answer: params[:addAnswer][:answer], user_id: current_user.id,
                           question_id:params[:addAnswer][:ques_id])
    if @answer.save
      redirect_to question_path(params[:addAnswer][:ques_id])
    end
  end

  def acceptAnswer
    @answer = Answer.find(params[:id])
    @answer.update(status:1)
    redirect_to question_path(params[:question_id])
  end
end
