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
    @restaurants = []
    @searcher = {}
    params[:yelp].map do |k,v|
      @searcher[k]=v unless k=="city"
    end
    @searcher[:category_filter]="food"
# binding.pry
    @restaurants = YelpApi.search(@searcher,params[:yelp][:city]).businesses
    erb :'restaurants/yelp_results.html'
  end

  post('/restaurants/new/yelp') do
    @restaurant = Restaurant.create(params[:restaurant])
    redirect to "/restaurants/#{@restaurant.id}"
  end

  get('/restaurants/new') do
    erb :'restaurants/new.html'
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

  post('/restaurants/:id/addfav') do
    @restaurant = Restaurant.find(params[:id])
    @user = User.find(params[:user_id])
    @userfav = UserRestaurant.find_or_create_by(user_id:@user.id,restaurant_id:@restaurant.id)
    # binding.pry
    @userfav.update(favorite:true)
    # binding.pry
    # @user.user_restaurants

    redirect to "/restaurants/#{@restaurant.id}"
  end

end
