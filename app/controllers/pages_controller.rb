class PagesController < ApplicationController
  def home
    @homecooks = Homecook.all
    @search = params['search']
    redirect_to homecooks_path(@search)

  # # In the homecook controller
  # def index
  #   if @search.present?
  #     @address = @search['query']
  #     @homecook = User.where("address ILIKE ?", "%#{@address}%").homecook
  #   else
  #     @homecook = Homecook.all
  #   end
  # endå
  end
