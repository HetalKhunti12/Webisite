class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :context
      t.attachment :blog_image

      t.timestamps null: false
    end
  end
end
