class CreateBookingChanges < ActiveRecord::Migration
  def change
    create_table :booking_changes do |t|
      t.datetime :service_start
      t.datetime :service_end
      t.string :event_type
      t.string :venue_type
      t.string  :number_of_guests
      t.text :contact_person_on_day
      t.text  :contact_mobile_on_day
      t.string :venue_type
      t.string  :venue_name
      t.text :venue_address
      t.text  :venue_notes
      t.integer :booking_id
      t.integer :profile_order_id
      t.integer :service_order_id


      t.timestamps null: false
    end
  end
end
