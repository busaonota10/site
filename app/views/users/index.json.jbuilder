json.array!(@users) do |user|
  json.extract! user, :id, :phone
  json.url user_url(user, format: :json)
end
