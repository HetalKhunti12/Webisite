class AddPackageIdToContact < ActiveRecord::Migration
  def change
  	add_column :contacts, :package_id, :integer
  end
end
