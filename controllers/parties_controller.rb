class PartiesController < ApplicationController

  get '/' do
    authenticate!
    @parties = Party.where({paid: false})
    erb :'party/index'
  end

  get '/new' do
    erb :'party/new'
  end

  post '/' do
    Party.create(params[:party])
    redirect '/parties'
  end

  get '/:id/edit' do
    @party = Party.find(params[:id])
    erb :'party/edit'
  end

  patch '/:id' do
    parties = Party.find(params[:id])
    parties.update(params[:party])
    redirect '/parties'
  end

  get '/:id' do
    @party = Party.find(params[:id])
    @foods = Food.all
    erb :'party/show'
  end

  delete '/:id' do
    Party.delete(params[:id])
    redirect '/parties'
  end

  post '/:id/orders' do
    food = Food.where(name: params[:food_name])
    party = Party.find(params[:id])
    party.foods << food
    redirect "/parties/#{party.id}"
  end

  delete '/:party_id/orders' do
    party_id = params[:party_id]
    Order.delete(params[:order_id])
    redirect "/parties/#{party_id}"
  end

  get '/:id/receipt' do
    @party = Party.find(params[:id])
    erb :'party/receipt'
  end

  patch '/:id/paybill' do
    party = Party.find(params[:id])
    party.paid = true
    party.save
    redirect '/foods'
  end

end