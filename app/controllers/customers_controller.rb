class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def items
    @customer = Customer.find(params[:customer_id])
    @items = @customer.items
  end
end