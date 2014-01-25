class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_filter :validate_url_hack
  respond_to :html, :json
  def show
    @user = User.find(params[:id])
    @rented = @user.checked_out
  end

  def create
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        update_user_more
        format.html { redirect_to user_home_path, notice: 'You have successfully registered!' }
      else
        format.html { redirect_to user_home_path, notice: 'Something went wrong. Please send an email to sgpres@rit.edu' }
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
