require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection ({
	adapter: 'postgresql',
	database: 'restaurant_db'
	})

require_relative 'models/food'
require_relative 'models/party'
require_relative 'models/order'


get '/' do
	redirect '/foods'	
end

get '/foods' do
	@foods = Food.all
	erb :'food/index'
end

get '/foods/new' do
	erb :'food/new'
end

post '/foods' do
	Food.create(params[:food])
	redirect '/foods'
end

get '/foods/:id/edit' do
	@food = Food.find(params[:id])
	erb :'food/edit'
end

patch '/foods/:id' do
	foods = Food.find(params[:id])
	foods.update(params[:food])
	redirect '/foods'
end

get '/foods/:id' do
	@food = Food.find(params[:id])
	erb :'food/show'
end

delete '/foods/:id' do
	Food.delete(params[:id])
	redirect '/foods'
end

#-----------------------------------------

get '/parties' do
	@parties = Party.all
	erb :'party/index'
end

get '/parties/new' do
	erb :'party/new'
end

post '/parties' do
	Party.create(params[:party])
	redirect '/parties'
end

get '/parties/:id/edit' do
	@party = Party.find(params[:id])
	erb :'party/edit'
end

patch '/parties/:id' do
	parties = Party.find(params[:id])
	parties.update(params[:party])
	redirect '/parties'
end

get '/parties/:id' do
	@party = Party.find(params[:id])
	erb :'party/show'
end

delete '/parties/:id' do
	Party.delete(params[:id])
	redirect '/parties'
end

#-----------------------------------------

# Creates a new order
post '/order' do

	@food = Food.find(params[:id])
	# food = Food.find(params[:id])
	@party = Party.find(params[:id])
	party.foods << food
	redirect '/parties'
  # get food by id 
  # food = Food.find(params[:id])
  # get party by id 

  # party.foods << food
end

