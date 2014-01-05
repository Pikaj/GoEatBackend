class ElementDishCategory < ActiveRecord::Base
  belongs_to :dish
  belongs_to :DishCategory
end
