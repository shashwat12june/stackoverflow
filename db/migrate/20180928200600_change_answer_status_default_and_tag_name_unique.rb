class ChangeAnswerStatusDefaultAndTagNameUnique < ActiveRecord::Migration[5.2]
  def up
    change_column :answers, :status, :integer, :default => 1
    change_column :tags, :tag_name, :string, unique:true
  end

  def down
    change_column :answers, :status, :integer, :default => 0
    change_column :tags, :tag_name, :string, unique:true
  end
end
