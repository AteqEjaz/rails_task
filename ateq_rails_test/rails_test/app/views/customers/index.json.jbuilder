json.array!(@customers) do |customer|
  json.extract! customer, :id, :firstname, :lastname, :email
  json.url customer_url(customer, format: :json)
end
