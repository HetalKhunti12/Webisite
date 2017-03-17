class CreateArtistProfiles < ActiveRecord::Migration
  def change
    create_table :artist_profiles do |t|
    	t.string   :p_name
      t.integer  :p_profile_type
      t.decimal  :p_comission_percentage
      t.text     :production_requirements
      t.string   :purchase_number
      t.datetime :artist_booking_form_confirmed
      t.datetime :artist_booking_form_returned
      t.datetime :artist_invoice_received
      t.datetime :artist_invoice_paid
      t.datetime :purchase_order_sent
      t.boolean  :invoicing_with_gst
      t.text     :ryder
      t.string   :abn, :string
      t.string   :billing_name
      t.string   :billing_address
      t.decimal  :commission_adjustment
      t.string   :p_phone
      t.string   :p_bsb
      t.string   :p_account
      t.datetime :access_time
	    t.datetime :guest_arrival_time
	    t.datetime :sound_check_time
	    t.string   :stage_size
	    t.text     :load_in_directions
	    t.string   :p_email
	    t.string   :p_first_name
	    t.string   :p_last_name
	    t.string   :p_mobile
	    t.text     :msg
	    t.boolean  :old_invoicing, null: false, default: false
	    t.text     :access_time_note
    	t.text     :guest_arrival_time_note
    	t.text     :sound_check_time_note
      t.integer  :contact_id

      t.timestamps null: false
    end
  end
end
