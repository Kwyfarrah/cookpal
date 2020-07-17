class HomecooksController < ApplicationController
  before_action :find_user, only: [:update]
  before_action :find_homecook, only: [:destroy]
  before_action :find_user, only: [:create, :update]
  before_action :find_homecook, only: [:edit, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    search = params['search']
    if search.present?
      @address = params['search']
      @homecooks = policy_scope(Homecook).joins(:user).where("users.address ILIKE ?", "%#{@address}%")
    else
      @homecooks = policy_scope(Homecook)
    end
  end

  def show
  end

  def create
    @homecook = Homecook.new(homecook_params)
    @homecook.user = current_user
    @homecook.save
    raise
    redirect_to reservations_path
    authorize @homecook

    @homecook.save
    redirect_to homecook_path(@homecook) #,notice:'Your homecook was successfully created.'
  end

  def edit
  end

  def update
    @homecook.update(homecook_params)
    redirect_to homecooks_path
    authorize @homecook #,notice:'Your homecook was successfully edited.'
  end

  def destroy
    @homecook.destroy
    redirect_to homecooks_path #,notice:'Your homecook was successfully deleted.'
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_homecook
    @homecook = Homecook.find(params[:id])
    authorize @homecook
  end

  def homecook_params
    params.require(:homecook).permit(:price_per_person, :user_id, :introduction)
  end
end
