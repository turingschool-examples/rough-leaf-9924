class CustomerItemsController < ApplicationController
  def create
    customer = Customer.find(params[:id])
    item = Item.find(params[:item_id])
    customer.items << item
    redirect_to "/customers/#{customer.id}"
  end
end