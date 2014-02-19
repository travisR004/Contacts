class CreateContact < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :user_id, null: false
    end

    add_index :contacts, :email, unique: true
  end
end
