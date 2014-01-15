class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.roles? "admin"
      can :manage, :all
    end
    if user.roles? "student"
      can :read, :all
    end
  end
end
