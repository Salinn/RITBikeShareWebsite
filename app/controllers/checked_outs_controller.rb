class CheckedOutsController < ApplicationController
  before_action :set_checked_out, only: [:show, :edit, :update, :destroy]
  #before_save :find_user_with_email

  # GET /checked_outs
  # GET /checked_outs.json
  def index
    @checked_outs = CheckedOut.all
  end

  # GET /checked_outs/1
  # GET /checked_outs/1.json
  def show
  end

  # GET /checked_outs/new
  def new
    @checked_out = CheckedOut.new
  end

  # GET /checked_outs/1/edit
  def edit
  end

  # POST /checked_outs
  # POST /checked_outs.json
  def create
    create_checkout_values

    respond_to do |format|
      if @checked_out.save
        create_bike_values
        format.html { redirect_to home_check_out_path, notice: "The bike was successfully checked out by #{@checked_out.user.email}." }
        format.json { render action: 'show', status: :created, location: @checked_out }
      else
        format.html { redirect_to home_check_out_path, :flash => @checked_out.errors }
        format.json { render json: @checked_out.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checked_outs/1
  # PATCH/PUT /checked_outs/1.json
  def update
    @checked_out.checkin_time=DateTime.current
    respond_to do |format|
      if @checked_out.update(checked_out_params)

        format.html { redirect_to home_check_out_path, notice: 'The bike was successfully checked in.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @checked_out.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checked_outs/1
  # DELETE /checked_outs/1.json
  def destroy
    @checked_out.destroy
    respond_to do |format|
      format.html { redirect_to checked_outs_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_checked_out
    @checked_out = CheckedOut.find(params[:id])
  end

  def create_checkout_values
    @checked_out = CheckedOut.new
    @checked_out.bike_id=checked_out_params[:bike_id]
    @checked_out.user=User.find_by_login(checked_out_params[:user])
    @checked_out.checkout_time=DateTime.current
  end

  def create_bike_values
    @bike = Bike.find_by_bike_id(@checked_out.bike_id)
    @bike.checked_out=true
    @bike.save
  end

  def update_bike_values
    @bike = Bike.find_by_bike_id(@checked_out.bike_id)
    @bike.checked_out=false
    if @checked_out.fixed
      @bike.problem_description = @checked_out.problem
      @bike.need_repair = @checked_out.fixed
    end
    @bike.save
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def checked_out_params
    params.require(:checked_out).permit(:user, :bike_id, :checkout_time, :checkin_time, :fixed, :problem)
  end
end