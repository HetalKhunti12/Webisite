class AddCountryWideToArtistProfile < ActiveRecord::Migration
  def change
    add_column :artist_profiles, :country_wide, :boolean, :default => false 
  end
end
