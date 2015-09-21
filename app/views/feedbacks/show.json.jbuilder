json.extract! @feedback, :id, :content, :latitude, :longitude, :opinion, :user, :sent_at, :created_at, :updated_at
json.url feedback_url(@feedback)
json.bus do
  json.identification_number @bus.identification_number
  json.line @bus.line
end
