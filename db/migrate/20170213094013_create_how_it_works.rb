class CreateHowItWorks < ActiveRecord::Migration
  def change
    create_table :how_it_works do |t|
      t.text :context
      t.attachment :how_it_works_image
      t.attachment :how_it_works_video

      t.timestamps null: false
    end
  end
end
