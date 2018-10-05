class VoteService

  attr_accessor :votable_id, :votable_type, :user, :vote_type

  def initialize( votable_id, votable_type, user, vote_type )
    self.votable_id = votable_id
    self.votable_type = votable_type
    self.user = user
    self.vote_type = vote_type
  end


  def upvote
    if already_downvote?
      remove_downvote
    elsif already_zero_state?
      update_vote(find_value, 1)
    else
      cast_vote(1)
    end
  end


  def downvote
    if already_upvote?
      remove_upvote
    elsif  already_zero_state?
      update_vote(find_value,-1)
    else
      cast_vote(-1)
    end
  end


  def remove_upvote
    if already_upvote?
      update_vote(find_value, 0)
    end
  end


  def remove_downvote
    if already_downvote?
      update_vote(find_value, 0)
    end
  end


  def already_upvote?
    user_already_voted? && find_value.vote_type == 1
  end


  def already_downvote?
     user_already_voted? && find_value.vote_type == -1
  end


  def already_zero_state?
    user_already_voted? && find_value.vote_type == 0
  end


  private

  def user_already_voted?
    Vote.where(user_id: user, voteable_id: votable_id, voteable_type: votable_type).exists?
  end


  def cast_vote(vote)
    @vote = Vote.create!(user_id: user, voteable_id: votable_id, vote_type: vote, voteable_type: votable_type)
    # @vote = votable.create!( user_id: user, vote_type: vote_type )
  end


  def update_vote(v, vote)
    v.update!(vote_type: vote)
  end


  def find_value
    v = Vote.find_by( user_id: user, voteable_id: votable_id, voteable_type: votable_type)
  end

end
