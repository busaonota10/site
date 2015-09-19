class Feedback < ActiveRecord::Base
  belongs_to :bus
  belongs_to :user

  enum opinion: {good: 'good', bad: 'bad'}
end
