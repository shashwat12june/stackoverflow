class ChangePhoneNumberTypeInUser < ActiveRecord::Migration[5.2]
    def self.up
      change_column :users, :phone_number, :string
    end

    def self.down
      change_column :users, :phone_number, :bigint
    end

end
