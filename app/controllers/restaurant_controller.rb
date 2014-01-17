class RestaurantController < ApplicationController
  protect_from_forgery :except => :create 
  skip_before_filter :verify_authenticity_token

  def index
    @city = City.find(params[:menu_id])
    render :json => @city.restaurants.all
  end
  
  def create
    @city = City.find(params[:city_id])
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.city = @city
    render :json => @restaurant
  end 

  def my_restaurants
    @restaurants = Restaurant.where(:user_id => current_user.id)
    render :json => @restaurants
  end 

  def my_favourites
    @favourites = Favourites.where(:user_id => current_user.id)
    @restaurants = Restaurant.where(:id => favourites)
    render :json => @restaurants
  end 

  def update
    @city = City.find(params[:city_id])
    @city.restaurant.update(restuarant_params)
    render :json => @restaurant
  end

  def destroy
    @city = City.find(params[:city_id])
    @restaurant = @city.restaurant.find(params[:id])
    @restaurant.destroy
    render :json => @city.restaurant
  end

  def menus
    @city = City.find(params[:city_id])
    render :json => @city.restaurant.menus.all
  end

  private
    
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :rating, :number_ratings)
  end
end
