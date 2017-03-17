class AddListingFieldToArtistProfile < ActiveRecord::Migration
  def change
  	add_column :artist_profiles, :short_description, :text
  	add_column :artist_profiles, :long_description, :text
  	add_column :artist_profiles, :keywords, :text
  	add_column :artist_profiles, :price, :decimal
  	add_column :artist_profiles, :approved, :boolean, default: false
  	add_column :artist_profiles, :published, :boolean, default: false
  end
end
