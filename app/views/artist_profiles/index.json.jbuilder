json.array!(@profile_orders) do |profile_order|
  json.extract! profile_order, :id, :booking_id, :profile_id, :p_name, :p_profile_type, :p_comission_percentage, :p_special_comments, :purchase_number, :artist_booking_form_sent, :artist_booking_form_confirmed, :artist_booking_form_returned, :artist_invoice_received, :artist_invoice_paid, :purchase_order_sent
  json.url profile_order_url(profile_order, format: :json)
end
