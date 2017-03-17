class CreateAdminSocialMediaLinks < ActiveRecord::Migration
  def change
    create_table :social_media_links do |t|
      t.string :name
      t.string :link

      t.timestamps null: false
    end
  end
end
