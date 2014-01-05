class ElementRestaurantCategory < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :RestaurantCategory
end
