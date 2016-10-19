class AddColumnFavoritesToUserRestaurants < ActiveRecord::Migration
  def change
    add_column :user_restaurants, :favorite, :boolean
  end
end
