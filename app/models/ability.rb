# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new  # Guest user (not logged in)

    case user.access_level
    when 'admin'
      can :manage, :all
    when 'user'
      can :read, Movie
    else
      can :read, Movie
    end

  end
end
