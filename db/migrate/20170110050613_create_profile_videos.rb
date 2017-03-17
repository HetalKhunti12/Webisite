class CreateProfileVideos < ActiveRecord::Migration
  def change
    create_table :profile_videos do |t|
      t.text :video
      t.string :title
      t.text :description
      t.integer :artist_profile_id

      t.timestamps null: false
    end
  end
end
