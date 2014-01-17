class DishController < ApplicationController

  protect_from_forgery :except => :create 
  skip_before_filter :verify_authenticity_token
  
  def show
    @menu = Menu.find(params[:menu_id])
    render :json => @menu.dishes.all
  end

  def create
    @menu = Menu.find(params[:menu_id])
    @dish = Dish.new(dish_params)
    @dish.menu = @dish
    render :json => @dish
  end

  def update
    @menu = Menu.find(params[:menu_id])
    @dish = @menu.dish.find(params[:id])
    @dish.update
    render :json => @dish
  end

  def destroy
    @menu = Menu.find(params[:menu_id])
    @dish = @menu.dish.find(params[:id])
    @dish.destroy
    render :json => @dish
  end

  private
    
  def dish_params
    params.require(:dish).permit(:name, :price)
  end
end
