class AddContactIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :contact_id, :integer
  end
end
