class ChangeAnswerDefaultStatusAndVoteCount < ActiveRecord::Migration[5.2]
  def change
    change_column :answers, :status, :integer, :default => 0
    change_column :answers, :vote_count, :integer, :default => 0
  end
end
