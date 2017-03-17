class AddPaymentIdToContactPayment < ActiveRecord::Migration
  def change
  	add_column :contact_payments, :payment_id, :string
  end
end
