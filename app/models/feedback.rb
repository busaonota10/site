class Feedback < ActiveRecord::Base
  belongs_to :bus
  enum opinion: {good: 'good', bad: 'bad'}
end
