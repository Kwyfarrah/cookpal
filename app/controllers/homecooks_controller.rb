class HomecooksController < ApplicationController
  before_action :find_user, only: [:create, :update]
  before_action :find_homecook, only: [:destroy]

  def index
    search = params['search']
    if search.present?
      @address = search['query']
      @homcooks = User.where("address ILIKE ?", "%#{@address}%").map do |user|
        user.homecooks
      end
    else
      @homecooks = Homecook.all
    end
  end

  def show
  end

  def create
    @homecook = Homecook.new(home_params)
    # @homecook.user = @user
    @homecook.save
    redirect_to homecook_path(@cocktail)
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

  def cock_params
    params.require(:homecook).permit(:price_per_person, :user_id, :introduction)
  end
end
