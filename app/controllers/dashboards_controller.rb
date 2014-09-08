class DashboardsController < ApplicationController
  def show
    @locations = Location.all
  end
end
