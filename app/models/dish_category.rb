class DishCategory < ActiveRecord::Base
	has_many :element_dish_categories
end
