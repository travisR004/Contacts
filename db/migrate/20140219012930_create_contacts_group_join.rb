class CreateContactsGroupJoin < ActiveRecord::Migration
  def change
    create_table :contacts_group_joins do |t|
      t.integer :contact_group_id
      t.integer :contact_id
    end

    remove_column :contacts, :contact_group_id
  end
end
