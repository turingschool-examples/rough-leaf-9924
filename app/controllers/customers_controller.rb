class Customers < ApplicationController
  def show 
    @customer = Customer.find(params[:id])
  end
end