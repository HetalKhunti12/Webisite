class AddCountryIdToArtistProfile < ActiveRecord::Migration
  def change
  	remove_column :artist_profiles, :country, :string
  	add_column :artist_profiles, :country_id, :integer
  end
end
