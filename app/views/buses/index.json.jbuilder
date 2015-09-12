json.array!(@buses) do |bus|
  json.extract! bus, :id, :identification_number, :line_id
  json.url bus_url(bus, format: :json)
end
