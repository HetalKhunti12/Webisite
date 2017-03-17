class AddApproveToInquiry < ActiveRecord::Migration
  def change
  	add_column :inquiries, :approved, :boolean, default: :false
  end
end
