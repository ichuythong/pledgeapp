json.array!(@admin_donators) do |admin_donator|
  json.extract! admin_donator, :id, :name, :pledge, :email, :phone, :message, :anonymous
  json.url admin_donator_url(admin_donator, format: :json)
end
