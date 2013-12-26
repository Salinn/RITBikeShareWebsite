class UserinfosController < ApplicationController
  before_action :set_userinfo, only: [:show, :edit, :update, :destroy]

  # GET /userinfos
  # GET /userinfos.json
  def index
    @userinfos = Userinfo.all
  end

  # GET /userinfos/1
  # GET /userinfos/1.json
  def show
  end

  # GET /userinfos/new
  def new
    @userinfo = Userinfo.new
  end

  # GET /userinfos/1/edit
  def edit
  end

  # POST /userinfos
  # POST /userinfos.json
  def create
    @userinfo = Userinfo.new(userinfo_params)

    respond_to do |format|
      if @userinfo.save
        format.html { redirect_to @userinfo, notice: 'Userinfo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @userinfo }
      else
        format.html { render action: 'new' }
        format.json { render json: @userinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userinfos/1
  # PATCH/PUT /userinfos/1.json
  def update
    respond_to do |format|
      if @userinfo.update(userinfo_params)
        format.html { redirect_to @userinfo, notice: 'Userinfo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @userinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userinfos/1
  # DELETE /userinfos/1.json
  def destroy
    @userinfo.destroy
    respond_to do |format|
      format.html { redirect_to userinfos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userinfo
      @userinfo = Userinfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def userinfo_params
      params.require(:userinfo).permit(:rit_email, :bike_checked_out, :admin)
    end
end
