class PagesController < ApplicationController
  def home
    @homecooks = Homecook.all
    @search = params['search']
    redirect_to homecooks_path(@search)
  end
end
