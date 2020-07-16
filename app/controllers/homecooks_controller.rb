class HomecooksController < ApplicationController
  before_action :find_user, only: [:update]
  before_action :find_homecook, only: [:destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    search = params['search']
    if search.present?
      @address = params['search']
      @homecooks = Homecook.joins(:user).where("users.address ILIKE ?", "%#{@address}%")
    else
      @homecooks = Homecook.all
    end
  end

  def show
  end

  def create
    @homecook = Homecook.new(home_params)
    @homecook.user_id = current_user
    @homecook.save
    redirect_to reservations_path
  end

  def edit
  end

  def update
    @homecook.update(task_params)
    redirect_to homecooks_path
  end

  def destroy
    @homecook.destroy
    redirect_to homecooks_path
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_homecook
    @homecook = Homecook.find(params[:id])
  end

  def home_params
    params.require(:homecook).permit(:price_per_person, :user_id, :introduction)
  end
end
