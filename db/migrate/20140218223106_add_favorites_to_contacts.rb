class AddFavoritesToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :favorite, :boolean
    reversible do |dir|
      dir.up { Contact.update_all favorite: false }
    end
  end
end
