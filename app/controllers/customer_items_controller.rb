class CustomerItemsController < ApplicationController
  def create
    customer = Customer.find(params[:customer_id])
    item = Item.find(params[:item_id])
    
    CustomerItem.create!(customer: customer, item: item)

    redirect_to "/customers/#{customer.id}"
  end

end