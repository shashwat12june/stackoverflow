class AddVoteCountToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :vote_count, :integer
  end
end
