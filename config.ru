
require 'bundler'
Bundler.require(:default)

Dir.glob('./{models,helpers,controllers}/*.rb').each do |file|
	require file
	puts "required #{file}"
end

map('/'){ run ApplicationController }
map('/sessions'){ run SessionsController }
map('/users'){ run UsersController }
map('/parties'){ run PartiesController }
map('/foods'){ run FoodsController }
map('/orders'){ run OrdersController }