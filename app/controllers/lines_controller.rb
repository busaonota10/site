class LinesController < ApplicationController
  before_action :set_line, only: [:show, :edit, :update, :destroy]

  def index
    @lines = Line.all
  end

  def show
  end

  def new
    @line = Line.new
  end

  def edit
  end

  def create
    @line = Line.new(line_params)

    if @line.save
      render :show, status: :created, location: @line
    else
      render json: @line.errors, status: :unprocessable_entity
    end
  end

  def update
    if @line.update(line_params)
      render :show, status: :ok, location: @line
    else
      render json: @line.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @line.destroy
    head :no_content
  end

  private
    def set_line
      @line = Line.find(params[:id])
    end

    def line_params
      params.require(:line).permit(:number, :company_id)
    end
end
