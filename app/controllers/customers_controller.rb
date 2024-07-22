class CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @items = @customer.items
    @item = Item.new
  end

  def add_item
    @customer = Customer.find(params[:id])
    @item = Item.find(params[:item_id])
    if @item.present?
      @customer.items << @item
      redirect_to customer_path(@customer) 
    end
  end
end