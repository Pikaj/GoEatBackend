class AddressController < ApplicationController

  protect_from_forgery :except => :create 
  skip_before_filter :verify_authenticity_token
  
  def create
    @location = Location.find(params[:location_id])
    @address = Address.new(address_params)
    @address.location = @location
    render :json => @address
  end 

  def update
    @location = Location.find(params[:location_id])
    @location.address.update(address_params)
    render :json => @address
  end

  def destroy
    @location = Location.find(params[:location_id])
    @address = @location.address.find(params[:id])
    @address.destroy
    render :json => @location.address
  end

  private
    
  def address_params
    params.require(:address).permit(:street, :number, :postal_code)
  end
end
