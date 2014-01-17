class IngredientController < ApplicationController
  protect_from_forgery :except => :create 
  skip_before_filter :verify_authenticity_token
  
  def index
    @dish = Dish.find(params[:dish_id])
    render :json => @dish.ingredients.all
  end

  def create
    @dish = Dish.find(params[:dish_id])
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.dish = @ingredient
    render :json => @ingredient
  end

  def update
    @dish = Dish.find(params[:dish_id])
    @ingredient = @dish.ingredient.find(params[:id])
    @ingredient.update
    render :json => @ingredient
  end

  def destroy
    @dish = Dish.find(params[:dish_id])
    @ingredient = @dish.ingredient.find(params[:id])
    @ingredient.destroy
    render :json => @ingredient
  end

  private
    
  def ingredient_params
    params.require(:ingredient).permit(:name, :price)
  end
end
