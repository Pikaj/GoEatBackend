class ElementDishCategory < ActiveRecord::Base
  belongs_to :dish
  belongs_to :dish_category
end
