class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  #before_filter :validate_url_hack
  load_and_authorize_resource
  respond_to :html, :json
  def show
    @accessible = set_up_show
  end

  def create
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params) && user_params["registered"] == "1"
        update_user_more
        format.html { redirect_to user_home_path, notice: 'You have successfully registered!' }
      else
        format.html { redirect_to register_path, notice: 'You need to check the box to register your account' }
      end
    end
  end

  private
    def validate_url_hack
      # Check the params hash to see if the passed :id matches the current user's id
      # (note the .to_i on params[:id], as you are comparing against a Fixnum)
      unless params[:id].to_i == current_user.id
        # This line redirects the user to the previous action
        if user_signed_in? && current_user.admin?
          redirect_to admin_home_path, notice: "You do not have access to others individuals accounts."
        elsif user_signed_in?
          redirect_to user_home_path, notice: "You do not have access to this individuals accounts."
        else
          redirect_to root_path, notice: "You do not have access to thi individuals accountss."
        end
      end
    end

    def set_up_show
      @user = User.find(params[:id])

      bikes_checked_outs = CheckedOut.order(:bike_id).find_all_by_checkin_time(nil)
      bikes_checked_outs.each do |check_out|
        if check_out.user == @user
          @checked_out=CheckedOut.find_by_bike_id(check_out.bike_id)
        end
      end
      if @checked_out == nil
        @checked_out = "No bike is currently checked out to you"
      end
      @current_time = DateTime.current
      @transaction = Transaction.find_all_by_user_id(@user)
      accessible = { :user => @user, :check_out => @checked_out, :transaction => @transaction}
    end

    def update_user_more
      @user.email="#{@user.login}@rit.edu"
      @user.admin=false
      @user.save
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:registered)
    end
end

