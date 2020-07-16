class ReservationsController < ApplicationController
  # skip_before_action :authenticate_user!, only:
  def index
    @reservations = Reservation.all
    @homecook = Homecook.new
  end

end
