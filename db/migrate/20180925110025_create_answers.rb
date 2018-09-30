class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :answers
      t.integer :status
      t.integer :vote_count
      t.references :questions, foreign_key: true
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
