class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :answer
      t.string :question

      t.timestamps null: false
    end
  end
end
