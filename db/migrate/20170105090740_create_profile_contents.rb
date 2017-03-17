class CreateProfileContents < ActiveRecord::Migration
  def change
    create_table :profile_contents do |t|
    	t.attachment :image
    	t.attachment :audio
    	t.text :video
    	t.integer    :artist_profile_id
     
      t.timestamps null: false
    end
  end
end
