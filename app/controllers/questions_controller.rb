class QuestionsController < ApplicationController
  before_action :logged_in_user, only: [ :add_question]

  def index
    @question = Question.paginate(page: params[:page])
  end

  def show
    @question = Question.find(params[:id])
  end

  def add_question
    users_question = Question.new(status:"new", user_id: current_user.id, question: params[:addQuestion][:questions])

    if users_question.save
      if !params[:addQuestion][:tags].nil?
         tag_service.add_tag
      end
      redirect_to home_path
    else
      flash[:info] = " Question not saved, Question might be duplicate."
      redirect_to home_path
    end
  end

  def tag_service
    TagService.new(get_params)
  end

  def edit
    @question = Question.find(params[:id])

    unless (logged_in? && current_user.id == @question.user_id)
      render plain: 'invalid access'
    end
  end

  def update
    question = Question.find(params[:id])
    if question.update_attributes(question: params[:question][:question])
      flash[:success] = "Question updated"
      redirect_to question_path(question.id)
    else
      render 'edit'
    end
  end

  def get_params
    @params = {users_question: @users_question,
               tag: params[:addQuestion][:tags]}
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy ? (redirect_to home_path) : (render 'show')
  end
end
