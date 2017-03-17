class AddProfileIdToCard < ActiveRecord::Migration
  def change
  	add_column :cards, :profile_id, :string
  end
end
