class ReservationsController < ApplicationController
  # skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @reservations = Reservation.all
    @homecook = Homecook.new
    @reservations = policy_scope(Reservation)
  end

  def update
    query = params[:id]
    @reservation = Reservation.find(query)
    authorize @reservation
    @reservation.status = params[:status]
    @reservation.save
  end
end
