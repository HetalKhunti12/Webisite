class DropTable < ActiveRecord::Migration
  def change
  	drop_table :countries
  	drop_table :states
  end
end
