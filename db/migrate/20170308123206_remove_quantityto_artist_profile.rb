class RemoveQuantitytoArtistProfile < ActiveRecord::Migration
  def change
  	remove_column :artist_profiles, :quantity, :integer
  	add_column :artist_profiles, :quantity, :integer, default: 1
  	add_column :inquiry_profiles, :access_time, :datetime
  	add_column :inquiry_profiles, :access_time_note, :text
  	add_column :inquiry_profiles, :sound_check_time, :datetime
  	add_column :inquiry_profiles, :sound_check_time_note, :text
  	add_column :inquiry_profiles, :guest_arrival_time, :datetime
  	add_column :inquiry_profiles, :guest_arrival_time_note, :text
  	add_column :inquiry_profiles, :stage_size, :string
  	add_column :inquiry_profiles, :load_in_directions, :text
  end
end
