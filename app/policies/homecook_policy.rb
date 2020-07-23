class HomecookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def create?
      true
    end

    def show?
      true  # Anyone can view a restaurant
    end

    def update?
      record.user == user
    end

    def destroy?
      record.user == user
    end
end
