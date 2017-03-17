class Renamecolumn < ActiveRecord::Migration
  def change
  	rename_column :listings, :cotact_id, :contact_id
  end
end
