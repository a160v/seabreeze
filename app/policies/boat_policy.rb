class BoatPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    user.present?
  end

  # def update?
  #   record.user == user
  #   # record: the boat passed to the `authorize` method in controller
  #   # user: the `current_user` signed in with Devise
  # end

  # def destroy?
  #   record.user == user
  # end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
