class AddColumnToProfileandService < ActiveRecord::Migration
  def change
  	drop_table :categories
  	add_column :artist_service_orders, :contact_id, :integer
  end
end
