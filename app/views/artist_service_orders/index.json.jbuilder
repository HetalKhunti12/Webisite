json.array!(@service_orders) do |service_order|
  json.extract! service_order, :id, :service_option_id, :description, :service_start, :service_duration, :so_title, :so_description, :so_price
  json.url service_order_url(service_order, format: :json)
end
