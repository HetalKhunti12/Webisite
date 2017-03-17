class AddColumnToCard < ActiveRecord::Migration
  def change
  	add_column :cards, :contact_payment_id, :integer
  end
end
