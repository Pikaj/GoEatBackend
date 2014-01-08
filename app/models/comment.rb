class Comment < ActiveRecord::Base
  belongs_to :restaurant
  has_one :user
end
