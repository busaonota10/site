class Feedback < ActiveRecord::Base
  belongs_to :bus
  belongs_to :user
end
