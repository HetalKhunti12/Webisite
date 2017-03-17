class ChangeCountryAndSateDatatype < ActiveRecord::Migration
  def change
  	change_column :artist_profiles, :country_id, :string
  	change_column :artist_profiles, :state_id, :string
  	rename_column :artist_profiles, :country_id, :country
  	rename_column :artist_profiles, :state_id, :state
  end
end
