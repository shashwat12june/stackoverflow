class QuestionController < ApplicationController

  def index
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end


end
