class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    can :view, :home
    can :view, :admin_home if user.role? "admin"

    if user.role? "admin"
      can :manage, :all
      can :view,:admin_home
    end
    if user.role? "student"
      can :read, :all
    end
  end
end
