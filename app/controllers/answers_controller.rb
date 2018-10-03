class AnswersController < ApplicationController

  before_action :logged_in_user, only: [ :create, :accept_answer]


  def create
    @answer = Answer.new(answer: params[:addAnswer][:answer], user_id: current_user.id,
                         question_id:params[:addAnswer][:ques_id])
    if @answer.save
      redirect_to question_path(params[:addAnswer][:ques_id])
    else
      flash.notice = "Answer not saved"
      redirect_to question_path(params[:addAnswer][:ques_id])
    end
  end


  def accept_answer
    @answer = Answer.find(params[:id])
    if @answer.status=="accepted"
       @answer.update(status:1)
    else
       @answer.update(status:0)
    end
    redirect_to question_path(params[:question_id])
  end


  def edit
    @answer = Answer.find(params[:id])
   @question = Question.find(params[:question_id])
    if !(logged_in? && current_user.id==@answer.user_id)
      render plain: 'invalid access'
    end

  end


  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(answer: params[:answer][:answer])
      flash[:success] = "Answer updated"
      redirect_to question_path(params[:answer][:question_id])
    else
      render 'edit'
    end
  end


  def destroy
    @answer = Answer.find(params[:id])
    if @answer.destroy
      redirect_to question_path(params[:question_id])
    else
      render 'show'
    end
  end

end
