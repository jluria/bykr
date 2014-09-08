class RoutesController < ApplicationController
  def show
    @starting_location = Location.find(params[:starting_location])
    @ending_location = Location.find(params[:ending_location])
  end
end
