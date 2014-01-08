class Restaurant < ActiveRecord::Base
  belongs_to :city
  has_many :sales
  has_many :menus
  has_many :comments
  has_one :location
  has_many :element_restaurant_categories
  has_one :user
  has_many :favourites
end
