class RemoveUserIdFromKeychains < ActiveRecord::Migration
  def change
    remove_column :keychains, :user_id, :int
  end
end
