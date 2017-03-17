class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :title
      t.attachment :banner
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
