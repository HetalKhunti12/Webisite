class RemoveColumnArtistProfile < ActiveRecord::Migration
  def change
  	add_column :artist_profiles, :title, :string
  	add_column :artist_profiles, :country, :string
  	add_column :artist_profiles, :location1, :string
  	add_column :artist_profiles, :location2, :string
  end
end