class VotesController < ApplicationController
  before_action :logged_in_user, only: [ :create, :index]

  def index

  end


  def create

    @votable_id = params[:voteable_id],
    @vote_type = params[:vote_type]
    @user_id = current_user.id
    @votable_type = params[:voteable_type]

    if (params[:vote_type]=='1')
      upvote
      redirect_to question_path(params[:question_id])
    elsif (params[:vote_type]=='-1')
      downvote
      redirect_to question_path(params[:question_id])
    end
  end


  def vote_service
     VoteService.new( @votable_id, @votable_type, @user_id, @vote_type )
  end


  def upvote
    if vote_service.already_upvote?
      flash.notice = "already upvoted"
    else
      vote_service.upvote
      flash.notice = "upvoted successfully"
    end
  end


  def downvote
    if vote_service.already_downvote?
      flash.notice = "already downvoted"
    else
      vote_service.downvote
      flash.notice = "downvoted successfully"
    end
  end


  def getParams
    @params = {vote_type: params[:vote_type], user_id: current_user.id,
               voteable_id: params[:voteable_id], voteable_type: params[:voteable_type]}
  end

end
