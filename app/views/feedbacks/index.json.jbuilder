json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :content, :latitude, :longitude, :opinion, :sent_at, :bus_id, :user_id
  json.url feedback_url(feedback, format: :json)
end
