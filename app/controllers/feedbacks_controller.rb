class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  def index
    @feedbacks = Feedback.all
  end

  def show
  end

  def new
    @feedback = Feedback.new
  end

  def edit
  end

  def create
    @feedback = Feedback.new(feedback_params.except(:bus))
    @feedback.bus = get_or_create_bus

    if @feedback.save
      render :show, status: :created, location: @feedback
    else
      render json: @feedback.errors, status: :unprocessable_entity
    end
  end

  def update
    if @feedback.update(feedback_params)
      render :show, status: :ok, location: @feedback
    else
      render json: @feedback.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @feedback.destroy
    head :no_content
  end

  private
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    def get_or_create_bus
      bus_params = feedback_params[:bus]
      Bus.where(bus_params).first_or_create do |bus|
        bus.identification_number = bus_params[:identification_number]
        bus.line = bus_params[:line]
      end
    end

    def feedback_params
      params.require(:feedback).permit(:content, :latitude, :longitude, :opinion, :user, :sent_at, bus: [:line, :identification_number])
    end
end
