json.extract! @feedback, :id, :content, :latitude, :longitude, :opinion, :user, :created_at, :updated_at
json.url feedback_url(@feedback)
json.bus do
  json.identification_number @bus.identification_number
  json.line @bus.line
end

json.sent_at do
  json.day I18n.localize(@feedback.sent_at, format: "%d")
  json.day_name I18n.localize(@feedback.sent_at, format: "%A")
end

json.image_maps image_maps(@feedback.latitude, @feedback.longitude, true)
