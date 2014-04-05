class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user.admin
      home_check_out_path
    else
      current_user #user_home_path
    end
  end

  def admin_home
    @user = current_user
    authorize! :admin_home_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      flash[:error] = "Access Denied"
      redirect_to user_home_url, :alert => exception.message
    else
      flash[:error] = "Access Denied"
      redirect_to root_url, :alert => exception.message
    end
  end

  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
end
