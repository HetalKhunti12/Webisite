class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :comment
      t.integer :artist_profile_id

      t.timestamps null: false
    end
  end
end
