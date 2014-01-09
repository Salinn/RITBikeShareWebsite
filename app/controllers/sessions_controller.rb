class SessionsController < Devise::SessionsController

  def create
    super
    # get ldap permissions only on rit site instances
  end

  def registered
    registration_confirmation
    @user = User.find_by_id(current_user.id)
    @user.admin=false
    @user.email = @user.login+"@rit.edu"
    @user.save
  end

  def admin_home
    @user = current_user
    authorize! :admin_home
  end
end