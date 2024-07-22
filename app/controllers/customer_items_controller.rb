class CustomerItemsController < ApplicationController
  def new
  end

  def create 
    CustomerItem.create(id: params[:id], item_id: params[:item_id])

    redirect_to "/customers/#{params[:id]}"
  end
end