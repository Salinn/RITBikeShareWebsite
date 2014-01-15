class StaticPagesController < ApplicationController
  def home
    authorize! :view, :home
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
  end

  def account
  end

  def quiz
  end

  def user_home
  end

  def admin_home
    authorize! :view, :admin_home
  end
end
