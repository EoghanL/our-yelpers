class RestaurantController < ApplicationController
  get('/restaurants') do
    @restaurants = Restaurant.all
    erb :'restaurants/index.html'
  end

  post('/restaurants') do
    @restaurant = Restaurant.find_or_create_by(name:params[:name],rating:params[:rating],address:params[:address])
    redirect to "/restaurants/#{@restaurant.id}"
  end

  patch('/restaurants') do
    binding.pry
    @restaurants = []
    yelp_restaurants = Yelp.client.search(params[:yelp][:city], { term: params[:yelp][:cuisine],
      category_filter: "food",
      sort: params[:sort],
      radius_filter: params[:s_radius]})
    yelp_restaurants.businesses.each do |business|
      params = { name: business.name, rating: business.rating, address: business.location.address }
      @restaurants<< Restaurant.new(params)
    end
    erb :'restaurants/yelp_results.html'
  end

  get('/restaurants/new') do
    erb :'restaurants/new.html'
  end

  get('/restaurants/yelp') do
    binding.pry
  end

  get('/restaurants/:id') do
    @restaurant = Restaurant.find(params[:id])
    @users = User.all
    erb :'restaurants/show.html'
  end

  post('/restaurants/:id') do
    @restaurant = Restaurant.find(params[:id])
    @user = User.find(params[:user_id])
    @restaurant.users << @user unless @restaurant.users.include?(@user)
    redirect to "/restaurants/#{@restaurant.id}"
  end


  patch('/restaurants/:id') do
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(params[:restaurant])
    redirect to "/restaurants/#{@restaurant.id}"
  end

  delete('/restaurants/:id') do
    @restaurant = Restaurant.delete(params[:id])
    redirect to "/restaurants"
  end

  get('/restaurants/:id/edit') do
    @restaurant = Restaurant.find(params[:id])
    erb :'restaurants/edit.html'
  end

end
