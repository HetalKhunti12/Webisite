class CreateContactPayments < ActiveRecord::Migration
  def change
    create_table :contact_payments do |t|
      t.string :payment_type
      t.datetime :payment_date
      t.integer :contact_id
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
