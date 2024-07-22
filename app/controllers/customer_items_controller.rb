class CustomerItemsController < ApplicationController 

  def create 
    CustomerItem.create(customer_item_params)
    redirect_to "/customers/#{params[:customer_id]}"
  end

  private 
    def customer_item_params
      params.permit(:customer_id, :item_id)
    end

end