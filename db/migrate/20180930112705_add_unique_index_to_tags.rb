class AddUniqueIndexToTags < ActiveRecord::Migration[5.2]
  def change
    add_index :tags, :tag_name, unique: true
  end
end
