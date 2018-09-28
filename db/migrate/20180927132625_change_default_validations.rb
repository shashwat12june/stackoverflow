class ChangeDefaultValidations < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :first_name, :string, null:false
    change_column :users, :last_name, :string, null:false
    change_column :users, :email, :string, null:false, unique:true
    change_column :users, :phone_number, :string, null:false, unique:true

    add_index :users, :email
    add_index :users, :phone_number

    change_column :questions, :question, :string, null:false
    change_column :comments, :comment, :string, null:false
    change_column :answers, :answer, :string, null:false
  end
end
