class CityController < ApplicationController

  def index
    render :json => ["Kleopatra", "U Ryśka","Bar Mleczny MIŚ", "Pizzeria777"]
  end 
  
end
