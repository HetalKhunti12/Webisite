class AddColumnToInquiryProfiles < ActiveRecord::Migration
  def change
  	add_column :inquiry_profiles, :artist_service_order_id, :integer
  end
end
