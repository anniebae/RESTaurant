class FoodsController < ApplicationController
  get '/' do
    @foods = Food.all
    erb :'food/index'
  end

  get '/new' do
    erb :'food/new'
  end

  post '/' do
    food = Food.create(params[:food])
    if food.valid?
      redirect '/foods'
    else
      @errors = food.errors.full_messages
      erb :'food/new'
    end
  end

  get '/:id/edit' do
    @food = Food.find(params[:id])
    erb :'food/edit'
  end

  patch '/:id' do
    foods = Food.find(params[:id])
    foods.update(params[:food])
    redirect '/foods'
  end

  get '/:id' do
    @food = Food.find(params[:id])
    @food_shows_parties = @food.parties
    erb :'food/show'
  end

  delete '/:id' do
    Food.delete(params[:id])
    redirect '/foods'
  end

end