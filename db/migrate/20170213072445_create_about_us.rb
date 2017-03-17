class CreateAboutUs < ActiveRecord::Migration
  def change
    create_table :about_us do |t|
      t.text :context
      t.attachment :about_us_image
      t.attachment :about_us_video

      t.timestamps null: false
    end
  end
end
