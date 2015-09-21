class BusesController < ApplicationController
  before_action :set_bus, only: [:show, :edit, :update, :destroy]

  def index
    @buses = Bus.all
  end

  def show
  end

  def new
    @bus = Bus.new
  end

  def edit
  end

  def create
    @bus = Bus.new(bus_params)

    if @bus.save
      render :show, status: :created, location: @bus
    else
      render json: @bus.errors, status: :unprocessable_entity
    end
  end

  def update
    if @bus.update(bus_params)
      render :show, status: :ok, location: @bus
    else
      render json: @bus.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @bus.destroy
    head :no_content
  end

  private
    def set_bus
      @bus = Bus.find(params[:id])
    end

    def bus_params
      params.require(:bus).permit(:identification_number, :line, :company_id)
    end
end
