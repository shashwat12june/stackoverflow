class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :questions
      t.string :status
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
