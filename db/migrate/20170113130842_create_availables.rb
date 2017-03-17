class CreateAvailables < ActiveRecord::Migration
  def change
    create_table :availables do |t|
      t.string :title
      t.datetime :start_at
      t.datetime :end_at
      t.string :allDay
      t.integer :contact_id

      t.timestamps null: false
    end
  end
end
