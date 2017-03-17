class CreateCategoryTable < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.string :name
    	t.text :description
    	t.attachment :image
    	t.string :url_path
    	t.string :ancestry

    	t.timestamps null: false
    end
    add_index :categories, :ancestry
  end
end
