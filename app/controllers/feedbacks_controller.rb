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

  end

  def create
    @feedback = Feedback.new(feedback_params)

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

    def feedback_params
      params.require(:feedback).permit(:content, :latitude, :longitude, :opinion, :sent_at, :bus_id, :user_id)
    end
end
