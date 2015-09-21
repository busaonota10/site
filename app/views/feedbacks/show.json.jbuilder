json.extract! @feedback, :id, :content, :latitude, :longitude, :opinion, :user, :sent_at, :bus_id, :created_at, :updated_at
json.url feedback_url(@feedback)
