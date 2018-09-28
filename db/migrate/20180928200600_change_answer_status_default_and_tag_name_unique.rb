class ChangeAnswerStatusDefaultAndTagNameUnique < ActiveRecord::Migration[5.2]
  def change
    change_column :answers, :status, :integer, :default => 1
    change_column :tags, :tag_name, :string, unique:true
  end
end
