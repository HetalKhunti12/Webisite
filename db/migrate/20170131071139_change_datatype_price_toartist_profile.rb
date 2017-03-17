class ChangeDatatypePriceToartistProfile < ActiveRecord::Migration
  def change
  	change_column :artist_profiles, :price, :text
  end
end
