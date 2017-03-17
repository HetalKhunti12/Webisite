class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :objectTitle
      t.string :objectLocation1
      t.string :objectLocation2
      t.string :objectCountry
      t.integer :objectPrimaryCategoryID
      t.integer :objectRootCategoryId
      t.string :objectDescription1
      t.text :objectDescription2
      t.text :objectKeywords
      t.text :objectPricing
      t.integer :objectEnabled
      t.datetime :dateLevelExpires
      t.integer :objectTypeID
      t.integer :objectStatus
      t.integer :objectApproved
      t.string :objectApproved
      t.integer :cotact_id

      t.timestamps null: false
    end
  end
end
