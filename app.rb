# require 'bundler'
# require 'pry'
# Bundler.require

# require_relative 'connection'

# require_relative 'models/food'
# require_relative 'models/party'
# require_relative 'models/order'
# require_relative 'models/user'


# require_relative 'helpers/link_helper'
# require_relative 'helpers/form_helper'
# helpers ActiveSupport::Inflector



# get '/users/new' do
# 	erb :'users/new'
# end

# post '/users' do
# 	user = User.new(params[:user])
# 	user.password = params[:password]
# 	user.save!
# 	redirect '/profiles'
# end

# get '/profiles' do
# 	@users = User.all
# 	if session[:current_user]
# 		@user = User.find(session[:current_user])
# 		erb :index
# 	else
# 		redirect '/'
# 	end
# end

# #-----------------------------------------

# get '/sessions/new' do
# 	erb :'sessions/new'
# end

# post '/sessions' do
# 	user = User.find_by({username: params[:username]})
# 	if user.password == params[:password]
# 		session[:current_user] = user.id
# 		redirect '/profiles'
# 	else
# 		redirect '/users/new'
# 	end
# end

# delete '/sessions' do
# 	session[:current_user] = nil
# 	redirect '/'
# end
# #-----------------------------------------

# get '/' do
# 	@foods = Food.all
# 	@parties = Party.all
# 	erb :index
# end

# get '/foods' do
# 	@foods = Food.all
# 	erb :'food/index'
# end

# get '/foods/new' do
# 	erb :'food/new'
# end

# post '/foods' do
# 	food = Food.create(params[:food])
# 	if food.valid?
# 		redirect '/foods'
# 	else
# 		@errors = food.errors.full_messages
# 		erb :'food/new'
# 	end
# end

# get '/foods/:id/edit' do
# 	@food = Food.find(params[:id])
# 	erb :'food/edit'
# end

# patch '/foods/:id' do
# 	foods = Food.find(params[:id])
# 	foods.update(params[:food])
# 	redirect '/foods'
# end

# get '/foods/:id' do
# 	@food = Food.find(params[:id])
# 	@food_shows_parties = @food.parties
# 	erb :'food/show'
# end

# delete '/foods/:id' do
# 	Food.delete(params[:id])
# 	redirect '/foods'
# end

# #-----------------------------------------

# get '/parties' do
# 	@parties = Party.where({paid: false})
# 	erb :'party/index'
# end

# get '/parties/new' do
# 	erb :'party/new'
# end

# post '/parties' do
# 	Party.create(params[:party])
# 	redirect '/parties'
# end

# get '/parties/:id/edit' do
# 	@party = Party.find(params[:id])
# 	erb :'party/edit'
# end

# patch '/parties/:id' do
# 	parties = Party.find(params[:id])
# 	parties.update(params[:party])
# 	redirect '/parties'
# end

# get '/parties/:id' do
# 	@party = Party.find(params[:id])
# 	@foods = Food.all
# 	erb :'party/show'
# end

# delete '/parties/:id' do
# 	Party.delete(params[:id])
# 	redirect '/parties'
# end

# #-----------------------------------------

# post '/parties/:id/orders' do
# 	food = Food.where(name: params[:food_name])
# 	party = Party.find(params[:id])
# 	party.foods << food
# 	redirect "/parties/#{party.id}"
# end

# delete '/parties/:party_id/orders' do
# 	party_id = params[:party_id]
# 	Order.delete(params[:order_id])
# 	redirect "/parties/#{party_id}"
# end

# get '/parties/:id/receipt' do
# 	@party = Party.find(params[:id])
# 	erb :'party/receipt'
# end

# patch '/parties/:id/paybill' do
# 	party = Party.find(params[:id])
# 	party.paid = true
# 	party.save
# 	redirect '/foods'
# end

# patch '/orders/:id/dontlikethis' do
# 	order = Order.find(params[:id])
# 	order.charge = false
# 	order.save
# 	redirect "/parties/#{order.party_id}"
# end