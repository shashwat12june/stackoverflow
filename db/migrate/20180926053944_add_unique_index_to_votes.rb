class AddUniqueIndexToVotes < ActiveRecord::Migration[5.2]
  def change
    add_index :votes, [:user_id, :voteable_id, :voteable_type,], unique: true
  end
end
