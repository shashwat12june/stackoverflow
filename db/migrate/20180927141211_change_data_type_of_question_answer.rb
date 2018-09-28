class ChangeDataTypeOfQuestionAnswer < ActiveRecord::Migration[5.2]
  def change
    change_column :questions, :question, :text, null:false
    change_column :answers, :answer, :text, null:false
    change_column :comments, :comment, :text, null:false
  end
end
