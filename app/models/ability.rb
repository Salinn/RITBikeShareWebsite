class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? "admin"
      can :manage, :all
    end
    if user.role? "student"
      can :show, User do |user_page|
        user_page.try(:user) == user
      end
    end
  end
end
