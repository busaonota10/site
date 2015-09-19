class FeedbackCreator
  def initialize(message: nil, opinion: nil, busNumber: nil, lineNumber: nil)
    @message = message
    @opinion = opinion
    @busNumber = busNumber
    @lineNumber = lineNumber
  end

  def run
    @bus = find_bus_by_number(@busNumber)
    @line = find_line_by_number(@lineNumber)
    @feedback = create_feedback

    @feedback
  end

  private

  def find_bus_by_number
  end

  def find_line_by_number
  end

  def create_feedback

  end
end
