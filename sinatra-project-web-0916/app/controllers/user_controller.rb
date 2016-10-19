class UserController < ApplicationController
  get('/users') do
    @users = User.all
    erb :'users/index.html'
  end

  post('/users') do
    @user = User.create(name:params[:name])
    redirect to "/users/#{@user.id}"
  end

  get('/users/new') do
    erb :'users/new.html'
  end

  get('/users/:id') do
    @user = User.find(params[:id])
    erb :'users/show.html'
  end

  patch('/users/:id') do
    @user = User.find(params[:id])
    @user.update(params[:user])
    redirect to "/users/#{@user.id}"
  end

  delete('/users/:id') do
    binding.pry
    @user = User.delete(params[:id])
    redirect to "/users"
  end

  get('/users/:id/edit') do
    @user = User.find(params[:id])
    erb :'users/edit.html'
  end


end
