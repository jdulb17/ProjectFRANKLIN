class CreateKeychains < ActiveRecord::Migration
  def change
    create_table :keychains do |t|
      t.string :keyname
      t.string :keyval

      t.timestamps null: false
    end
  end
end
