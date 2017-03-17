class AddCategoryIdToArtistProfile < ActiveRecord::Migration
  def change
  	add_column :artist_profiles, :category_id, :integer
  end
end
