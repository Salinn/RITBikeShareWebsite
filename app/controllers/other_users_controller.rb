class OtherUsersController < ApplicationController
  before_action :set_other_user, only: [:show, :edit, :update, :destroy]

  # GET /other_users
  # GET /other_users.json
  def index
    @other_users = OtherUser.all
  end

  # GET /other_users/1
  # GET /other_users/1.json
  def show
  end

  # GET /other_users/new
  def new
    @other_user = OtherUser.new
  end

  # GET /other_users/1/edit
  def edit
  end

  # POST /other_users
  # POST /other_users.json
  def create
    @other_user = OtherUser.new(other_user_params)

    respond_to do |format|
      if @other_user.save
        format.html { redirect_to @other_user, notice: 'Other user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @other_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @other_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /other_users/1
  # PATCH/PUT /other_users/1.json
  def update
    respond_to do |format|
      if @other_user.update(other_user_params)
        format.html { redirect_to @other_user, notice: 'Other user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @other_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /other_users/1
  # DELETE /other_users/1.json
  def destroy
    @other_user.destroy
    respond_to do |format|
      format.html { redirect_to other_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_other_user
      @other_user = OtherUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def other_user_params
      params.require(:other_user).permit(:rit_user_id, :other_email)
    end
end
