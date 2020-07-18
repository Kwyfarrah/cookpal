class ReservationsController < ApplicationController
  # skip_before_action :authenticate_user!, only:
  def index
    @reservations = Reservation.all
    @homecook = Homecook.new
    @reservations = policy_scope(Reservation)
  end

  def update
    query = params[:id]
    @reservation = Reservation.find(query)
    status = params[:status]
    if status == “accept”
      @reservation.status = 'accept'
      @reservation.save

    else
      @reservation.status = 'reject'
      @reservation.save
    end
    redirect to reservations_path
    authorize @reservation
  end
end
