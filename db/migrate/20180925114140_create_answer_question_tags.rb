class CreateAnswerQuestionTags < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_question_tags do |t|
      t.references :tag, foreign_key: true
      t.references :tagable, polymorphic: true

      t.timestamps
    end
  end
end
