class AddSlugToArtistProfile < ActiveRecord::Migration
  def change
    add_column :artist_profiles, :slug, :string
  end
end
