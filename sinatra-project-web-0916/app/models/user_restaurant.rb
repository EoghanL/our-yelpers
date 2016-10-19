# == Schema Information
#
# Table name: user_restaurants
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  restaurant_id :integer
#

class UserRestaurant < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
end
