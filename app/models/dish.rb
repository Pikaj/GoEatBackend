class Dish < ActiveRecord::Base
  belongs_to :menu
  belongs_to :sale
  has_many :ingredients
  has_many :element_dish_categories
end
