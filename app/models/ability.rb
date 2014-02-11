class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? "admin"
      can :manage, :all
    end
    if user.role? "student"
      can :show, User, :id => user.id
    end
    if user.role? "repairman"
      can :show, User, :id => user.id

    end
  end
end
