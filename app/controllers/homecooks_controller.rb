class HomecooksController < ApplicationController
  before_action :find_user, only: [:update]

  before_action :find_homecook, only: [:edit, :destroy, :show]

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    search = params['search']
    if search.present?
       @homecooks_search = policy_scope(Homecook).search_info(search)
    else
       @homecooks_search = policy_scope(Homecook)
    end

    if params['option'] == "ASC"
        @homecooks = @homecooks_search.order('price_per_person ASC')
      elsif params['option'] == "DESC"
        @homecooks = @homecooks_search.order('price_per_person DESC')
      else
        @homecooks = @homecooks_search
    end
  end


  def show
    @reservation = Reservation.new
  end

  def create
    @homecook = Homecook.new(homecook_params)
    @homecook.user = current_user
    authorize @homecook
    @homecook.save
    redirect_to reservations_path #,notice:'Your homecook was successfully created.'
  end

  def edit
  end

  def update
    authorize @homecook
    @homecook.update(homecook_params)
    redirect_to homecooks_path #,notice:'Your homecook was successfully edited.'
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
    params.require(:homecook).permit(:price_per_person, :user_id, :introduction, photos: [], tag_list: [])
  end
end
