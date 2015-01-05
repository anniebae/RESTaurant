require 'sinatra/base'

class ApplicationController < Sinatra::Base
  helpers Sinatra::AuthenticationHelper
  helpers Sinatra::FormHelper
  helpers Sinatra::LinkHelper
  helpers ActiveSupport::Inflector

  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/restaurant_db')

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)
  enable :sessions, :method_override
  get '/' do
    @foods = Food.all
    @parties = Party.all
    if current_user
      erb :authenticated
    else
      erb :not_authenticated
    end
  end
end
