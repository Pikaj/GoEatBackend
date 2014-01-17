class CityController < ApplicationController

  protect_from_forgery :except => :create 
  skip_before_filter :verify_authenticity_token

  # def index
  #   render :json => ["Kleopatra", "U Ryśka","Bar Mleczny MIŚ", "Pizzeria777"]
  # end 
  
  def index
    render :json => City.all
  end

  def create
    @city = City.new(city_params)
    @city.save
    render :json => @city
  end

  def update
    @city = City.find(params[:id])
    @city.update(city_params)
    render :json => @city
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    render :json => @city
  end

  private
    
  def city_params
    params.require(:city).permit(:name,:id)
  end


 # def index
 #   @cities = City.all
 #   respond_to do |format|
 #     format.html 
 #     format.json { @cities }
 #   end
 # end

end
