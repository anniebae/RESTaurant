class OrdersController < ApplicationController
  patch '/:id/dontlikethis' do
    order = Order.find(params[:id])
    order.charge = false
    order.save
    redirect "/parties/#{order.party_id}"
  end
end