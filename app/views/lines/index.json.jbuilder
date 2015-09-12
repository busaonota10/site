json.array!(@lines) do |line|
  json.extract! line, :id, :number, :company_id
  json.url line_url(line, format: :json)
end
