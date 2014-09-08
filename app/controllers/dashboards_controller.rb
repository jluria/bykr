class DashboardsController < ApplicationController
  def show
    @locations = current_user.locations.all
  end
end
