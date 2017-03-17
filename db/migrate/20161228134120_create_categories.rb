class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :categoryName
      t.integer :categoryParentId
      t.text :categoryDescription
      t.integer :categoryChildren
      t.integer :categorySectionId
      t.integer :categoryDepth
      t.integer :categorySequence
      t.integer :categorySequenceAlpha
      t.text :categoryLineage
      t.string :url_path
      t.text :categoryIntroduction
      t.string :CategoryByline
      t.string :CategoryTitle

      t.timestamps null: false
    end
  end
end
