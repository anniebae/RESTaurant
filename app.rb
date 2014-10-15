require 'bundler'
require 'pry'
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
	@food_shows_parties = @food.parties
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
	# @party_shows_foods = @party.foods
	@foods = Food.all
	# get all foods so i can create drop 
	# down menu to add foods to a party 

	erb :'party/show'



end

delete '/parties/:id' do
	Party.delete(params[:id])
	redirect '/parties'
end

#-----------------------------------------

# Creates a new order
post '/parties/:id/orders' do
	food = Food.where(name: params[:food_name])
	party = Party.find(params[:id])
	party.foods << food
	# Order.create({
	# 	food_id: food.first.id,
	# 	party_id: party.id
	# })
	redirect "/parties/#{party.id}"
  # get food by id 
  # food = Food.find(params[:id])
  # get party by id 
  # party.foods << food
end


# step 1
# in the show page for a party, you need all
# of the food items, maybe store in instance 
# instance variable? 
# step 2
# show all foods in a form on the party show page
# step 3
# when form is submitted, what parameters does it need?
# at the very least, i can think of the 
# food_id and party_id


# *** NOT RIGHT ***
patch '/orders/:id' do
	orders = Order.find(params[:id])
	orders.update(params[:orders])
	redirect '/orders'
end
# *** NOT RIGHT ***