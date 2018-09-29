class Vote_service

    def initialize(params)
      @vote_type = params[:vote_type]
      @voteable_id = params[:voteable_id]
      @voteable_type = params[:voteable_type]
      @user_id = params[:user_id]
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
      if user_exist? && find_value.vote_type == 1
        return true
      else
        return false
      end
    end


    def already_downvote?
      if user_exist? && find_value.vote_type == -1
        return true
      else
        return false
      end
    end


    def already_zero_state?
      if user_exist? && find_value.vote_type == 0
        return true
      else
        return false
      end
    end


    private

    def user_exist?
      if Vote.exists?(user_id: @user_id, voteable_id: @voteable_id, voteable_type: @voteable_type)
        return true
      else
        return false
      end
    end


    def cast_vote(vote)
      @vote = Vote.new(user_id: @user_id, voteable_id: @voteable_id, vote_type: vote, voteable_type: @voteable_type)
      @vote.save!
    end


    def update_vote(v, vote)
      v.update!(vote_type: vote)
    end


    def find_value
      v = Vote.where(user_id: @user_id, voteable_id: @voteable_id, voteable_type: @voteable_type).first
    end

end