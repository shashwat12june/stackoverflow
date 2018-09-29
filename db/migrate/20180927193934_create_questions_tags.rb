class CreateQuestionsTags < ActiveRecord::Migration[5.2]
  def change
    create_table :questions_tags do |t|
      t.references :question, foreign_key: true
      t.references :tag, foreign_key: true

    end
  end
end
