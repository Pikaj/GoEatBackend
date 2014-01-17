class LocationController < ApplicationController

  protect_from_forgery :except => :create 
  skip_before_filter :verify_authenticity_token
  
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @location = Location.new(location_params)
    @location.restaurant = @restaurant
    render :json => @location
  end 

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.location.update(location_params)
    render :json => @location
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @location = @restaurant.location.find(params[:id])
    @location.destroy
    render :json => @restaurant.location
  end

  private
    
  def location_params
    params.require(:location).permit(:coordinates)
  end
end
