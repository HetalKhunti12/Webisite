class CreateProfileImages < ActiveRecord::Migration
  def change
    create_table :profile_images do |t|
      t.attachment :image
      t.string :title
      t.text :description
      t.integer :artist_profile_id

      t.timestamps null: false
    end
  end
end
