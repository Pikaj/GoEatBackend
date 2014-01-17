class RestaurantCategoryController < ApplicationController
  protect_from_forgery :except => :create 
  skip_before_filter :verify_authenticity_token
  
  def index
    render :json => RestaurantCategory.all
  end

  def create
    @restaurantCategory = RestaurantCategory.new(restaurantCategory_params)
    render :json => @restaurantCategory
  end

  def update
    @restaurantCategory = RestaurantCategory.find(params[:id])
    @restaurantCategory.update(restaurantCategory_params)
    render :json => @restaurantCategory
  end

  def destroy
    @restaurantCategory = RestaurantCategory.find(params[:id])
    @restaurantCategory.destroy
    render :json => @restauranthCategory
  end

  private
    
  def restaurantCategory_params
    params.require(:restaurant).permit(:name)
  end
end
