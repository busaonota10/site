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
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        render :show, status: :created, location: @feedback
      else
        render json: @feedback.errors, status: :unprocessable_entity
      end
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
      params.require(:feedback).permit(:content, :latitude, :longitude, :opinion, :user, :sent_at, :bus_id)
    end
end
