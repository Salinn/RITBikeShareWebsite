class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      #Authorize all actions
      can :manage, User
    else
      #authorize only self modifications and restrict access to admin_home
      can :manage, User, :id => user.id
      cannot :admin_home, User
    end
  end
end
