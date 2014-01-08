class RestaurantCategory < ActiveRecord::Base
	has_many :element_restaurant_categories
end
