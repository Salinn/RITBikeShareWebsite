class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? "admin"
      can :manage, :all
    else
      can :show, User, :id => user.id
      can :update, User, :id => user.id
      can :create, FeedbackForm

      if user.role? "repairman"
        can :create, MaintenanceReport
        can :read, Bike
        can :read, MaintenanceReport
      end

      if user.role? "checkout_person"
        can :create, CheckedOut
        can :update, CheckedOut
      end
    end
  end
end
