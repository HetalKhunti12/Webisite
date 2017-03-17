class AddColumnToCategory < ActiveRecord::Migration
  def change
  	add_column :categories, :meta_decription, :text
  end
end
