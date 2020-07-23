class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def update?
    true
    # record.homecook == user
  end

  def homecook?
    # if the user has homecook_id or no?
    user.homecook
  end
end
