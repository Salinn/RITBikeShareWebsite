class RitUsersController < ApplicationController
  before_action :set_rit_user, only: [:show, :edit, :update, :destroy]

  # GET /rit_users
  # GET /rit_users.json
  def index
    @rit_users = RitUser.all
  end

  # GET /rit_users/1
  # GET /rit_users/1.json
  def show
  end

  # GET /rit_users/new
  def new
    @rit_user = RitUser.new
  end

  # GET /rit_users/1/edit
  def edit
  end

  # POST /rit_users
  # POST /rit_users.json
  def create
    @rit_user = RitUser.new(rit_user_params)

    respond_to do |format|
      if @rit_user.save
        format.html { redirect_to @rit_user, notice: 'Rit user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rit_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @rit_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rit_users/1
  # PATCH/PUT /rit_users/1.json
  def update
    respond_to do |format|
      if @rit_user.update(rit_user_params)
        format.html { redirect_to @rit_user, notice: 'Rit user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rit_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rit_users/1
  # DELETE /rit_users/1.json
  def destroy
    @rit_user.destroy
    respond_to do |format|
      format.html { redirect_to rit_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rit_user
      @rit_user = RitUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rit_user_params
      params.require(:rit_user).permit(:user_id, :rit_email, :admin)
    end
end
