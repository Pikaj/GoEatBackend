class Location < ActiveRecord::Base
  belongs_to :restaurant
  has_one :address
end
