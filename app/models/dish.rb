class Dish < ActiveRecord::Base
  belongs_to :Menu
  belongs_to :sale
end
