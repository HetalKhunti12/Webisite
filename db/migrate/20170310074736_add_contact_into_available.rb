class AddContactIntoAvailable < ActiveRecord::Migration
  def change
  	add_column :availables, :contact_id, :integer
  end
end
