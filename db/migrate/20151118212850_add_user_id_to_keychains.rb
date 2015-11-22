class AddUserIdToKeychains < ActiveRecord::Migration
  def change
    add_column :keychains, :user_id, :int
  end
end
