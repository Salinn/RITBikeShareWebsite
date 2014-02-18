class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  def sign_in
  end

  def register
    @user = current_user
  end

  def account
  end

  def quiz
  end

  def user_home
  end

  def admin_home
  end

  def reports
    @bikes = Bike.all
  end
end
