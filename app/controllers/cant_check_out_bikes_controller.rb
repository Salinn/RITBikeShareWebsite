class CantCheckOutBikesController < ApplicationController
  before_action :set_cant_check_out_bike, only: [:show, :edit, :update, :destroy]

  # GET /cant_check_out_bikes
  # GET /cant_check_out_bikes.json
  def index
    @cant_check_out_bikes = CantCheckOutBike.all
  end

  # GET /cant_check_out_bikes/1
  # GET /cant_check_out_bikes/1.json
  def show
  end

  # GET /cant_check_out_bikes/new
  def new
    @cant_check_out_bike = CantCheckOutBike.new
  end

  # GET /cant_check_out_bikes/1/edit
  def edit
  end

  # POST /cant_check_out_bikes
  # POST /cant_check_out_bikes.json
  def create
    @cant_check_out_bike = CantCheckOutBike.new(cant_check_out_bike_params)

    respond_to do |format|
      if @cant_check_out_bike.save
        format.html { redirect_to home_check_out_path, notice: 'Added one more to the count!' }
        format.json { render action: 'show', status: :created, location: @cant_check_out_bike }
      else
        format.html { render action: 'new' }
        format.json { render json: @cant_check_out_bike.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cant_check_out_bikes/1
  # PATCH/PUT /cant_check_out_bikes/1.json
  def update
    respond_to do |format|
      if @cant_check_out_bike.update(cant_check_out_bike_params)
        format.html { redirect_to @cant_check_out_bike, notice: 'Cant check out bike was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cant_check_out_bike.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cant_check_out_bikes/1
  # DELETE /cant_check_out_bikes/1.json
  def destroy
    @cant_check_out_bike.destroy
    respond_to do |format|
      format.html { redirect_to cant_check_out_bikes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cant_check_out_bike
      @cant_check_out_bike = CantCheckOutBike.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cant_check_out_bike_params
      params[:cant_check_out_bike]
    end
end
