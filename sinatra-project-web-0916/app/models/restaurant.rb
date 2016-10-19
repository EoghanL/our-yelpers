# == Schema Information
#
# Table name: restaurants
#
#  id      :integer          not null, primary key
#  name    :string
#  rating  :integer
#  address :string
#

class Restaurant < ActiveRecord::Base
  has_many :user_restaurants
  has_many :users, through: :user_restaurants
end
