class AddColumnToContact < ActiveRecord::Migration
  def change
  	add_column :contacts, :password, :string
  	add_column :contacts, :reset_password_token, :string
  	add_column :contacts, :reset_password_sent_at, :datetime
  	add_column :contacts, :remember_created_at, :datetime

  	add_column :contacts, :sign_in_count, :integer, default: 0, null: false
  	add_column :contacts, :current_sign_in_at, :datetime
  	add_column :contacts, :last_sign_in_at, :datetime
  	add_column :contacts, :current_sign_in_ip, :inet
  	add_column :contacts, :last_sign_in_ip, :inet
  	add_column :contacts, :website, :string
  	add_column :contacts, :email_format, :string
  	add_column :contacts, :address, :string

  	#add_index :contacts, :work_email,                unique: true
    add_index :contacts, :reset_password_token, unique: true
  end
end
