class CreateCommunications < ActiveRecord::Migration
  def change
    create_table :communications do |t|
      t.string :subject
      t.text :body
      t.integer :sender_id
      t.integer :reciever_id
      t.integer :contact_id

      t.timestamps null: false
    end
  end
end
