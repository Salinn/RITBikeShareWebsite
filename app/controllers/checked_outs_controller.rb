class CheckedOutsController < ApplicationController
  before_action :set_checked_out, only: [:show, :edit, :update, :destroy]

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
    @checked_out = CheckedOut.new(checked_out_params)

    respond_to do |format|
      if @checked_out.save
        format.html { redirect_to @checked_out, notice: 'Checked out was successfully created.' }
        format.json { render action: 'show', status: :created, location: @checked_out }
      else
        format.html { render action: 'new' }
        format.json { render json: @checked_out.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checked_outs/1
  # PATCH/PUT /checked_outs/1.json
  def update
    respond_to do |format|
      if @checked_out.update(checked_out_params)
        format.html { redirect_to @checked_out, notice: 'Checked out was successfully updated.' }
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def checked_out_params
      params.require(:checked_out).permit(:bike_user_id, :bike_id, :checkout_time, :checkin_time, :fixed, :problem)
    end
end
