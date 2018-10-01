class AddIndexUniqueToSessionModel < ActiveRecord::Migration[5.2]
  def change
    add_index :sessions, :authentication_token, unique: true
  end
end
