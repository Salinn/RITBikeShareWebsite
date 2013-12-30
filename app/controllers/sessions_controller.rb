class SessionsController < Devise::SessionsController

  def create
    super
    # get ldap permissions only on rit site instances
    if root_url.include? "rit.edu"
      user = User.find_by_id(current_user.id)
      fullname = Devise::LDAP::Adapter.get_ldap_entry(params[:user][:login])[:displayname].first
      user.update_attributes(:name => fullname)
    end
  end

  def admin_home
    @user = current_user
    authorize! :admin_home
  end
end