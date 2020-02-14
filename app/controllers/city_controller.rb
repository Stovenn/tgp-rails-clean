class CityController < ApplicationController

  def show
    @city = City.find(params[:id])
    @users = City.find(params[:id]).users
    # @gossips = @users.gossips
  end

end
