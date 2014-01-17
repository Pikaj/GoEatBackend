class SaleController < ApplicationController
  protect_from_forgery :except => :create 
  skip_before_filter :verify_authenticity_token
  
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    render :json => @restaurant.Sale.all
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @sale = Sale.new(sale_params)
    @sale.restaurant = @restaurant
    render :json => @sale
  end 

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.sale.update(sale_params)
    render :json => @sale
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @sale = @restaurant.sale.find(params[:id])
    @sale.destroy
    render :json => @restaurant.sale
  end

  private
    
  def sale_params
    params.require(:sale).permit(:date_from, :date_to, :description)
  end
end

end
