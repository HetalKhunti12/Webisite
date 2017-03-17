class AddTravelInfoToArtistProfile < ActiveRecord::Migration
  def change
  	add_column :artist_profiles, :travel_information, :text
  end
end
