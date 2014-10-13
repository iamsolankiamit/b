class Ability
  include CanCan::Ability

  def initialize(user, controller_namespace)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    user ||= User.new # guest user (not logged in)

case controller_namespace
when 'Admin'
  can :manage, :all
else
    if user.role == "admin"
      can :manage, :all
      can :manage, Admin
    elsif user.role == "sunburn_manager"
      can :manage, SunburnSystem
    elsif user.role == "sunburn_affiliate"
      can :read, SunburnSystem
    elsif user.role == "default"
      can :manage, Offer, :user_id => user.id
      can :manage, Trip, :guest_id => user.id
      can :manage, Booking, :trip => { :guest_id  => user.id}
      can :read, Affiliate, :user_id => user.id
      can :create, Booking
      can :manage, Inquiry
      can :manage, Message
      can :manage, :invite
      can :manage, Referral
      can :manage, ReferalEmail
      can :read, Offer
      can :manage, Admin
    else
      can :read, [Offer,User,Booking] # guest user
      can :create, [Offer, Booking]
    end
end
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
