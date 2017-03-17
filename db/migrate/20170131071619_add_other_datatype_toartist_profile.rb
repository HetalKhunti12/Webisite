class AddOtherDatatypeToartistProfile < ActiveRecord::Migration
  def change
  	add_column :artist_profiles, :other_price, :decimal
  end
end
