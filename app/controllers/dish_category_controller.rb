class DishCategoryController < ApplicationController

  protect_from_forgery :except => :create 
  skip_before_filter :verify_authenticity_token
  
  def index
    render :json => DishCategory.all
  end

  def create
    @dishCategory = DishCategory.new(dishCategory_params)
    render :json => @dishCategory
  end

  def update
    @dishCategory = DishCategory.find(params[:id])
    @dishCategory.update(dishCategory_params)
    render :json => @dishCategory
  end

  def destroy
    @dishCategory = DishCategory.find(params[:id])
    @dishCategory.destroy
    render :json => @dishCategory
  end

  private
    
  def dishCategory_params
    params.require(:dish).permit(:name)
  end
end
