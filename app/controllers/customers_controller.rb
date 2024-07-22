class CustomersController < ApplicationController
  def show
    @customers = Customer.find(params[:id])
  end

  def create
    @customer = Customer.find(params[:id])
    item = Item.find(params[:item_id])
    @customer.add_item(item.id)
    redirect_to "/customers/#{params[:id]}"
  end
end