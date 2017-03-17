class AddBandDetailToArtistProfile < ActiveRecord::Migration
  def change
  	add_column :artist_profiles, :access_time, :datetime
  	add_column :artist_profiles, :access_time_note, :text
  	add_column :artist_profiles, :sound_check_time, :datetime
  	add_column :artist_profiles, :sound_check_time_note, :text
  	add_column :artist_profiles, :guest_arrival_time, :datetime
  	add_column :artist_profiles, :guest_arrival_time_note, :text
  	add_column :artist_profiles, :stage_size, :string
  	add_column :artist_profiles, :load_in_directions, :text
  	add_column :artist_profiles, :quantity, :integer
  end
end
