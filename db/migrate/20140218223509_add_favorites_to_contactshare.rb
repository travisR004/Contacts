class AddFavoritesToContactshare < ActiveRecord::Migration
  def change
    add_column :contact_shares, :favorite, :boolean
    reversible do |dir|
      dir.up { ContactShare.update_all favorite: false }
    end
  end
end
