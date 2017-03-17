class AddColumntToContact < ActiveRecord::Migration
  def change
  	add_column :contacts, :confirmation_token, :string
  	add_column :contacts, :confirmed_at, :datetime
  	add_column :contacts, :confirmation_sent_at, :datetime
  	add_column :contacts, :unconfirmed_email, :string

  	Contact.update_all({:confirmed_at => DateTime.now, :confirmation_sent_at => DateTime.now})
  end
end
