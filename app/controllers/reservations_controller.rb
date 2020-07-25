class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  before_action :find_homecook, only: [:create]

  def index
    @homecooks = current_user.homecooks
    @homecook = Homecook.new
    @reservations = policy_scope(Reservation).order('updated_at DESC')
  end

  def update
    query = params[:id]
    @reservation = Reservation.find(query)
    authorize @reservation
    @reservation.status = params[:status]
    @reservation.save
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.homecook = @homecook
    authorize @reservation
    @reservation.save
    redirect_to reservations_path(tab: "customer")
  end

  private

  def find_homecook
    @homecook = Homecook.find(params[:homecook_id])
    authorize @homecook
  end

  def reservation_params
    params.require(:reservation).permit(:user_id, :homecook_id, :datetime, :address, :capacity, :description, :status)
  end
end
