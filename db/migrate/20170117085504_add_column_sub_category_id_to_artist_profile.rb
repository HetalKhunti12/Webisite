class AddColumnSubCategoryIdToArtistProfile < ActiveRecord::Migration
  def change
  	add_column :artist_profiles, :sub_category_id, :integer
  end
end
