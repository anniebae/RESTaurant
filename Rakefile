require 'bundler'
Bundler.require

require 'sinatra/activerecord/rake'

namespace :db do
	require_relative 'connection.rb'
	desc "Create restaurant_db database"
	task :create_db do
		conn = PG::Connection.open()
		conn.exec('CREATE DATABASE
			restaurant_db')
		conn.close
	end

	desc "Drop restaurant_db database"
	task :drop_db do
		conn = PG::Connection.open()
		conn.exec('DROP DATABASE
			restaurant_db;')
	end

	desc "create junk data for development"
	task :junk_data do

		require_relative 'connection'
		require_relative 'models/food'
		require_relative 'models/order'
		require_relative 'models/party'

		Food.create({name: 'Pasta', price: 15})
		Food.create({name: 'Sandwich', price: 11})
		Food.create({name: 'Salad', price: 14})


		Party.create({name: 'Bae', size_of_party: 4})
		Party.create({name: 'Michalakis', size_of_party: 6})
		Party.create({name: 'Haynsworth', size_of_party: 9})
		Party.create({name: 'Turner', size_of_party: 11})
		Party.create({name: 'Smith', size_of_party: 90})

		parties = Party.all
		foods = Food.all
	end
end