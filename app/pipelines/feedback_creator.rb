class FeedbackCreator
  def initialize(content: nil, opinion: nil, bus: nil)
    @content = content
    @opinion = opinion
    @bus = bus
  end

  def run
    create_feedback
  end

  private

  def get_or_create_bus
    identification_number = @bus["identification_number"]
    line = @bus["line"]

    query = {
      identification_number: identification_number,
      line: line
    }

    Bus.where(query).first_or_create do |bus|
      bus.identification_number = identification_number
      bus.line = line
    end
  end

  def create_feedback
    Feedback.create(
      bus: get_or_create_bus,
      content: @content,
      opinion: @opinion
    )
  end
end
