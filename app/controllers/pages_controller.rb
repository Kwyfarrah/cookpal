class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @homecooks = Homecook.all.order('created_at DESC').limit(9)
    if params['search'].present?
      redirect_to homecooks_path(search: params['search']['query'])
    end
  end
end
