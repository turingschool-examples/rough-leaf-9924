class CustomerItemsController < ApplicationController
  def new
  end

  def create 
    CustomerItem.create(customer_id: params[:id], item_id: params[:item])

    redirect_to "/customers/#{params[:id]}"
  end
end