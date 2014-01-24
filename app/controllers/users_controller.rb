class UsersController < ApplicationController
  before_filter :validate_url_hack
  respond_to :html, :json
  def show
    @user = User.find(params[:id])
    @rented = @user.checked_out
  end

  def create
  end

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
end
