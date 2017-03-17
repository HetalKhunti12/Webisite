class RrarrangefieldsToArtistProfiles < ActiveRecord::Migration
  def change
  	remove_column :artist_profiles, :p_name, :string
  	remove_column :artist_profiles, :p_comission_percentage, :numeric
  	remove_column :artist_profiles, :production_requirements, :text
  	remove_column :artist_profiles, :purchase_number, :string
  	remove_column :artist_profiles, :artist_booking_form_confirmed, :datetime
  	remove_column :artist_profiles, :artist_booking_form_returned, :datetime
  	remove_column :artist_profiles, :artist_invoice_received, :datetime
  	remove_column :artist_profiles, :artist_invoice_paid, :datetime
  	remove_column :artist_profiles, :purchase_order_sent, :datetime
  	remove_column :artist_profiles, :invoicing_with_gst, :boolean
  	remove_column :artist_profiles, :ryder, :text
  	remove_column :artist_profiles, :abn, :string
  	remove_column :artist_profiles, :string, :string
  	remove_column :artist_profiles, :billing_name, :string
  	remove_column :artist_profiles, :billing_address, :string
  	remove_column :artist_profiles, :p_phone, :string
  	remove_column :artist_profiles, :p_account, :string
  	remove_column :artist_profiles, :commission_adjustment, :numeric
  	remove_column :artist_profiles, :access_time, :datetime
  	remove_column :artist_profiles, :guest_arrival_time, :datetime
  	remove_column :artist_profiles, :sound_check_time, :datetime
    remove_column :artist_profiles, :stage_size, :string
  	remove_column :artist_profiles, :load_in_directions, :text
  	remove_column :artist_profiles, :p_email, :string
  	remove_column :artist_profiles, :p_first_name, :string
  	remove_column :artist_profiles, :p_last_name, :string
  	remove_column :artist_profiles, :p_mobile, :string
  	remove_column :artist_profiles, :msg, :text
  	remove_column :artist_profiles, :old_invoicing, :boolean
  	remove_column :artist_profiles, :access_time_note, :text
  	remove_column :artist_profiles, :guest_arrival_time_note, :text
  	remove_column :artist_profiles, :sound_check_time_note, :text
  	rename_column :artist_profiles, :location1, :state_id
  	change_column :artist_profiles, :state_id, 'integer USING CAST(state_id AS integer)'

  end
end
