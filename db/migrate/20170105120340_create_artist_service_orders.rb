class CreateArtistServiceOrders < ActiveRecord::Migration
  def change
    create_table :artist_service_orders do |t|
    	t.text :description
      t.datetime :service_start
      t.string :service_duration
      t.string :so_summary
      t.text :so_description
      t.integer :customer_price
      t.decimal :artist_fee
      t.boolean :fee_inc_gst
      t.boolean :price_inc_gst
    	t.decimal :total_customer_price
    	t.decimal :total_artist_fee
    	t.datetime :service_end
    	t.string :total_performance_duration
    	t.string :callout_duration
      t.decimal :new_artist_fee_cents
	    t.decimal  :gross_commission_percent
	    t.decimal  :apply_rounding
	    t.decimal  :artist_fee_rounded
	    t.boolean  :accommodation_req
	  	t.boolean  :travel_req
	  	t.boolean  :ground_transfers_req
	  	t.boolean  :meals_req
	  	t.boolean  :artist_equipment_req
	  	t.boolean  :artist_equipment_conf
	  	t.boolean  :meals_conf
	  	t.boolean  :ground_transfers_conf
	  	t.boolean  :travel_conf
	  	t.boolean :accommodation_conf
	  	t.string :event_type
	  	t.string  :number_of_guests
	  	t.string :contact_person_on_day
	  	t.string  :contact_mobile_on_day
	  	t.string :venue_type
	  	t.string  :venue_name
	  	t.text :venue_address
	  	t.text  :venue_notes
	  	t.string :event_type_other
	  	t.string :venue_type_other
	  	t.integer :artist_profile_id
      
      t.timestamps null: false
    end
  end
end
