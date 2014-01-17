class MenuController < ApplicationController
  protect_from_forgery :except => :create 
  skip_before_filter :verify_authenticity_token


  def dishes
    @menu = Menu.find(params[:id])
    render :json => @menu.dishes
  end

  def create
    params[:menu]
    @menu = Menu.new(menu_params)
    #@menu.restaurant = Restaurant.find(params[:restaurant_id])
    @menu.restaurant_id = params[:restaurant_id]
    @menu.restaurant_id = params[:menu][:restaurant_id]

    render :json => @menu
  end 

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.menu.update(menu_params)
    render :json => @menu
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = @restaurant.menu.find(params[:id])
    @menu.destroy
    render :json => @restaurant.menu
  end

  private
    
  def menu_params
    params.require(:menu).permit(:description, :restaurant_id)
  end
end
