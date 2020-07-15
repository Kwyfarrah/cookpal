class PagesController < ApplicationController
  def home
    @homecooks = Homecook.all
    if params['search'].present?
      redirect_to homecooks_path(search: params['search']['query'])
    end
  end
end
