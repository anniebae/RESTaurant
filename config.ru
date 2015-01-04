require 'bundler'
Bundler.require(:default)

require './helpers/authentication_helper'
require './helpers/form_helper'
require './helpers/link_helper'

require './controllers/application_controller'
require './controllers/foods_controller'
require './controllers/orders_controller'
require './controllers/parties_controller'
require './controllers/sessions_controller'
require './controllers/users_controller'

require './models/food'
require './models/order'
require './models/party'
require './models/user'

map('/'){ run ApplicationController }
map('/sessions'){ run SessionsController }
map('/users'){ run UsersController }
map('/parties'){ run PartiesController }
map('/foods'){ run FoodsController }
map('/orders'){ run OrdersController }