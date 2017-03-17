class AddcolumntoContact < ActiveRecord::Migration
  def change
  	add_column :contacts, :encrypted_password, :string
  end
end
